package Util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/saveLocation")
public class SaveLocationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String KAKAO_API_KEY = "6fd61546029991d1579f63505b573f96";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            double latitude = Double.parseDouble(request.getParameter("latitude"));
            double longitude = Double.parseDouble(request.getParameter("longitude"));
            System.out.println(latitude);
            System.out.println(longitude);
            String address = getAddressFromKakaoMapAPI(latitude, longitude);
            System.out.println(address);
            String region2DepthName = parseRegion2DepthName(address);
            System.out.println(region2DepthName);
            // 여기서 address를 원하는 작업에 활용

        } catch (Exception e) {
            e.printStackTrace();
            // 오류 발생 시 처리
        }
    }

    private String getAddressFromKakaoMapAPI(double latitude, double longitude) throws Exception {
        StringBuilder apiUrl = new StringBuilder("https://dapi.kakao.com/v2/local/geo/coord2address.json");
        apiUrl.append("?x=").append(longitude);
        apiUrl.append("&y=").append(latitude);
        apiUrl.append("&input_coord=WGS84");

        URL url = new URL(apiUrl.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "KakaoAK " + KAKAO_API_KEY);

        int responseCode = conn.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // 주소 정보를 추출하여 반환
            return response.toString();
        } else {
            // 요청 실패 시 예외 처리
            throw new Exception("KakaoMap API request failed with response code: " + responseCode);
        }
    }
    
    public static String parseRegion2DepthName(String json) {
        String region2DepthName = null;
        JSONObject jsonObject = new JSONObject(json);
        JSONArray documents = jsonObject.getJSONArray("documents");
        if (documents.length() > 0) {
            JSONObject addressObject = documents.getJSONObject(0).getJSONObject("address");
            region2DepthName = addressObject.getString("region_2depth_name");
        }
        return region2DepthName;
    }
}
