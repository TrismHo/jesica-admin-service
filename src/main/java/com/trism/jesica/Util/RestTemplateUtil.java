package com.trism.jesica.Util;

import com.trism.jesica.config.JesicaProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.client.DefaultResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;
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
	/*public ResponseEntity<Map> authorizeToken() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		String url = jesicaProperties.getApiServer().getServer()+"/v1/token/authorize";
		*//*String url = "http://101.55.126.138:13000/api/v1/token/authorize";*//*
		return restTemplate.getForEntity(url, Map.class);
	}*/

	//지도정보
	/*public ResponseEntity<Map> getLocation(HttpSession session,String type) {
		HttpHeaders headers = new HttpHeaders();
		String authorization = "";
		if (session.getAttribute("accessToken") != null ){
			authorization ="Bearer "+session.getAttribute("accessToken").toString();
		}
		headers.add("Content-Type", "application/json");
		headers.add(HttpHeaders.AUTHORIZATION, authorization);
		String url = jesicaProperties.getApiServer().getServer()+"/v1/dlvy/workers/locations?type="+type;
		*//*String url = "http://101.55.126.138:13300/api/v1/dlvy/workers/locations?type="+type;*//*
		Map<String,Object> requestDto = new HashMap<>();
		HttpEntity<Map<String,Object>> entity = new HttpEntity<Map<String,Object>>(requestDto, headers);
		return restTemplate.exchange(url, HttpMethod.GET,entity,Map.class);
	}*/

	//토큰 만료되었을때
	/*public ResponseEntity<Map> refreshToken(HttpSession session ,String clientId, String code, String refreshToken ) {
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
		*//*String url = "http://101.55.126.138:13000/api/v1/token";*//*
		return restTemplate.postForEntity(url, entity, Map.class);
	}*/

	//토큰 만료되었을때Vue용
	/*public ResponseEntity<Map> refreshTokenVue(String refreshToken, String code, String clientId, String accessToken ) {
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
		*//*String url = "http://101.55.126.138:13000/api/v1/token";*//*
		return restTemplate.postForEntity(url, entity, Map.class);
	}*/

	//accessToken으로 정보조회
	/*public ResponseEntity<Map> getAccessInfo(String accessToken) {
		HttpHeaders headers = new HttpHeaders();
		String authorization ="Bearer "+accessToken;
		log.info("authorization+"+authorization);
		headers.add("Content-Type", "application/json");
		headers.add(HttpHeaders.AUTHORIZATION, authorization);
		*//*String url = "http://101.55.126.138:13000/api/v1/token/info";*//*
		String url = jesicaProperties.getApiServer().getServer()+"/v1/token/info";
		Map<String,Object> requestDto = new HashMap<>();
		HttpEntity<Map<String,Object>> entity = new HttpEntity<Map<String,Object>>(requestDto, headers);
		return restTemplate.exchange(url, HttpMethod.GET,entity,Map.class);
	}*/

	//토큰 - 로그인시 사용
	public ResponseEntity<Map> loginAuth(String uuid, String loginId ,String pass) {



		Map<String,String> requestDto = new HashMap<>();
		requestDto.put("userId",loginId);
		requestDto.put("password",pass);
		requestDto.put("loginType","DEFAULT");
		requestDto.put("role","UT_MANAGEMENT");
		requestDto.put("deviceType","WEB");
		requestDto.put("deviceId",uuid);
		requestDto.put("appVer","1");
		requestDto.put("appCode","STF");
		requestDto.put("pushKey","");


		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
	/*	headers.add("clientId", clientId);
		headers.add("code", code);*/
		HttpEntity<Map<String,String>> entity = new HttpEntity<>(requestDto, headers);
		/*String url = "http://101.55.126.138:13000/api/v1/auth/login";*/
		String url = jesicaProperties.getApiServer().getServer()+"/v1/auth/login";

		//401 에러를 가로채기위한 RestTemplate
		RestTemplate restTemplate1 = new RestTemplate();
		restTemplate1.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
		restTemplate1.setErrorHandler(new DefaultResponseErrorHandler() {
			public boolean hasError(ClientHttpResponse response) throws IOException {
				HttpStatus statusCode = response.getStatusCode();
				return statusCode.series()  == HttpStatus.Series.SERVER_ERROR;
			}
		});
		return restTemplate1.postForEntity(url, entity, Map.class);
	}
	//차량 대여정보 등록
	/*public ResponseEntity<Map> insertCarRent(TbRentalInfoData tbRentalInfo, HttpSession session) {
		Map<String,String> requestDto = new HashMap<>();

		*//*String rentApiKey = "mKVm9X1+RVVF5HxdKGPMHnJ+TjkH9M9S9/uIfDOG+TQ=";*//*

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
		*//*headers.add("RentApiKey", rentApiKey);*//*
		HttpEntity<Map<String,String>> entity = new HttpEntity<>(requestDto, headers);
		*//*String url = "http://101.55.126.138:13000/api/v1/rents/reserv";*//*
		String url = jesicaProperties.getApiServer().getServer()+"/v1/rents/reserv";
		return restTemplate.postForEntity(url, entity, Map.class);
	}*/

	//차량 대여정보 등록
	/*public ResponseEntity<Map<String, Object>> resetSafenNum(Long rentalNo, HttpSession session) {
		Map<String,Long> requestDto = new HashMap<>();


		requestDto.put("rentalNo", rentalNo);

		String authorization = "";
		if (session.getAttribute("accessToken") != null ){
			authorization ="Bearer "+session.getAttribute("accessToken").toString();
		}

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json");
		headers.add(HttpHeaders.AUTHORIZATION, authorization);
		headers.add("Content-Type", "application/json; charset=utf-8");
		*//*headers.add("RentApiKey", rentApiKey);*//*
		HttpEntity<Map<String,Long>> entity = new HttpEntity<>(headers);
		*//*String url = "http://101.55.126.138:13000/api/v1/rents/reserv";*//*
		String url = jesicaProperties.getApiServer().getServer()+"/v1/rents/reserv/safen";
		UriComponentsBuilder builder = UriComponentsBuilder.fromUriString(url)
						.queryParam("rentalNo", rentalNo);
		return restTemplate.exchange(builder.toUriString(), HttpMethod.PUT, entity, new ParameterizedTypeReference<Map<String, Object>>() {});
		*//*ResponseEntity<Map<String, Object>> response = restTemplate.exchange(builder.toUriString(), HttpMethod.PUT, entity, new ParameterizedTypeReference<Map<String, Object>>() {});

		response.getBody();*//*
	}*/


	//드라이버 수정이나 등록시 상태갱신
	/*public ResponseEntity<Map> driverStatusInit(Long workerNo,HttpSession session) {
		Map<String,Integer> requestDto = new HashMap<>();
		HttpHeaders headers = new HttpHeaders();

		String authorization = "";
		if (session.getAttribute("accessToken") != null ){
			authorization ="Bearer "+session.getAttribute("accessToken").toString();
		}

		headers.add("Content-Type", "application/json");
		headers.add(HttpHeaders.AUTHORIZATION, authorization);
		HttpEntity<Map<String,Integer>> entity = new HttpEntity<>(requestDto, headers);
		*//*String url = "http://101.55.126.138:13000/api/v1/dlvy/workers/sync/"+workerNo;*//*
		String url = jesicaProperties.getApiServer().getServer()+"/v1/dlvy/workers/sync/"+workerNo;
		return restTemplate.exchange(url, HttpMethod.PUT,entity,Map.class);
	}*/

	//푸시메시지
	/*public ResponseEntity<Map> pushMessage(String 쉬appcode, String receiver, String title, String contents, HttpSession session, Data data ) {
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
		*//*String url = "http://101.55.126.138:13000/api/v1/auth/login";*//*
		String url = jesicaProperties.getApiServer().getServer()+"/v1/auth/push/req";
		return restTemplate.postForEntity(url, entity, Map.class);
	}*/


	//멤버쉽 API 상세 호출
	public ResponseEntity<Map> getCouponDetailApi(Integer cpnNo) {
		Map<String,Object> requestDto = new HashMap<>();
		requestDto.put("cpnNo",cpnNo);
		HttpHeaders headers = new HttpHeaders();
		headers.add("authKey",  jesicaProperties.getMomPosServer().getAuthKey());
		headers.add("Content-Type", "application/json");
		String url = jesicaProperties.getMomPosServer().getApi()+"/v1/coupon-manage/detail/"+cpnNo;

		//String url = "http://tfrapp.mompos.co.kr:8443/api-ms/v1/coupon-manage/detail/"+cpnNo;
		//String url = "http://frapp.mompos.co.kr:8443/api-ms/v1/coupon-manage/detail/"+cpnNo; //운영

		HttpEntity<Map<String,Object>> entity = new HttpEntity<Map<String,Object>>(requestDto, headers);
		return restTemplate.exchange(url, HttpMethod.GET,entity,Map.class);
	}

	//멤버쉽 API 쿠폰일괄등록
	public ResponseEntity<Map> getCouponAddApi(Integer cpnNo, String ordPathCd ,BigDecimal[] extCustNo, String cpnReason) {
		Map<String,Object> requestDto = new HashMap<>();
		String[] arr = {};
		requestDto.put("cpnNo",cpnNo);
		requestDto.put("ordPathCd",ordPathCd);
		requestDto.put("custNo",arr);
		requestDto.put("extCustNo",extCustNo);
		requestDto.put("cpnReason",cpnReason);
		HttpHeaders headers = new HttpHeaders();
		headers.add("authKey",  jesicaProperties.getMomPosServer().getAuthKey());
		headers.add("Content-Type", "application/json");

		String url = jesicaProperties.getMomPosServer().getApi()+"/v1/coupon";
		//String url = "http://tfrapp.mompos.co.kr:8443/api-ms/v1/coupon"; //테스트
		//String url = "http://frapp.mompos.co.kr:8443/api-ms/v1/coupon";  //운영
		HttpEntity<Map<String,Object>> entity = new HttpEntity<Map<String,Object>>(requestDto, headers);
		return restTemplate.postForEntity(url, entity, Map.class);
	}

	public ResponseEntity<Map> getCustCouponList(Long custNo, String ordPathCd) {
		Map<String, Object> result = new HashMap<>();

		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("authKey", jesicaProperties.getMomPosServer().getAuthKey());
			headers.add("Content-Type", "application/json");

			String url = jesicaProperties.getMomPosServer().getServer()
					+ "/v1/coupon/list/"
					+ custNo;

			if (ordPathCd != null && !"".equals(ordPathCd)) {
				url += "?ordPathCd=" + URLEncoder.encode(ordPathCd, "UTF-8");
			}

			HttpEntity<?> entity = new HttpEntity<>(headers);

			ResponseEntity<Map> response = restTemplate.exchange(
					url,
					HttpMethod.GET,
					entity,
					Map.class
			);

			return ResponseEntity
					.status(response.getStatusCode())
					.body(response.getBody());

		} catch (Exception e) {
			result.put("result", "500");
			result.put("message", "쿠폰 목록 조회 중 오류가 발생했습니다.");
			result.put("error", e.getMessage());

			return ResponseEntity
					.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body(result);
		}
	}

	//멤버쉽 API 상세 호출
	public ResponseEntity<Map> getBadgeFileDel(Long seqNo) {
		Map<String,Object> requestDto = new HashMap<>();
		requestDto.put("seqNo",seqNo);
		HttpHeaders headers = new HttpHeaders();
	/*	headers.add("authKey",  jesicaProperties.getMomPosServer().getAuthKey());
		headers.add("Content-Type", "application/json");*/
		String url = jesicaProperties.getBadgeFileDel().getPath();

		HttpEntity<Map<String,Object>> entity = new HttpEntity<Map<String,Object>>(requestDto, headers);
		return restTemplate.postForEntity(url, entity, Map.class);
	}
	//추천가맹점 연동
	public ResponseEntity<Map> updateCustRecommSt(String custTel, String stCode , String getOrdType, String actType) {
		Map<String,Object> requestDto = new HashMap<>();



		requestDto.put("in_ORD_CU_TEL",custTel);
		requestDto.put("in_ST_CODE",stCode);
		requestDto.put("in_ORD_TYPE_CD",getOrdType);
		requestDto.put("in_ACT_TYPE",actType);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json;charset=UTF-8");
		headers.add("Accept",  "application/json; charset=utf-8");
		headers.add("AUTH_KEY",  jesicaProperties.getMannaShop().getAuthKey());
		headers.add("PF_TYPE_CD",  "1018");
		headers.add("ORD_PATH_CD",  "1105");

		String url = jesicaProperties.getMannaShop().getPath()+"v1/put_cu_recomm_info";

		HttpEntity<Map<String,Object>> entity = new HttpEntity<Map<String,Object>>(requestDto, headers);
		return restTemplate.postForEntity(url, entity, Map.class);
	}

	//추천가맹점 연동전 조회(실제 존재여부판단용)
	/*public ResponseEntity<Map> setStCode() {
		Map<String,Object> requestDto = new HashMap<>();

		requestDto.put("in_ST_CODE","S123456");
		requestDto.put("in_CU_LAT_Y","1");
		requestDto.put("in_CU_LNG_X","1");
		requestDto.put("in_CC_ADDR_4","1");
		requestDto.put("in_CC_ADDR_5","1");
		requestDto.put("in_CC_ADDR_6","1");
		requestDto.put("in_CC_ADDR_8","1");

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json;charset=UTF-8");
		headers.add("Accept",  "application/json; charset=utf-8");
		headers.add("AUTH_KEY",  jesicaProperties.getMannaShop().getAuthKey());
		headers.add("PF_TYPE_CD",  "1018");
		headers.add("ORD_PATH_CD",  "1105");

		String url = jesicaProperties.getMannaShop().getPath()+ "/v3/st_info";
		System.out.println(url);
		HttpEntity<Map<String,Object>> entity = new HttpEntity<Map<String,Object>>(requestDto, headers);
		return restTemplate.postForEntity(url, entity, Map.class);
	}*/
}
