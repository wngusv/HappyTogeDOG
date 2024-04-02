package LocalStrays;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.ProtocolException;
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

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String localGovernment = request.getParameter("orgName");
		if (localGovernment == null || localGovernment.equals("all")) {
			request.setAttribute("animalList", LocalStrayListUpdateListener.getAllAnimalList());
		} else {
			List<Animal> animalList = getAnimalsByLocalGovernment(localGovernment);
			request.setAttribute("animalList", animalList);
		}
		request.setAttribute("localGovernmentList", LocalStrayListUpdateListener.getLocalGovernmentList());
		response.setContentType("text/html;charset=UTF-8");
		request.getRequestDispatcher("/local-strays.jsp").forward(request, response);
	}

	private static List<Animal> getAnimalsByLocalGovernment(String localGovernment)
			throws UnsupportedEncodingException, MalformedURLException, IOException, ProtocolException {
		List<Animal> animalsInLocalGovernment = new ArrayList<>();

		for (Animal animal : LocalStrayListUpdateListener.getAllAnimalList()) {
			if (animal.getOrgNm().contains(localGovernment)) {
				animalsInLocalGovernment.add(animal);
			}
		}

		return animalsInLocalGovernment;
	}

}