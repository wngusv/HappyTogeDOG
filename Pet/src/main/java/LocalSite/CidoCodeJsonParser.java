package LocalSite;

import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class CidoCodeJsonParser {
    public static List<CidoCode> parseJsonResponse(String jsonResponse) {
        List<CidoCode> cidoCodeList = new ArrayList<>();
        try {
            JSONObject jsonObj = new JSONObject(jsonResponse);
            JSONObject responseObj = jsonObj.getJSONObject("response");
            JSONObject bodyObj = responseObj.getJSONObject("body");
            JSONObject itemsObj = bodyObj.getJSONObject("items");

            // "item" 키가 없을 경우 처리
            if (!itemsObj.has("item")) {
                System.out.println("No 'item' key found in JSON response.");
                return cidoCodeList;
            }

            JSONArray itemArray = itemsObj.getJSONArray("item");

            for (int i = 0; i < itemArray.length(); i++) {
                JSONObject itemObj = itemArray.getJSONObject(i);

                // "orgCd"와 "orgdownNm" 키가 없을 경우 처리
                if (!itemObj.has("orgCd") || !itemObj.has("orgdownNm")) {
                    System.out.println("Missing key 'orgCd' or 'orgdownNm' in item " + i);
                    continue; // 다음 반복으로 넘어감
                }

                String orgCd = itemObj.getString("orgCd");
                String orgdownNm = itemObj.getString("orgdownNm");

                CidoCode cidoCode = new CidoCode(orgCd, orgdownNm);
                cidoCodeList.add(cidoCode);
            }
        } catch (JSONException e) {
            System.out.println("Error parsing JSON response: " + e.getMessage());
        }
        return cidoCodeList;
    }
}
