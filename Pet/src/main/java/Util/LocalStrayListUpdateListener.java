package Util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import LocalSite.LocalGovernment;
import LocalSite.LocalGovernmentJsonParser;
import LocalStrays.Animal;
import LocalStrays.AnimalResponseParser;

public class LocalStrayListUpdateListener implements ServletContextListener {
	private static final String API_KEY = "9tP0rrmdgYvkDyrkZFzOXRhcivDyQrpntkl/4XCMaH207D5iwNA7sDGOipABXA18dCTX9Bykv5qYyKj44fQl2g==";
	private static final String BUSAN_CODE = "6260000";
	private static final long UPDATE_INTERVAL = 60 * 60 * 1000;

	private static List<Animal> allAnimalList;
	private static List<Animal> noticeAnimalList;
	private static List<Animal> protectAnimalList;
	
	private static List<LocalGovernment> localGovernmentList;

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		try {
			updateData(); // 초기 데이터 업데이트

			// 타이머 설정
			Timer timer = new Timer();
			TimerTask task = new TimerTask() {
				@Override
				public void run() {
					updateData(); // 주기적으로 데이터 업데이트
				}
			};
			timer.schedule(task, UPDATE_INTERVAL, UPDATE_INTERVAL); // 처음 실행은 0초 후에 시작하고, 그 이후로는 UPDATE_INTERVAL마다 실행

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void updateData() {
		try {
			if (allAnimalList == null) {
	            allAnimalList = new ArrayList<>();
	        }
			noticeAnimalList = makeNoticeAnimalList();
			protectAnimalList = makeProtectAnimalList();
			allAnimalList.addAll(noticeAnimalList);
			allAnimalList.addAll(protectAnimalList);
			
			localGovernmentList = makeLocalGovernmentList();
//			sortAnimalList(allAnimalList);
			
			System.out.println("AllAnimalUpdate");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



//	private static void sortAnimalList(List<Animal> allAnimalList) {
//	    // 오늘 날짜 String 형태로 설정
//	    String todayDateString = LocalDate.now().format(DateTimeFormatter.BASIC_ISO_DATE);
//
//	    for (Animal animal : allAnimalList) {
//	        if (animal.getNoticeEdt().compareTo(todayDateString) >= 0) {
//	            noticeAnimalList.add(animal);  // NoticeEdt가 오늘 날짜보다 크거나 같으면 공고 중 동물 목록에 추가
//	        } else {
//	            protectAnimalList.add(animal);  // NoticeEdt가 오늘 날짜보다 작으면 보호 중 동물 목록에 추가
//	        }
//	    }
//	}


	public static List<Animal> makeNoticeAnimalList()
			throws UnsupportedEncodingException, MalformedURLException, IOException, ProtocolException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + API_KEY); /* Service Key */
		appendItem(urlBuilder, "upr_cd", BUSAN_CODE); // 시도코드 (시도 조회 OPEN API 참조)
//		appendItem(urlBuilder,"bgnde"," "); /* 유기날짜(검색 시작일) (YYYYMMDD) */
//		appendItem(urlBuilder,"endde"," "); /* 유기날짜(검색 종료일) (YYYYMMDD) */
//		appendItem(urlBuilder,"upkind"," "); /* 축종코드 (개 : 417000, 고양이 : 422400, 기타 : 429900) */
//		appendItem(urlBuilder,"kind"," "); /* 품종코드 (품종 조회 OPEN API 참조) */
//		appendItem(urlBuilder,"org_cd"," "); /* 시군구코드 (시군구 조회 OPEN API 참조) */
//		appendItem(urlBuilder,"care_reg_no"," "); /* 보호소번호 (보호소 조회 OPEN API 참조) */
		appendItem(urlBuilder,"state","notice"); /* 상태(전체 : null(빈값), 공고중 : notice, 보호중 : protect) */
//		appendItem(urlBuilder,"neuter_yn"," "); /* 상태 (전체 : null(빈값), 예 : Y, 아니오 : N, 미상 : U) */
		appendItem(urlBuilder, "pageNo", "1"); // 페이지 번호 (기본값 : 1)
		appendItem(urlBuilder, "numOfRows", "1000"); // 페이지당 보여줄 개수 (1,000 이하), 기본값 : 10
		appendItem(urlBuilder, "_type", "json"); // xml(기본값) 또는 json
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder jsonData = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			jsonData.append(line);
		}
		rd.close();
		conn.disconnect();

		List<Animal> animalList = AnimalResponseParser.parseJsonResponse(jsonData.toString());
		return animalList;
	}
	public static List<Animal> makeProtectAnimalList()
			throws UnsupportedEncodingException, MalformedURLException, IOException, ProtocolException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + API_KEY); /* Service Key */
		appendItem(urlBuilder, "upr_cd", BUSAN_CODE); // 시도코드 (시도 조회 OPEN API 참조)
