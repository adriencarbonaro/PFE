package com.ece.pfe.model;

public class User {

	public String id = "";
	public String login = "";
	public String password = "";
	public String firstName = "";
	public String lastName = "";
	public String date = "";
	public String id_user = "";
	public String save = "False";

	public User(String id, String login, String password, String firstName, String lastName, String dateSynchro, String save, String id_user) {
		super();
		this.id = id;
		this.login = login;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.date = dateSynchro;
		this.save = save;
		this.id_user = id_user;
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

	public User() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getId_user() {
		return id_user;
	}

	public void setId_user(String id_user) {
		this.id_user = id_user;
	}

	public String getSave() {
		return save;
	}

	public void setSave(String save) {
		this.save = save;
	}

	public Boolean isValidUser() {
		if (login != null && !login.equals("null")
				&& !login.equals("") && password != null
				&& !password.equals("null") && !password.equals("")) {
			return true;
		}
		return false;
	}
}