package LocalSite;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class LocalGovernmentJsonParser {
    public static List<LocalGovernment> parseJsonResponse(String jsonResponse) {
        List<LocalGovernment> localGovernmentList = new ArrayList<>();
        try {
            JSONObject jsonObj = new JSONObject(jsonResponse);
            JSONObject responseObj = jsonObj.getJSONObject("response");
            JSONObject bodyObj = responseObj.getJSONObject("body");
            JSONObject itemsObj = bodyObj.getJSONObject("items");
            JSONArray itemArray = itemsObj.getJSONArray("item");

            for (int i = 0; i < itemArray.length(); i++) {
                JSONObject itemObj = itemArray.getJSONObject(i);
                String uprCd = itemObj.getString("uprCd");
                String orgCd = itemObj.getString("orgCd");
                String orgdownNm = itemObj.getString("orgdownNm");

                LocalGovernment localGovernment = new LocalGovernment(uprCd, orgCd, orgdownNm);
                localGovernmentList.add(localGovernment);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return localGovernmentList;
    }
}