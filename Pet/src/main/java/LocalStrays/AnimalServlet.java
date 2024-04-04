package LocalStrays;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.LocalStrayListUpdateListener;

@WebServlet("/AnimalServlet")
public class AnimalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String localGovernment = request.getParameter("orgName");
		String sessionLocate = (String) request.getSession().getAttribute("locate");

		List<Animal> animalList = new ArrayList<>();
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
			nowLocate = sessionLocate;
		} else {
			animalList = LocalStrayListUpdateListener.getAllAnimalList();
			nowLocate = "우리 지역";
		}

		request.setAttribute("animalList", animalList);
		request.setAttribute("nowLocate", nowLocate);
		request.setAttribute("localGovernmentList", LocalStrayListUpdateListener.getLocalGovernmentList());

		request.getRequestDispatcher("/local-strays.jsp").forward(request, response);
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
}
