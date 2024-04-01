package LocalStrays;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class AnimalResponseParser {

	public static List<Animal> parseJsonResponse(String jsonResponse) {
		List<Animal> animalList = new ArrayList<>();
		ObjectMapper mapper = new ObjectMapper();

		try {
			JsonNode rootNode = mapper.readTree(jsonResponse);
			JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

			for (JsonNode itemNode : itemsNode) {
				Animal animal = new Animal();
				animal.setDesertionNo(itemNode.path("desertionNo").asText());
				animal.setFilename(itemNode.path("filename").asText());
				animal.setHappenDt(itemNode.path("happenDt").asText());
				animal.setHappenPlace(itemNode.path("happenPlace").asText());
				animal.setKindCd(itemNode.path("kindCd").asText());
				animal.setColorCd(itemNode.path("colorCd").asText());
				animal.setAge(itemNode.path("age").asText());
				animal.setWeight(itemNode.path("weight").asText());
				animal.setNoticeNo(itemNode.path("noticeNo").asText());
				animal.setNoticeSdt(itemNode.path("noticeSdt").asText());
				animal.setNoticeEdt(itemNode.path("noticeEdt").asText());
				animal.setPopfile(itemNode.path("popfile").asText());
				animal.setProcessState(itemNode.path("processState").asText());
				animal.setSexCd(itemNode.path("sexCd").asText());
				animal.setNeuterYn(itemNode.path("neuterYn").asText());
				animal.setSpecialMark(itemNode.path("specialMark").asText());
				animal.setCareNm(itemNode.path("careNm").asText());
				animal.setCareTel(itemNode.path("careTel").asText());
				animal.setCareAddr(itemNode.path("careAddr").asText());
				animal.setOrgNm(itemNode.path("orgNm").asText());
				animal.setChargeNm(itemNode.path("chargeNm").asText());
				animal.setOfficetel(itemNode.path("officetel").asText());

				animalList.add(animal);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return animalList;
	}
}