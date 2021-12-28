package com.trism.jesica.Util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.mysql.cj.xdevapi.JsonArray;
import com.trism.jesica.persistence.Entitiy.common.LoginSession;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;

@Slf4j
public class HttpUtil {

	public static void callApi(JsonObject params, String type, HttpServletRequest request, String pass, String uuid){

		HttpURLConnection conn = null;
		JSONObject responseJson = null;

		try {
			//URL 설정
			URL url = new URL("http://101.55.126.138:13600/api/v1/auth/login");

			conn = (HttpURLConnection) url.openConnection();

			// type의 경우 POST, GET, PUT, DELETE 가능
			conn.setRequestMethod(type);
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Connection", "keep-alive");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			// JSON 형식의 데이터 셋팅
			JsonArray jsonArray = new JsonArray();

			HttpSession session = request.getSession();
			LoginSession sessionObj = (LoginSession)session.getAttribute(LoginSession.KEY);
/*

			params.addProperty("userId", sessionObj.getUserLoginId());
			params.addProperty("password", pass);
			params.addProperty("tokenId", session.getAttribute("accessToken").toString());
			params.addProperty("loginType", "DEFAULT");
			params.addProperty("role", "UT_DELIVERY");
			params.addProperty("deviceType", "WEB");
			params.addProperty("deviceName", "WEB");
			params.addProperty("deviceId", uuid);
*/


			params.addProperty("userId", "worker02");
			params.addProperty("password", "1234");
			params.addProperty("loginType", "DEFAULT");
			params.addProperty("role", "UT_CONSULTANT");
			params.addProperty("deviceType", "WEB");
			params.addProperty("deviceId", "1234");

			// JSON 형식의 데이터 셋팅 끝
			log.info("params::{}", params);
			// 데이터를 STRING으로 변경
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String jsonOutput = gson.toJson(jsonArray);

			bw.write(jsonArray.toString());
			bw.flush();
			bw.close();

			// 보내고 결과값 받기
			int responseCode = conn.getResponseCode();
			String responseCodeStr = conn.getResponseMessage();
			log.info("result::{}", responseCode);
			log.info("responseCodeStr::{}", responseCodeStr);
			if (responseCode == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuilder sb = new StringBuilder();
				String line = "";
				while ((line = br.readLine()) != null) {
					sb.append(line);
				}
				responseJson = new JSONObject(sb.toString());

				// 응답 데이터
				System.out.println("responseJson :: " + responseJson);
				Map<String,Object> token =  (Map<String,Object>)responseJson.get("token");
				String refreshToken= token.get("resfreshToken").toString();

			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			System.out.println("not JSON Format response");
			e.printStackTrace();
		}
	}

	//리프래쉬 토큰
	public static void callRefresh(JsonObject params, String type, HttpServletRequest request){

		HttpURLConnection conn = null;
		JSONObject responseJson = null;

		try {
			//URL 설정
			URL url = new URL("http://101.55.126.138:13600/api/v1/token");

			conn = (HttpURLConnection) url.openConnection();

			// type의 경우 POST, GET, PUT, DELETE 가능
			conn.setRequestMethod(type);
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Transfer-Encoding", "chunked");
			conn.setRequestProperty("Connection", "keep-alive");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			// JSON 형식의 데이터 셋팅
			JsonArray jsonArray = new JsonArray();

			HttpSession session = request.getSession();

			// JSON 형식의 데이터 셋팅 끝
			log.info("params::{}", params);
			// 데이터를 STRING으로 변경
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String jsonOutput = gson.toJson(jsonArray);

			bw.write(jsonArray.toString());
			bw.flush();
			bw.close();

			// 보내고 결과값 받기
			int responseCode = conn.getResponseCode();
			String responseCodeStr = conn.getResponseMessage();
			log.info("result::{}", responseCode);
			log.info("responseCodeStr::{}", responseCodeStr);
			if (responseCode == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuilder sb = new StringBuilder();
				String line = "";
				while ((line = br.readLine()) != null) {
					sb.append(line);
				}
				responseJson = new JSONObject(sb.toString());

				// 응답 데이터
				System.out.println("responseJson :: " + responseJson);
				String clientId= responseJson.get("clientId").toString();
				String expiresIn= responseJson.get("expiresIn").toString();


				//토큰 쿠키에저장
				System.out.println("clientId :: " + clientId);
				System.out.println("expiresIn :: " + expiresIn);

				Cookie clientIdC = new Cookie("clientId", clientId); //쿠키 생성
				Cookie expiresInC = new Cookie("code", expiresIn); //쿠키 생성
				//esponse.addCookie(cookie); //

			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			System.out.println("not JSON Format response");
			e.printStackTrace();
		}
	}
	//토큰정보
	public static void callInfo(JsonObject params, String type, HttpServletRequest request){

		HttpURLConnection conn = null;
		JSONObject responseJson = null;

		try {
			//URL 설정
			URL url = new URL("http://101.55.126.138:13600/api/v1/token/info");

			conn = (HttpURLConnection) url.openConnection();

			// type의 경우 POST, GET, PUT, DELETE 가능
			conn.setRequestMethod(type);
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Transfer-Encoding", "chunked");
			conn.setRequestProperty("Connection", "keep-alive");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			// JSON 형식의 데이터 셋팅
			JsonArray jsonArray = new JsonArray();

			HttpSession session = request.getSession();

			// JSON 형식의 데이터 셋팅 끝
			log.info("params::{}", params);
			// 데이터를 STRING으로 변경
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String jsonOutput = gson.toJson(jsonArray);

			bw.write(jsonArray.toString());
			bw.flush();
			bw.close();

			// 보내고 결과값 받기
			int responseCode = conn.getResponseCode();
			String responseCodeStr = conn.getResponseMessage();
			log.info("result::{}", responseCode);
			log.info("responseCodeStr::{}", responseCodeStr);
			if (responseCode == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuilder sb = new StringBuilder();
				String line = "";
				while ((line = br.readLine()) != null) {
					sb.append(line);
				}
				responseJson = new JSONObject(sb.toString());

				// 응답 데이터
				System.out.println("responseJson :: " + responseJson);
				String clientId= responseJson.get("clientId").toString();
				String expiresIn= responseJson.get("expiresIn").toString();


				//토큰 쿠키에저장
				System.out.println("clientId :: " + clientId);
				System.out.println("expiresIn :: " + expiresIn);
				//esponse.addCookie(cookie); //

			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			System.out.println("not JSON Format response");
			e.printStackTrace();
		}
	}
}
