package com.ece.pfe.app;

public class AppConfig {

	/************************************* WebServices ********************************************/

	public static String NAMESPACE = "http://tempuri.org/";

	public static String URL = "http://46.105.35.200/Geoloc_UnivAir/Android/UnivAirWS.asmx";

	public static String SOAP_ACTION = "http://tempuri.org/";

	/************************************** DataBase **********************************************/

	public static final String TABLE_USER = "user";
	public static final String TABLE_RESIDENT = "resident";


	public static final String USER_ID = "id";
	public static final String USER_ID_USER = "id_user";
	public static final String USER_NOM = "nom";
	public static final String USER_PRENOM = "prenom";
	public static final String USER_LOGIN = "login";
	public static final String USER_PASS = "password";

	/*****RESIDENT*****/

	public static final String RESIDENT_ID = "Id";
	public static final String RESIDENT_ID_RESI = "ResidentId";
	public static final String RESIDENT_NOM = "Nom";
	public static final String RESIDENT_PRENOM = "Prenom";
	public static final String RESIDENT_ROOM = "Room";
	public static final String RESIDENT_BIRTHDAY = "Age";
	public static final String RESIDENT_COMMENTAIRES = "Commentaires";
	public static final String RESIDENT_INFO_PLANNING = "InfoPlanning";
	public static final String RESIDENT_WEIGHT = "Poids";
	public static final String RESIDENT_WEIGHT_DATE = "Date_prise";
	public static final String RESIDENT_STATUT = "Statut";



}
