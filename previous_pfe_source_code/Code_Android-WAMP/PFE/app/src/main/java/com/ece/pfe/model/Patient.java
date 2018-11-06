package com.ece.pfe.model;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * Created by Jerry on 10/10/2017.
 */

public class Patient implements Parcelable{

    String id;
    String patient_id;
    String firstName;
    String lastName;
    String birthday;
    String room;
    String weight;
    String weightDate;


    public Patient(String id, String patient_id, String firstName, String lastName, String birthday, String room, String weight, String weightDate) {
        this.id = id;
        this.patient_id = patient_id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthday = birthday;
        this.room = room;
        this.weight = weight;
        this.weightDate = weightDate;
    }

    public String getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(String patient_id) {
        this.patient_id = patient_id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getWeightDate() {
        return weightDate;
    }

    public void setWeightDate(String weightDate) {
        this.weightDate = weightDate;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public static final Parcelable.Creator<Patient> CREATOR = new Parcelable.Creator<Patient>() {
        public Patient createFromParcel(Parcel in) {
            return new Patient(in);
        }

        public Patient[] newArray(int size) {
            return new Patient[size];
        }
    };

    public void writeToParcel(Parcel out, int flags) {

        out.writeString(firstName);
        out.writeString(lastName);
        out.writeString(birthday);
        out.writeString(weight);
        out.writeString(weightDate);
        out.writeString(room);
        out.writeString(id);
    }

    public Patient(Parcel in) {
        firstName = in.readString();
        lastName = in.readString();
        birthday = in.readString();
        weight = in.readString();
        weightDate = in.readString();
        room = in.readString();
        id = in.readString();
    }

    @Override
    public int describeContents() {
        return 0;
    }
}
