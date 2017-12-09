package net.zjwu.mis.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * 
 * @author Lay
 * 
 */
public class HttpConnectionUtils {

	public static String doGet(String url) {
		return doRequest(url, "utf-8", "GET", "");
	}

	public static String doPost(String url, String requestContent) {
		return doRequest(url, "utf-8", "POST", requestContent);
	}

	private static String doRequest(String url, String charSet,
			String requestMethod, String requestContent) {
		HttpURLConnection connection = null;
		String content = "";
		try {
			URL address_url = new URL(url);
			connection = (HttpURLConnection) address_url.openConnection();
			connection.setRequestMethod(requestMethod);
			//connection.setRequestProperty("Content-type", "text/html");
			//connection.setRequestProperty("Content-type", "application/octet-stream");
			//connection.setRequestProperty("Accept-Charset", "utf-8");
			
			connection.setDoInput(true);
			connection.setDoOutput(true);
			System.setProperty("sun.net.client.defaultConnectTimeout", "5000");
			System.setProperty("sun.net.client.defaultReadTimeout", "5000");
			OutputStreamWriter outputStreamWriter = new OutputStreamWriter(
					connection.getOutputStream(), "utf-8");
			outputStreamWriter.write(requestContent);
			outputStreamWriter.flush();
			outputStreamWriter.close();
			int response_code = connection.getResponseCode();
			if (response_code == HttpURLConnection.HTTP_OK) {
				InputStream in = connection.getInputStream();
				BufferedReader reader = new BufferedReader(
						new InputStreamReader(in, charSet));
				String line = null;
				while ((line = reader.readLine()) != null) {
					content += line;
				}
				return content;
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				connection.disconnect();
			}
		}
		return "";
	}

}
