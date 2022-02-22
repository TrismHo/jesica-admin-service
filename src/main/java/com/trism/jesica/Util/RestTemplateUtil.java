package com.trism.jesica.Util;

import com.trism.jesica.config.Data;
import com.trism.jesica.config.JesicaProperties;
import com.trism.jesica.dto.TbRentalInfoData;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Component
public class RestTemplateUtil {
	@Autowired
	private RestTemplate restTemplate;

	@Autowired
	private JesicaProperties jesicaProperties;

	//클리이언트 정보/코드 획득
	public ResponseEntity<Map> authorizeToken() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		String url = jesicaProperties.getApiServer().getServer()+"/v1/token/authorize";
		/*String url = "http://101.55.126.138:13000/api/v1/token/authorize";*/
		return restTemplate.getForEntity(url, Map.class);
	}

	//지도정보
	public ResponseEntity<Map> getLocation(HttpSession session,String type) {
		HttpHeaders headers = new HttpHeaders();
		String authorization = "";
		if (session.getAttribute("accessToken") != null ){
			authorization ="Bearer "+session.getAttribute("accessToken").toString();
		}
		headers.add("Content-Type", "application/json");
		headers.add(HttpHeaders.AUTHORIZATION, authorization);
		String url = jesicaProperties.getApiServer().getServer()+"/v1/dlvy/workers/locations?type="+type;
		/*String url = "http://101.55.126.138:13300/api/v1/dlvy/workers/locations?type="+type;*/
		Map<String,Object> requestDto = new HashMap<>();
		HttpEntity<Map<String,Object>> entity = new HttpEntity<Map<String,Object>>(requestDto, headers);
		return restTemplate.exchange(url, HttpMethod.GET,entity,Map.class);
	}

	//토큰 만료되었을때
	public ResponseEntity<Map> refreshToken(HttpSession session ,String clientId, String code, String refreshToken ) {
		Map<String,String> requestDto = new HashMap<>();
		requestDto.put("grantType","REFRESH_TOKEN");
		requestDto.put("refreshToken",refreshToken);
		requestDto.put("clientId",clientId);
		requestDto.put("code", code);
		String authorization = "";

		if (session.getAttribute("accessToken") != null ){
			authorization ="Bearer "+session.getAttribute("accessToken").toString();
		}

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		headers.add(HttpHeaders.AUTHORIZATION, authorization);
		HttpEntity<Map<String,String>> entity = new HttpEntity<>(requestDto, headers);
		String url = jesicaProperties.getApiServer().getServer()+"/v1/token";
		/*String url = "http://101.55.126.138:13000/api/v1/token";*/
		return restTemplate.postForEntity(url, entity, Map.class);
	}

	//토큰 만료되었을때Vue용
	public ResponseEntity<Map> refreshTokenVue(String refreshToken, String code, String clientId, String accessToken ) {
		Map<String,String> requestDto = new HashMap<>();
		requestDto.put("grantType","REFRESH_TOKEN");
		requestDto.put("refreshToken",refreshToken);
		requestDto.put("clientId",clientId);
		requestDto.put("code", code);
		HttpHeaders headers = new HttpHeaders();
		String authorization ="Bearer "+accessToken;

		headers.add("Content-Type", "application/json");
		headers.add("Access-Control-Allow-Origin", "*");
		headers.add(HttpHeaders.AUTHORIZATION, authorization);
		HttpEntity<Map<String,String>> entity = new HttpEntity<>(requestDto, headers);
		String url = jesicaProperties.getApiServer().getServer()+"/v1/token";
		/*String url = "http://101.55.126.138:13000/api/v1/token";*/
		return restTemplate.postForEntity(url, entity, Map.class);
	}

	//accessToken으로 정보조회
	public ResponseEntity<Map> getAccessInfo(String accessToken) {
		HttpHeaders headers = new HttpHeaders();
		String authorization ="Bearer "+accessToken;
		log.info("authorization+"+authorization);
		headers.add("Content-Type", "application/json");
		headers.add(HttpHeaders.AUTHORIZATION, authorization);
		/*String url = "http://101.55.126.138:13000/api/v1/token/info";*/
		String url = jesicaProperties.getApiServer().getServer()+"/v1/token/info";
		Map<String,Object> requestDto = new HashMap<>();
		HttpEntity<Map<String,Object>> entity = new HttpEntity<Map<String,Object>>(requestDto, headers);
		return restTemplate.exchange(url, HttpMethod.GET,entity,Map.class);
	}

	//토큰 - 로그인시 사용
	public ResponseEntity<Map> loginAuth(String clientId, String code, String uuid, String loginId ,String pass) {
		Map<String,String> requestDto = new HashMap<>();
		requestDto.put("userId",loginId);
		requestDto.put("password",pass);
		requestDto.put("loginType","DEFAULT");
		requestDto.put("role","UT_CONSULTANT");
		requestDto.put("deviceType","WEB");
		requestDto.put("deviceId",uuid);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		headers.add("clientId", clientId);
		headers.add("code", code);
		HttpEntity<Map<String,String>> entity = new HttpEntity<>(requestDto, headers);
		/*String url = "http://101.55.126.138:13000/api/v1/auth/login";*/
		String url = jesicaProperties.getApiServer().getServer()+"/v1/auth/login";
		System.out.println(url);
		return restTemplate.postForEntity(url, entity, Map.class);
	}
	//차량 대여정보 등록
	public ResponseEntity<Map> insertCarRent(TbRentalInfoData tbRentalInfo, HttpSession session) {
		Map<String,String> requestDto = new HashMap<>();

		/*String rentApiKey = "mKVm9X1+RVVF5HxdKGPMHnJ+TjkH9M9S9/uIfDOG+TQ=";*/

		requestDto.put("reservNum",tbRentalInfo.getReservNum());
		requestDto.put("storeName",tbRentalInfo.getStoreName());
		requestDto.put("carNum",tbRentalInfo.getCarNum());
		requestDto.put("custTel",null);
		requestDto.put("driverTel",tbRentalInfo.getCustDriverTel1().replaceAll("-",""));

		requestDto.put("startDtm",tbRentalInfo.getReservStartDate());
		requestDto.put("endDtm",tbRentalInfo.getReservEndDate());

		String authorization = "";
		if (session.getAttribute("accessToken") != null ){
			authorization ="Bearer "+session.getAttribute("accessToken").toString();
		}

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		headers.add(HttpHeaders.AUTHORIZATION, authorization);
		headers.add("Content-Type", "application/json; charset=utf-8");
		/*headers.add("RentApiKey", rentApiKey);*/
		HttpEntity<Map<String,String>> entity = new HttpEntity<>(requestDto, headers);
		/*String url = "http://101.55.126.138:13000/api/v1/rents/reserv";*/
		String url = jesicaProperties.getApiServer().getServer()+"/v1/rents/reserv";
		return restTemplate.postForEntity(url, entity, Map.class);
	}



	//드라이버 수정이나 등록시 상태갱신
	public ResponseEntity<Map> driverStatusInit(Long workerNo,HttpSession session) {
		Map<String,Integer> requestDto = new HashMap<>();
		HttpHeaders headers = new HttpHeaders();

		String authorization = "";
		if (session.getAttribute("accessToken") != null ){
			authorization ="Bearer "+session.getAttribute("accessToken").toString();
		}

		headers.add("Content-Type", "application/json");
		headers.add(HttpHeaders.AUTHORIZATION, authorization);
		HttpEntity<Map<String,Integer>> entity = new HttpEntity<>(requestDto, headers);
		/*String url = "http://101.55.126.138:13000/api/v1/dlvy/workers/sync/"+workerNo;*/
		String url = jesicaProperties.getApiServer().getServer()+"/v1/dlvy/workers/sync/"+workerNo;
		return restTemplate.exchange(url, HttpMethod.PUT,entity,Map.class);
	}

	//푸시메시지
	public ResponseEntity<Map> pushMessage(String appcode, String receiver, String title, String contents, HttpSession session, Data data ) {
		Map<String,Object> requestDto = new HashMap<>();
		requestDto.put("appcode",appcode);
		requestDto.put("receiver",receiver);
		requestDto.put("title",title);
		requestDto.put("contents",contents);
		requestDto.put("data",data);

		//현재시간
		long time = System.currentTimeMillis();
		requestDto.put("timestamp",time);


		String authorization = "";
		if (session.getAttribute("accessToken") != null ){
			authorization ="Bearer "+session.getAttribute("accessToken").toString();
		}

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		headers.add(HttpHeaders.AUTHORIZATION, authorization);
		HttpEntity<Map<String,Object>> entity = new HttpEntity<>(requestDto, headers);
		/*String url = "http://101.55.126.138:13000/api/v1/auth/login";*/
		String url = jesicaProperties.getApiServer().getServer()+"/v1/auth/push/req";
		return restTemplate.postForEntity(url, entity, Map.class);
	}




}