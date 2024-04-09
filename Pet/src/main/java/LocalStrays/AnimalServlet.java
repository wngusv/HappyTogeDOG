package LocalStrays;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.LocalStrayListUpdateListener;

@WebServlet("/AnimalServlet")
public class AnimalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<Animal> animalList;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String localGovernment = request.getParameter("orgName");
		String sessionLocate = (String) request.getSession().getAttribute("locate");
		String page = request.getParameter("page");
		if (page == null) {
	        page = "1";
	    }

		animalList = new ArrayList<>();
		List<Animal> realAnimalList = new ArrayList<>();
		String nowLocate = "우리 지역";

		if (localGovernment != null) {
			if (LocalStrayListUpdateListener.checkLocalGovernmentList(localGovernment)) {
				animalList = getAnimalsByLocalGovernment(localGovernment);
				nowLocate = localGovernment;
			} else if (localGovernment.equals("all")) {
				animalList = LocalStrayListUpdateListener.getAllAnimalList();
				nowLocate = "우리 지역";
			} else {
				animalList = LocalStrayListUpdateListener.getAllAnimalList();
				nowLocate = "우리 지역";
			}
		} else if (sessionLocate != null && LocalStrayListUpdateListener.checkLocalGovernmentList(sessionLocate)) {
			animalList = getAnimalsByLocalGovernment(sessionLocate);
			nowLocate = makeRealLocate(sessionLocate);
		} else {
			animalList = LocalStrayListUpdateListener.getAllAnimalList();
			nowLocate = "우리 지역";
		}
		
		realAnimalList = pageOfAnimalList(page, animalList);
		int totalPage = countAll(animalList);
		

		request.setAttribute("animalList", realAnimalList);
		request.setAttribute("pages", totalPage);
		request.setAttribute("nowLocate", nowLocate);
		request.setAttribute("localGovernmentList", LocalStrayListUpdateListener.getLocalGovernmentList());

		request.getRequestDispatcher("/local-strays.jsp").forward(request, response);
	}

	private int countAll(List<Animal> animalList) {
		int totalPage = animalList.size() / 20;
		totalPage += animalList.size() % 20 == 0 ? 0 : 1;
		return totalPage;
	}

	private List<Animal> pageOfAnimalList(String page, List<Animal> animalList) {
		int pageSize = 20;

		// 페이지 번호
		int pageNumber = Integer.valueOf(page); // 예시로 2페이지를 선택

		// 시작 인덱스 계산
		int startIndex = (pageNumber - 1) * pageSize;
		// 끝 인덱스 계산
		int endIndex = pageNumber * pageSize;

		// 시작 인덱스와 끝 인덱스를 벗어나지 않도록 보정
		startIndex = Math.min(startIndex, animalList.size());
		endIndex = Math.min(endIndex, animalList.size());

		// 선택된 동물들의 리스트
		List<Animal> selectedAnimals = animalList.subList(startIndex, endIndex);

		return selectedAnimals;
	}

	private static List<Animal> getAnimalsByLocalGovernment(String localGovernment) {
		List<Animal> animalsInLocalGovernment = new ArrayList<>();
		String extractedPart = makeRealLocate(localGovernment);
		for (Animal animal : LocalStrayListUpdateListener.getAllAnimalList()) {
			if (animal.getOrgNm().contains(extractedPart)) {
				animalsInLocalGovernment.add(animal);
			}
		}
		return animalsInLocalGovernment;
	}

	private static String makeRealLocate(String localGovernment) {
		String location = localGovernment;
		int lastSpaceIndex = location.lastIndexOf(" ");
		String extractedPart = lastSpaceIndex != -1 ? location.substring(lastSpaceIndex + 1) : location;
		return extractedPart;
	}
}
