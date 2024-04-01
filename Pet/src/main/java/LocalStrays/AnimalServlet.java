package LocalStrays;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LocalSite.LocalGovernment;
import LocalSite.LocalGovernmentJsonParser;
import lombok.Getter;

@Getter
@WebServlet("/AnimalServlet")
public class AnimalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 여기에 본인의 인증키를 넣어주세요
	private static final String API_KEY = "9tP0rrmdgYvkDyrkZFzOXRhcivDyQrpntkl/4XCMaH207D5iwNA7sDGOipABXA18dCTX9Bykv5qYyKj44fQl2g==";
	private static final String BUSAN_CODE = "6260000";
	private static final long UPDATE_INTERVAL = 60 * 60 * 1000;

	public static List<Animal> allAnimalList;
	public static List<LocalGovernment> localGovernmentList;

	// 데이터 업데이트 메서드

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String localGovernment = request.getParameter("orgName");
		if (localGovernment == null || localGovernment.equals("all")) {
			request.setAttribute("animalList", allAnimalList);

		} else {

			List<Animal> animalList = getAnimalsByLocalGovernment(localGovernment);

			// 동물 객체 리스트를 JSP 페이지로 전달
			request.setAttribute("animalList", animalList);
		}

		// Animal 객체 리스트를 JSP 페이지로 전달
		request.setAttribute("localGovernmentList", localGovernmentList);

		// content type 및 character encoding 설정
		response.setContentType("text/html;charset=UTF-8");

		// JSP 페이지로 forward
		request.getRequestDispatcher("/local-strays.jsp").forward(request, response);

	}

	private static List<Animal> getAnimalsByLocalGovernment(String localGovernment)
			throws UnsupportedEncodingException, MalformedURLException, IOException, ProtocolException {
		List<Animal> animalsInLocalGovernment = new ArrayList<>();

		for (Animal animal : allAnimalList) {
			if (animal.getOrgNm().contains(localGovernment)) {
				animalsInLocalGovernment.add(animal);
			}
		}

		return animalsInLocalGovernment;
	}

	public static List<Animal> getAllAnimal()
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
//		appendItem(urlBuilder,"state"," "); /* 상태(전체 : null(빈값), 공고중 : notice, 보호중 : protect) */
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

	public static List<LocalGovernment> getLocalGovernmentList()
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
}