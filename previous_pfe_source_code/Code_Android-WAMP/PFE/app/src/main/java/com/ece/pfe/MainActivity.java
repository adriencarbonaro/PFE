package com.ece.pfe;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

import com.ece.pfe.helper.HttpHandler;
import com.ece.pfe.model.Patient;
import com.ece.pfe.views.DetailsPatientActivity;
import com.ece.pfe.views.HomeActivity;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    private String TAG = MainActivity.class.getSimpleName();
    private ListView lv;
    private List<Patient> patients;
    private int j;
    private int y = 0;
    ArrayList<String> listRoom;

    ArrayList<HashMap<String, String>> contactList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        patients = new ArrayList<>();

        contactList = new ArrayList<>();
        listRoom = new ArrayList<>();
        listRoom.add("0");
        lv = (ListView) findViewById(R.id.list);

        new GetContacts().execute();

        Button refresh = (Button) findViewById(R.id.refreshBtn);
        refresh.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                new GetContacts().execute();
            }
        });

        lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position,
                                    long id) {
                Intent intent = new Intent(MainActivity.this, DetailsPatientActivity.class);
                intent.putExtra("Patient", patients.get((patients.size()-1)-position));
                startActivity(intent);
            }
        });
    }

    //AsyncTask to get all resident details in database, organize them by room number
    private class GetContacts extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            Toast.makeText(MainActivity.this,"Json Data is downloading",Toast.LENGTH_LONG).show();

        }

        @Override
        protected Void doInBackground(Void... arg0) {



            HttpHandler sh = new HttpHandler();
            // Making a request to url and getting response
            String url = "http://192.168.137.1:80/EHPAD/get_all_resident.php";
            String jsonStr = sh.makeServiceCall(url);

            Log.e(TAG, "Response from url: " + jsonStr);
            if (jsonStr != null) {
                try {
                    JSONObject jsonObj = new JSONObject(jsonStr);

                    // Getting JSON Array node
                    JSONArray contacts = jsonObj.getJSONArray("residents");

                    // looping through All Contacts
                    for (int i = 0; i < contacts.length(); i++) {
                        JSONObject c = contacts.getJSONObject(i);
                        String id = c.getString("id");
                        String room = c.getString("room");
                        String name = c.getString("name");
                        String weight = c.getString("weight");
                        String date = c.getString("datetime");

                        /*// Phone node is JSON Object
                        JSONObject phone = c.getJSONObject("phone");
                        String mobile = phone.getString("mobile");
                        String home = phone.getString("home");
                        String office = phone.getString("office");*/

                        // tmp hash map for single contact
                        HashMap<String, String> contact = new HashMap<>();

                        // adding each child node to HashMap key => value
                        contact.put("id", id);
                        contact.put("name", name);
                        contact.put("room", room);
                        contact.put("weight", weight);

                        for (j=0; j < listRoom.size(); j++){
                            if (listRoom.get(j).equals(room)){
                                y = 1;
                            }
                        }

                        if ( y == 0){
                            listRoom.add(room);
                            contactList.add(contact);
                            patients.add(0, new Patient("0", id, name, "Abg","1994",room,weight,date));
                        }

                        y=0;

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
            //Adapt list with resident's info
            super.onPostExecute(result);
            ListAdapter adapter = new SimpleAdapter(MainActivity.this, contactList,
                    R.layout.list_item, new String[]{ "room","name"},
                    new int[]{R.id.email, R.id.mobile});
            lv.setAdapter(adapter);
        }
    }
}
