package com.ece.pfe.views;

import android.content.Intent;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.CountDownTimer;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ListAdapter;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import android.widget.Toast;

import com.ece.pfe.MainActivity;
import com.ece.pfe.R;
import com.ece.pfe.helper.HttpHandler;
import com.ece.pfe.model.Patient;
import com.jjoe64.graphview.GraphView;
import com.jjoe64.graphview.GridLabelRenderer;
import com.jjoe64.graphview.series.DataPoint;
import com.jjoe64.graphview.series.DataPointInterface;
import com.jjoe64.graphview.series.LineGraphSeries;
import com.jjoe64.graphview.series.OnDataPointTapListener;
import com.jjoe64.graphview.series.Series;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Handler;

public class DetailsPatientActivity extends AppCompatActivity {
    private String TAG = DetailsPatientActivity.class.getSimpleName();
    ArrayList<HashMap<String, String>> contactList;
    private List<Patient> patients_2;
    ArrayList<String> weights;
    ArrayList<String> tares;
    ArrayList<String> start_get;
    private Patient patient;
    private String tare;
    private String push_tare = "No";
    private String push_sync = "No";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_details_patient);

        //Get patient selected details
        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            patient = (Patient) extras.get("Patient");
        }

        //Init function back button
        ImageButton backButton = (ImageButton) findViewById(R.id.backButton);
        backButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                finish();
            }
        });

        //Init function tare button
        Button tareBtn = (Button) findViewById(R.id.refreshBtn);
        tareBtn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                        push_tare = "Yes";
                        tare= "Yes";
                        new GetTare().execute();
            }
        });

        //Init function sync button
        Button sync = (Button) findViewById(R.id.syncButton);
        sync.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                push_sync = "Yes";
                new GetStart().execute();
            }
        });

        //Lauch request to get weights information
        new GetWeight().execute();

        //Init patient details (name/room) to screen
        TextView patient_name = (TextView)findViewById(R.id.patientName);
        patient_name.setText(patient.getFirstName());
        TextView patient_room = (TextView)findViewById(R.id.patientRoom);
        patient_room.setText(patient.getRoom());

    }

    //Function to generate au list of weight to adapt to graph
    private DataPoint[] generateData() {
        DataPoint[] values = new DataPoint[weights.size()];
        for (int i=0; i<weights.size(); i++) {
            int x = i;
            double y= Double.parseDouble(weights.get(weights.size()-1-i));
            DataPoint v = new DataPoint(x, y);
            values[i] = v;
        }
        return values;
    }

    //Class lauched in background to get weights from database
    private class GetWeight extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            //Toast.makeText(DetailsPatientActivity.this,"Json Data is downloading",Toast.LENGTH_LONG).show();

        }

        @Override
        protected Void doInBackground(Void... arg0) {
            patients_2 = new ArrayList<>();
            weights = new ArrayList<>();


            HttpHandler sh = new HttpHandler();
            // Making a request to url and getting response
            String url = "http://192.168.137.1:80/EHPAD/get_resident_details_by_room.php?room="+patient.getRoom();
            String jsonStr = sh.makeServiceCall(url);

            Log.e(TAG, "Response from url: " + jsonStr);
            if (jsonStr != null) {
                try {
                    JSONObject jsonObj = new JSONObject(jsonStr);

                    // Getting JSON Array node
                    JSONArray contacts = jsonObj.getJSONArray("residents");

                    // looping through All weights
                    for (int i = 0; i < contacts.length(); i++) {
                        JSONObject c = contacts.getJSONObject(i);
                        String id = c.getString("id");
                        String room = c.getString("room");
                        String name = c.getString("name");
                        String weight = c.getString("weight");
                        String date = c.getString("datetime");

                        // tmp hash map for single weight
                        HashMap<String, String> contact = new HashMap<>();

                        // adding each child node to HashMap key => value
                        contact.put("id", id);
                        contact.put("name", name);
                        contact.put("room", room);
                        contact.put("weight", weight);

                        //Create a list with resident's weights
                        weights.add(weight);
                        patients_2.add(0, new Patient("0", id, name, "lastname","birthday",room,weight,date));

                    }
                } catch (final JSONException e) {
                    Log.e(TAG, "Json parsing error: " + e.getMessage());
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            Toast.makeText(getApplicationContext(),
                                    "Json parsing error: " + e.getMessage(),
                                    Toast.LENGTH_LONG).show();
                        }
                    });

                }

            } else {
                Log.e(TAG, "Couldn't get json from server.");
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(getApplicationContext(),
                                "Couldn't get json from server. Check LogCat for possible errors!",
                                Toast.LENGTH_LONG).show();
                    }
                });
            }

            return null;
        }

        @Override
        protected void onPostExecute(Void result) {
            super.onPostExecute(result);
            //Adapt view when async finished
            TextView last_weight = (TextView)findViewById(R.id.lastWeightTxt);
            last_weight.setText(weights.get(0)+" kg");

            //Get a focus of -/+10 for graph
            double minus = Double.parseDouble(weights.get(0))- 10;
            double max = Double.parseDouble(weights.get(0))+ 10;

            //Create a new graph with new data
            GraphView graph = (GraphView) findViewById(R.id.graph);
            graph.removeAllSeries();
            LineGraphSeries<DataPoint> series = new LineGraphSeries<>(generateData());
            series.setThickness(2);
            series.setColor(Color.BLUE);
            graph.getGridLabelRenderer().setGridColor(Color.LTGRAY);
            graph.getGridLabelRenderer().setGridStyle(GridLabelRenderer.GridStyle.NONE);
            graph.getViewport().setDrawBorder(true);
            graph.getViewport().setScalable(true);
            graph.getViewport().setScrollable(true);
            graph.getViewport().setYAxisBoundsManual(true);
            graph.animate();
            graph.getViewport().setMinY(minus);
            graph.getViewport().setMaxY(max);
            graph.getViewport().setXAxisBoundsManual(true);
            graph.getViewport().setMinX(weights.size()-50);
            graph.getViewport().setMaxX(weights.size());
            graph.addSeries(series);
        }
    }

    //Send tare request to database / Receive if tare success
    private class GetTare extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            //Toast.makeText(DetailsPatientActivity.this,"Json Data is downloading",Toast.LENGTH_LONG).show();

        }

        @Override
        protected Void doInBackground(Void... arg0) {
            patients_2 = new ArrayList<>();
            tares = new ArrayList<>();



            HttpHandler sh = new HttpHandler();
            // Making a request to url and getting response
            String url = "http://192.168.137.1:80/EHPAD/get_tare_by_room?room="+patient.getRoom();
            String url_update = "http://192.168.137.1:80/EHPAD/update_rpi_room.php?room="+patient.getRoom()+"&tare=Yes";
            String jsonStr = sh.makeServiceCall(url);

            Log.e(TAG, "Response from url: " + jsonStr);
            if (jsonStr != null) {
                try {
                    JSONObject jsonObj = new JSONObject(jsonStr);

                    // Getting JSON Array node
                    JSONArray contacts = jsonObj.getJSONArray("rpis");

                    // looping through All Contacts
                    for (int i = 0; i < contacts.length(); i++) {
                        JSONObject c = contacts.getJSONObject(i);

                        String name = c.getString("name");
                        String tare = c.getString("tare");



                        // tmp hash map for single contact
                        HashMap<String, String> contact = new HashMap<>();

                        // adding each child node to HashMap key => value
                        contact.put("name", name);
                        contact.put("tare", tare);

                        //Get tare informations (tare = YES or NO)
                        tares.add(tare);

                    }
                } catch (final JSONException e) {
                    Log.e(TAG, "Json parsing error: " + e.getMessage());
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            Toast.makeText(getApplicationContext(),
                                    "Json parsing error: " + e.getMessage(),
                                    Toast.LENGTH_LONG).show();
                        }
                    });

                }

            } else {
                Log.e(TAG, "Couldn't get json from server.");
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(getApplicationContext(),
                                "Couldn't get json from server. Check LogCat for possible errors!",
                                Toast.LENGTH_LONG).show();
                    }
                });
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void result) {
            super.onPostExecute(result);
            //Check if button clicked or not / if it is, wait for raspberrys response
            if(tares.get(0).equals("No") && push_tare.equals("Yes")){
                Button tareBtn = (Button) findViewById(R.id.refreshBtn);
                tareBtn.setBackgroundColor(getResources().getColor(R.color.colorPrimaryDark));
                HttpHandler sh = new HttpHandler();
                String url_update = "http://192.168.137.1:80/EHPAD/update_rpi_tare_room.php?room="+"'"+patient.getRoom()+"'"+"&tare="+"'"+tare+"'";

                sh.makeServiceCall(url_update);
                Toast.makeText(getApplicationContext(),
                        "Start tare",
                        Toast.LENGTH_LONG).show();
                tareBtn.setEnabled(false);
                new GetTare().execute();
                push_tare = "No";
            }else if(tares.get(0).equals("Yes") && push_tare.equals("No")){
                new GetTare().execute();

            }else if(tares.get(0).equals("No") && push_tare.equals("No")){
                Button tareBtn = (Button) findViewById(R.id.refreshBtn);
                tareBtn.setBackgroundColor(getResources().getColor(R.color.colorPrimary));
                Toast.makeText(getApplicationContext(),
                        "Tare success",
                        Toast.LENGTH_LONG).show();
                push_tare = "No";
                tareBtn.setEnabled(true);
                new GetWeight().execute();
            }else if(tares.get(0).equals("Yes") && push_tare.equals("Yes")){
                Toast.makeText(getApplicationContext(),
                        "Wait...",
                        Toast.LENGTH_LONG).show();
                new GetTare().execute();
            }
        }
    }

    //Async to request start to raspberrys
    private class GetStart extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            //Toast.makeText(DetailsPatientActivity.this,"Json Data is downloading",Toast.LENGTH_LONG).show();

        }

        @Override
        protected Void doInBackground(Void... arg0) {
            patients_2 = new ArrayList<>();
            start_get = new ArrayList<>();



            HttpHandler sh = new HttpHandler();
            // Making a request to url and getting response
            String url = "http://192.168.137.1:80/EHPAD/get_get_value_by_room?room="+patient.getRoom();
            String jsonStr = sh.makeServiceCall(url);

            Log.e(TAG, "Response from url: " + jsonStr);
            if (jsonStr != null) {
                try {
                    JSONObject jsonObj = new JSONObject(jsonStr);

                    // Getting JSON Array node
                    JSONArray contacts = jsonObj.getJSONArray("rpis");

                    // looping through All start
                    for (int i = 0; i < contacts.length(); i++) {
                        JSONObject c = contacts.getJSONObject(i);

                        String name = c.getString("name");
                        String get_value = c.getString("get_value");



                        // tmp hash map for single start
                        HashMap<String, String> contact = new HashMap<>();

                        // adding each child node to HashMap key => value
                        contact.put("name", name);
                        contact.put("get_value", get_value);

                        //get start informations (start = YES or NO)
                        start_get.add(get_value);

                    }
                } catch (final JSONException e) {
                    Log.e(TAG, "Json parsing error: " + e.getMessage());
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            Toast.makeText(getApplicationContext(),
                                    "Json parsing error: " + e.getMessage(),
                                    Toast.LENGTH_LONG).show();
                        }
                    });

                }

            } else {
                Log.e(TAG, "Couldn't get json from server.");
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(getApplicationContext(),
                                "Couldn't get json from server. Check LogCat for possible errors!",
                                Toast.LENGTH_LONG).show();
                    }
                });
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void result) {
            super.onPostExecute(result);
            //Check if start clicked or not / Wait for the second click to stop
            if(start_get.get(0).equals("No") && push_sync.equals("Yes")){
                Button sync = (Button) findViewById(R.id.syncButton);
                sync.setBackgroundColor(getResources().getColor(R.color.colorPrimaryDark));
                HttpHandler sh = new HttpHandler();
                String url_update = "http://192.168.137.1:80/EHPAD/update_rpi_value_room.php?room="+"'"+patient.getRoom()+"'"+"&get_value="+"'"+"Yes"+"'";

                sh.makeServiceCall(url_update);
                Toast.makeText(getApplicationContext(),
                        "Start",
                        Toast.LENGTH_LONG).show();
                push_sync = "No";
            }else if(start_get.get(0).equals("Yes") && push_sync.equals("No")){
                Toast.makeText(getApplicationContext(),
                        "Error",
                        Toast.LENGTH_LONG).show();

            }else if(start_get.get(0).equals("No") && push_sync.equals("No")){

                Toast.makeText(getApplicationContext(),
                        "Error",
                        Toast.LENGTH_LONG).show();
            }else if(start_get.get(0).equals("Yes") && push_sync.equals("Yes")){
                Button sync = (Button) findViewById(R.id.syncButton);
                sync.setBackgroundColor(getResources().getColor(R.color.colorPrimary));
                HttpHandler sh = new HttpHandler();
                String url_update = "http://192.168.137.1:80/EHPAD/update_rpi_value_room.php?room="+"'"+patient.getRoom()+"'"+"&get_value="+"'"+"No"+"'";

                sh.makeServiceCall(url_update);
                push_sync = "No";
                Toast.makeText(getApplicationContext(),
                        "Stop",
                        Toast.LENGTH_LONG).show();
                new GetWeight().execute();
            }
        }
    }
}
