package com.ece.pfe.views;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;


public class Splash extends AppCompatActivity {

	/*private SessionManager session;

	@Override
    public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.splash);
		session = new SessionManager(getApplicationContext());
		new Thread(new Runnable() {
			@Override
			public void run() {
				try {
					Thread.sleep(3000);
					Intent objIntent;
					if (session.isLoggedIn())
						objIntent = new Intent(getApplicationContext(), Home.class);
					else
						objIntent = new Intent(getApplicationContext(), Login.class);
					startActivity(objIntent);
					finish();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}).start();
    }*/

}