//		appendItem(urlBuilder,"bgnde"," "); /* 유기날짜(검색 시작일) (YYYYMMDD) */
//		appendItem(urlBuilder,"endde"," "); /* 유기날짜(검색 종료일) (YYYYMMDD) */
//		appendItem(urlBuilder,"upkind"," "); /* 축종코드 (개 : 417000, 고양이 : 422400, 기타 : 429900) */
//		appendItem(urlBuilder,"kind"," "); /* 품종코드 (품종 조회 OPEN API 참조) */
//		appendItem(urlBuilder,"org_cd"," "); /* 시군구코드 (시군구 조회 OPEN API 참조) */
//		appendItem(urlBuilder,"care_reg_no"," "); /* 보호소번호 (보호소 조회 OPEN API 참조) */
		appendItem(urlBuilder,"state","protect"); /* 상태(전체 : null(빈값), 공고중 : notice, 보호중 : protect) */
//		appendItem(urlBuilder,"neuter_yn"," "); /* 상태 (전체 : null(빈값), 예 : Y, 아니오 : N, 미상 : U) */
		appendItem(urlBuilder, "pageNo", "1"); // 페이지 번호 (기본값 : 1)
		appendItem(urlBuilder, "numOfRows", "1000"); // 페이지당 보여줄 개수 (1,000 이하), 기본값 : 10
		appendItem(urlBuilder, "_type", "json"); // xml(기본값) 또는 json
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder jsonData = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			jsonData.append(line);
		}
		rd.close();
		conn.disconnect();

		List<Animal> animalList = AnimalResponseParser.parseJsonResponse(jsonData.toString());
		return animalList;
	}

	private static void appendItem(StringBuilder urlBuilder, String item, String value)
			throws UnsupportedEncodingException {
		urlBuilder.append("&" + URLEncoder.encode(item, "UTF-8") + "="
				+ URLEncoder.encode(value, "UTF-8")); /* 시도코드 (시도 조회 OPEN API 참조) */
	}

	public static List<LocalGovernment> makeLocalGovernmentList()
			throws UnsupportedEncodingException, MalformedURLException, IOException, ProtocolException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/1543061/abandonmentPublicSrvc/sigungu"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + API_KEY); /* Service Key */
		appendItem(urlBuilder, "upr_cd", BUSAN_CODE); // 시군구 상위코드(시도코드) (입력 시 데이터 O, 미입력 시 데이터 X)
		appendItem(urlBuilder, "_type", "json"); // xml(기본값) 또는 json
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("HTTP error code: " + conn.getResponseCode());
		}
		BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		StringBuilder responseContent = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			responseContent.append(line);
		}
		rd.close();
		conn.disconnect();
		return LocalGovernmentJsonParser.parseJsonResponse(responseContent.toString());
	}
	
	public static boolean checkLocalGovernmentList(String locate) {
		for(LocalGovernment LGL : localGovernmentList) {
			if(LGL.getOrgdownNm().equals(locate)) {
				return true;
			}
		}
		return false;
		
	}

	public static List<Animal> getAllAnimalList() {
		return allAnimalList;
	}

	public static List<LocalGovernment> getLocalGovernmentList() {
		return localGovernmentList;
	}
}
