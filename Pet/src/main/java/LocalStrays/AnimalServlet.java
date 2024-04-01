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

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import LocalSite.LocalGovernment;
import LocalSite.LocalGovernmentJsonParser;

@WebServlet("/AnimalServlet")
public class AnimalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 여기에 본인의 인증키를 넣어주세요
	private static final String API_KEY = "9tP0rrmdgYvkDyrkZFzOXRhcivDyQrpntkl/4XCMaH207D5iwNA7sDGOipABXA18dCTX9Bykv5qYyKj44fQl2g==";
	private static final String BUSAN_CODE = "6260000";

	private static List<Animal> allAnimalList;
	private static List<LocalGovernment> localGovernmentList;

	static {
		try {
			allAnimalList = getAllAnimal();
			localGovernmentList = getLocalGovernmentList();
			System.out.println(allAnimalList);

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Animal 객체 리스트를 JSP 페이지로 전달
		request.setAttribute("animalList", allAnimalList);
		request.setAttribute("localGovernmentList", localGovernmentList);

		// content type 및 character encoding 설정
		response.setContentType("text/html;charset=UTF-8");

		// JSP 페이지로 forward
		request.getRequestDispatcher("/local-strays.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String localGovernment = req.getParameter("localGovernment");
		if (localGovernment.equals("all")) {
			req.setAttribute("animalList", allAnimalList);

		} else {
			// 해당 지역의 동물들을 가져옵니다.
			List<Animal> animalList = getAnimalsByLocalGovernment(localGovernment);

			// 동물 객체 리스트를 JSP 페이지로 전달
			req.setAttribute("animalList", animalList);
		}
		req.setAttribute("localGovernmentList", localGovernmentList);
		// content type 및 character encoding 설정
		resp.setContentType("text/html;charset=UTF-8");

		// JSP 페이지로 forward
		req.getRequestDispatcher("/local-strays.jsp").forward(req, resp);
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

	private static List<Animal> getAllAnimal()
			throws UnsupportedEncodingException, MalformedURLException, IOException, ProtocolException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + API_KEY); /* Service Key */
//		urlBuilder.append("&" + URLEncoder.encode("bgnde", "UTF-8") + "="
//				+ URLEncoder.encode(" ", "UTF-8")); /* 유기날짜(검색 시작일) (YYYYMMDD) */
//		urlBuilder.append("&" + URLEncoder.encode("endde", "UTF-8") + "="
//				+ URLEncoder.encode(" ", "UTF-8")); /* 유기날짜(검색 종료일) (YYYYMMDD) */
//		urlBuilder.append("&" + URLEncoder.encode("upkind", "UTF-8") + "="
//				+ URLEncoder.encode(" ", "UTF-8")); /* 축종코드 (개 : 417000, 고양이 : 422400, 기타 : 429900) */
//		urlBuilder.append("&" + URLEncoder.encode("kind", "UTF-8") + "="
//				+ URLEncoder.encode(" ", "UTF-8")); /* 품종코드 (품종 조회 OPEN API 참조) */
		urlBuilder.append("&" + URLEncoder.encode("upr_cd", "UTF-8") + "="
				+ URLEncoder.encode(BUSAN_CODE, "UTF-8")); /* 시도코드 (시도 조회 OPEN API 참조) */
//		urlBuilder.append("&" + URLEncoder.encode("org_cd", "UTF-8") + "="
//				+ URLEncoder.encode(" ", "UTF-8")); /* 시군구코드 (시군구 조회 OPEN API 참조) */
//		urlBuilder.append("&" + URLEncoder.encode("care_reg_no", "UTF-8") + "="
//				+ URLEncoder.encode(" ", "UTF-8")); /* 보호소번호 (보호소 조회 OPEN API 참조) */
//		urlBuilder.append("&" + URLEncoder.encode("state", "UTF-8") + "="
//				+ URLEncoder.encode(" ", "UTF-8")); /* 상태(전체 : null(빈값), 공고중 : notice, 보호중 : protect) */
//		urlBuilder.append("&" + URLEncoder.encode("neuter_yn", "UTF-8") + "="
//				+ URLEncoder.encode(" ", "UTF-8")); /* 상태 (전체 : null(빈값), 예 : Y, 아니오 : N, 미상 : U) */
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "="
				+ URLEncoder.encode("1", "UTF-8")); /* 페이지 번호 (기본값 : 1) */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
				+ URLEncoder.encode("1000", "UTF-8")); /* 페이지당 보여줄 개수 (1,000 이하), 기본값 : 10 */
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "="
				+ URLEncoder.encode("json", "UTF-8")); /* xml(기본값) 또는 json */
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

	private static List<LocalGovernment> getLocalGovernmentList()
			throws UnsupportedEncodingException, MalformedURLException, IOException, ProtocolException {
		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/1543061/abandonmentPublicSrvc/sigungu"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + API_KEY); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("upr_cd", "UTF-8") + "="
				+ URLEncoder.encode(BUSAN_CODE, "UTF-8")); /* 시군구 상위코드(시도코드) (입력 시 데이터 O, 미입력 시 데이터 X) */
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "="
				+ URLEncoder.encode("json", "UTF-8")); /* xml(기본값) 또는 json */
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