package com.ece.pfe.helper;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

import com.ece.pfe.app.AppConfig;
import com.ece.pfe.model.Patient;
import com.ece.pfe.model.User;

public class SQLiteHandler extends SQLiteOpenHelper {

	private static final String TAG = SQLiteHandler.class.getSimpleName();
	private static final int DATABASE_VERSION = 1;
	private static final String DATABASE_NAME = "technicien_db";

	public SQLiteHandler(Context context) {
		super(context, DATABASE_NAME, null, DATABASE_VERSION);
	}

	@Override
	public void onCreate(SQLiteDatabase db) {
		String CREATE_LOGIN_TABLE = "CREATE TABLE " + AppConfig.TABLE_USER + "("
				+ AppConfig.USER_ID + " TEXT,"
				+ AppConfig.USER_ID_USER + " TEXT,"
				+ AppConfig.USER_NOM + " TEXT,"
				+ AppConfig.USER_PRENOM + " TEXT,"
				+ AppConfig.USER_LOGIN + " TEXT,"
				+ AppConfig.USER_PASS + " TEXT" + ")";
		db.execSQL(CREATE_LOGIN_TABLE);
		Log.d(TAG, "Database tables created");

		String CREATE_RESIDENT_TABLE = "CREATE TABLE " + AppConfig.TABLE_RESIDENT + "("
				+ AppConfig.RESIDENT_ID + " TEXT,"
				+ AppConfig.RESIDENT_ID_RESI + " TEXT,"
				+ AppConfig.RESIDENT_NOM + " TEXT,"
				+ AppConfig.RESIDENT_PRENOM + " TEXT,"
				+ AppConfig.RESIDENT_ROOM + " TEXT,"
				+ AppConfig.RESIDENT_BIRTHDAY + " TEXT,"
				+ AppConfig.RESIDENT_COMMENTAIRES + " TEXT,"
				+ AppConfig.RESIDENT_WEIGHT_DATE + " TEXT,"
				+ AppConfig.RESIDENT_WEIGHT + " TEXT,"
				+ AppConfig.RESIDENT_INFO_PLANNING + " TEXT,"
				+ AppConfig.RESIDENT_STATUT + " TEXT,"+")";
		db.execSQL(CREATE_RESIDENT_TABLE);
		Log.d(TAG, "Database tables created");

	}

	@Override
	public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
		db.execSQL("DROP TABLE IF EXISTS " + AppConfig.TABLE_USER + ";");
		db.execSQL("DROP TABLE IF EXISTS " + AppConfig.TABLE_RESIDENT + ";");
		onCreate(db);
	}

	/**************************************** User ************************************************/

	public void addUser(User user) {
		SQLiteDatabase db = this.getWritableDatabase();
		ContentValues values = new ContentValues();
		values.put(AppConfig.USER_ID, "1");
		values.put(AppConfig.USER_ID_USER, user.getId());
		values.put(AppConfig.USER_NOM, user.getFirstName());
		values.put(AppConfig.USER_PRENOM, user.getLastName());
		values.put(AppConfig.USER_LOGIN, user.getLogin());
		values.put(AppConfig.USER_PASS, user.getPassword());
		db.insertWithOnConflict(AppConfig.TABLE_USER, null, values, SQLiteDatabase.CONFLICT_REPLACE);
		db.close();
	}

	public User getUserDetails() {
		User user = new User();
		String selectQuery = "SELECT  * FROM " + AppConfig.TABLE_USER;
		SQLiteDatabase db = this.getReadableDatabase();
		Cursor cursor = db.rawQuery(selectQuery, null);
		cursor.moveToFirst();
		if (cursor.getCount() > 0) {
			user.setId(cursor.getString(1));
			user.setFirstName(cursor.getString(2));
			user.setLastName(cursor.getString(3));
			user.setLogin(cursor.getString(4));
			user.setPassword(cursor.getString(5));
		}
		cursor.close();
		db.close();
		Log.d(TAG, "Fetching user from Sqlite: " + user.toString());
		return user;
	}

	/************************************ RESIDENT ********************************************/

	public void addResident(Patient patient) {
		SQLiteDatabase db = this.getWritableDatabase();
		ContentValues values = new ContentValues();
		values.put(AppConfig.RESIDENT_ID, "1");
		values.put(AppConfig.RESIDENT_ID_RESI, patient.getId());
		values.put(AppConfig.RESIDENT_NOM, patient.getLastName());
		values.put(AppConfig.RESIDENT_PRENOM, patient.getFirstName());
		values.put(AppConfig.RESIDENT_ROOM, patient.getRoom());
		values.put(AppConfig.RESIDENT_BIRTHDAY, patient.getBirthday());
		values.put(AppConfig.RESIDENT_WEIGHT, patient.getWeight());
		values.put(AppConfig.RESIDENT_WEIGHT_DATE, patient.getWeightDate());
		db.insertWithOnConflict(AppConfig.TABLE_RESIDENT, null, values, SQLiteDatabase.CONFLICT_REPLACE);
		db.close();
	}

	/*public Patient getPatientDetails() {
		Patient patient = new Patient();
		String selectQuery = "SELECT  * FROM " + AppConfig.TABLE_RESIDENT;
		SQLiteDatabase db = this.getReadableDatabase();
		Cursor cursor = db.rawQuery(selectQuery, null);
		cursor.moveToFirst();
		if (cursor.getCount() > 0) {
			patient.setId(cursor.getString(1));
			patient.setPatient_id(cursor.getString(2));
			patient.setLastName(cursor.getString(3));
			patient.setFirstName(cursor.getString(4));
			patient.setRoom(cursor.getString(5));
			patient.setBirthday(cursor.getString(6));
			patient.setWeight(cursor.getString(7));
			patient.setWeightDate(cursor.getString(8));

		}
		cursor.close();
		db.close();
		Log.d(TAG, "Fetching user from Sqlite: " + patient.toString());
		return patient;
	}*/

	/************************************ Patient ********************************************/

}
