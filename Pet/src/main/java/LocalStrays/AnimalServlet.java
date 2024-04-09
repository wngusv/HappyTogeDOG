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

import LocalSite.CidoCode;
import LocalSite.LocalGovernment;
import Util.LocalStrayListUpdateListener;

@WebServlet("/AnimalServlet")
public class AnimalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<Animal> animalList;
	List<LocalGovernment> localGovernment;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String orgName = request.getParameter("orgName");
		String cidoName = request.getParameter("cidoName");
		String sessionLocate = (String) request.getSession().getAttribute("locate");
		String page = request.getParameter("page");
		if (page == null) {
			page = "1";
		}

		animalList = new ArrayList<>();
		localGovernment = new ArrayList<LocalGovernment>();

		List<Animal> realAnimalList = new ArrayList<>();
		String nowLocate =null;

		if (cidoName != null) {
			if (LocalStrayListUpdateListener.checkCidoList(cidoName)) {
				if (orgName != null) {
					animalList=getAnimalsByLocalGovernment(orgName);
					nowLocate = orgName;
				} else {
					animalList = getAnimalsByCidoCode(cidoName);
				}
				localGovernment = sortByCidoName(cidoName);
				
			} else if (cidoName.equals("all")) {
				animalList = LocalStrayListUpdateListener.getAllAnimalList();
			} else {
				animalList = LocalStrayListUpdateListener.getAllAnimalList();
			}
		} else {
			animalList = LocalStrayListUpdateListener.getAllAnimalList();
		}

		realAnimalList = pageOfAnimalList(page, animalList);
		int totalPage = countAll(animalList);

		request.setAttribute("animalList", realAnimalList);
		request.setAttribute("pages", totalPage);
		request.setAttribute("nowLocate", nowLocate);
		request.setAttribute("Cido", LocalStrayListUpdateListener.getCidoCodeList());
		request.setAttribute("currentCido", cidoName);
		request.setAttribute("localGovernment", localGovernment);

		request.getRequestDispatcher("/local-strays.jsp").forward(request, response);
	}

	private List<LocalGovernment> sortByCidoName(String cidoName) {
		List<LocalGovernment> list = new ArrayList<LocalGovernment>();
		for (CidoCode Cido : LocalStrayListUpdateListener.getCidoCodeList()) {
			if (Cido.getOrgdownNm().equals(cidoName)) {
				for (LocalGovernment LGM : LocalStrayListUpdateListener.getLocalGovernmentList()) {
					if (LGM.getUprCd().equals(Cido.getOrgCd())) {
						list.add(LGM);
					}
				}
			}
		}
		return list;
	}

	private List<Animal> getAnimalsByCidoCode(String cidoName) {
		List<Animal> animalsInCido = new ArrayList<>();
		for (Animal animal : LocalStrayListUpdateListener.getAllAnimalList()) {
			if (animal.getOrgNm().contains(cidoName)) {
				animalsInCido.add(animal);
			}
		}
		return animalsInCido;
	}

	private static List<Animal> getAnimalsByLocalGovernment(String localGovernment) {
		List<Animal> animalsInLocalGovernment = new ArrayList<>();
		for (Animal animal : LocalStrayListUpdateListener.getAllAnimalList()) {
			if (animal.getOrgNm().contains(localGovernment)) {
				animalsInLocalGovernment.add(animal);
			}
		}
		return animalsInLocalGovernment;
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

	private static String makeRealLocate(String localGovernment) {
		String location = localGovernment;
		int lastSpaceIndex = location.lastIndexOf(" ");
		String extractedPart = lastSpaceIndex != -1 ? location.substring(lastSpaceIndex + 1) : location;
		return extractedPart;
	}
}
