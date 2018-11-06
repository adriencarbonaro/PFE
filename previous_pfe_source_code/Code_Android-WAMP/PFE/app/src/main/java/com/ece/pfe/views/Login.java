package com.ece.pfe.views;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;

public class Login extends AppCompatActivity {

	/*private static Animation shakeAnimation;

	private Button _loginButton;
	private EditText _loginText;
	private EditText _passwordText;
	private CheckBox _checkRemember;
	private LinearLayout _loginLayout;

	private String login = "";
	private String password = "";
	private String response;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
	}

	public void login() {
	}

	@Override
	public void onBackPressed() {
		moveTaskToBack(true);
	}

	public void onLoginSuccess() {
	}

	public void onLoginFailed() {
	}

	public boolean validate() {
		boolean valid = true;
		String login = _loginText.getText().toString();
		String password = _passwordText.getText().toString();
		if (login.isEmpty()) {
			_loginText.setError("Veuillez entrer un identifiant");
			valid = false;
		} else {
			_loginText.setError(null);
		}
		if (password.isEmpty()) {
			_passwordText.setError("Veuillez entrer un mot de passe");
			valid = false;
		} else {
			_passwordText.setError(null);
		}
		return valid;
	}

	private class AsyncCallWS extends AsyncTask<String, Void, Void> {

		ProgressDialog progressDialog;

		@Override
		protected Void doInBackground(String... params) {
		}

		@Override
		protected void onPostExecute(Void result) {
			progressDialog.dismiss();
			if(response.equals("-1")) {
				onLoginFailed();
			} else {
				onLoginSuccess();
			}
		}

		@Override
		protected void onPreExecute() {
			_loginButton.setEnabled(false);
			progressDialog = new ProgressDialog(Login.this);
			progressDialog.setIndeterminate(true);
			progressDialog.setMessage("Authentification...");
			progressDialog.show();
		}

		@Override
		protected void onProgressUpdate(Void... values) {

		}

	}*/

}