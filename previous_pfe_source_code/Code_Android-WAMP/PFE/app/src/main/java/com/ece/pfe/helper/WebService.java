package com.ece.pfe.helper;


import com.ece.pfe.app.AppConfig;

/*import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.PropertyInfo;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;*/

public class WebService {

	/*public static String invokeLogin(String login, String password) {
		String resTxt;
		SoapObject request = new SoapObject(AppConfig.NAMESPACE, "Authentification");
		PropertyInfo celsiusPI = new PropertyInfo();
		celsiusPI.setName("strLogin");
		celsiusPI.setValue(login);
		celsiusPI.setType(String.class);
		PropertyInfo celsiusPI1 = new PropertyInfo();
		celsiusPI1.setName("strPass");
		celsiusPI1.setValue(password);
		celsiusPI1.setType(String.class);
		request.addProperty(celsiusPI);
		request.addProperty(celsiusPI1);
		SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(SoapEnvelope.VER11);
		envelope.dotNet = true;
		envelope.setOutputSoapObject(request);
		HttpTransportSE androidHttpTransport = new HttpTransportSE(AppConfig.URL);
		try {
			androidHttpTransport.call(AppConfig.SOAP_ACTION + "Authentification", envelope);
			resTxt = envelope.getResponse().toString();
		} catch (Exception e) {
			e.printStackTrace();
			resTxt = "-1";
		}
		return resTxt;
	}

	public static String invokeGetInterventions (String id, String date) {
		String resTxt;
		SoapObject request = new SoapObject(AppConfig.NAMESPACE, "SyncMissions");
		PropertyInfo celsiusPI = new PropertyInfo();
		celsiusPI.setName("intDriversId");
		celsiusPI.setValue(id);
		celsiusPI.setType(Integer.class);
		PropertyInfo celsiusPI1 = new PropertyInfo();
		celsiusPI1.setName("strDateSync");
		celsiusPI1.setValue(date);
		celsiusPI1.setType(String.class);
		request.addProperty(celsiusPI);
		request.addProperty(celsiusPI1);
		SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(SoapEnvelope.VER11);
		envelope.dotNet = true;
		envelope.setOutputSoapObject(request);
		HttpTransportSE androidHttpTransport = new HttpTransportSE(AppConfig.URL);
		try {
			androidHttpTransport.call(AppConfig.SOAP_ACTION + "SyncMissions", envelope);
			resTxt = envelope.getResponse().toString();
		} catch (Exception e) {
			e.printStackTrace();
			resTxt = "-1";
		}
		return resTxt;
	}

	public static String invokeGetPatients (String id) {
		String resTxt;
		SoapObject request = new SoapObject(AppConfig.NAMESPACE, "getCustomerById");
		PropertyInfo celsiusPI = new PropertyInfo();
		celsiusPI.setName("intCustomerId");
		celsiusPI.setValue(id);
		celsiusPI.setType(Integer.class);
		request.addProperty(celsiusPI);
		SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(SoapEnvelope.VER11);
		envelope.dotNet = true;
		envelope.setOutputSoapObject(request);
		HttpTransportSE androidHttpTransport = new HttpTransportSE(AppConfig.URL);
		try {
			androidHttpTransport.call(AppConfig.SOAP_ACTION + "getCustomerById", envelope);
			resTxt = envelope.getResponse().toString();
		} catch (Exception e) {
			e.printStackTrace();
			resTxt = "-1";
		}
		return resTxt;
	}*/

}
