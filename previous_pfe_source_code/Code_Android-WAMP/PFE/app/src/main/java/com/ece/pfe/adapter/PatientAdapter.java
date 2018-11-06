package com.ece.pfe.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.ece.pfe.R;
import com.ece.pfe.model.Patient;

import java.util.List;

/**
 * Created by Jerry on 10/10/2017.
 */

public class PatientAdapter extends ArrayAdapter<Patient> {

    public PatientAdapter(Context context, List<Patient> patients) {
        super(context, 0, patients);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        if (convertView == null) {
            convertView = LayoutInflater.from(getContext()).inflate(R.layout.row_patient, parent, false);
        }
        PatientViewHolder viewHolder = (PatientViewHolder) convertView.getTag();
        if (viewHolder == null) {
            viewHolder = new PatientViewHolder();
            viewHolder.icon = (ImageView) convertView.findViewById(R.id.ic_people);
            viewHolder.name = (TextView) convertView.findViewById(R.id.rowName);
            viewHolder.room = (TextView) convertView.findViewById(R.id.rowRoom);
            convertView.setTag(viewHolder);
        }
        Patient patient = getItem(position);
        viewHolder.name.setText(patient.getFirstName() + "" + patient.getLastName());
        viewHolder.room.setText(patient.getRoom());
        return convertView;
    }

    private class PatientViewHolder {
        public ImageView icon;
        public TextView name;
        public TextView room;
    }

}