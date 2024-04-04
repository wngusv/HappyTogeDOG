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
import javax.servlet.http.HttpSession;

import Util.LocalStrayListUpdateListener;

@WebServlet("/AnimalServlet")
public class AnimalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sessionLocate = (String) request.getSession().getAttribute("locate");
		String localGovernment = null;
		localGovernment = request.getParameter("orgName");
		// 로그인을 해서 로그인 지역이 저장되있을때
		if (sessionLocate != null) {
			if (LocalStrayListUpdateListener.checkLocalGovernmentList(localGovernment)) {
				List<Animal> animalList = getAnimalsByLocalGovernment(localGovernment);
				request.setAttribute("animalList", animalList);
				request.setAttribute("nowLocate", localGovernment);
			} else if (localGovernment != null && localGovernment.equals("all")) {
				request.setAttribute("animalList", LocalStrayListUpdateListener.getAllAnimalList());
				request.setAttribute("nowLocate", "우리 지역");
			} else {
				if (LocalStrayListUpdateListener.checkLocalGovernmentList(sessionLocate)) {
					List<Animal> animalList = getAnimalsByLocalGovernment(sessionLocate);
					request.setAttribute("animalList", animalList);
					request.setAttribute("nowLocate", sessionLocate);
				} else {
					request.setAttribute("animalList", LocalStrayListUpdateListener.getAllAnimalList());
					request.setAttribute("nowLocate", "우리 지역");
				}
			}
			// 로그인울 안해서 지역정보가 없을때.
		} else if (sessionLocate == null && LocalStrayListUpdateListener.checkLocalGovernmentList(localGovernment)) {
			List<Animal> animalList = getAnimalsByLocalGovernment(localGovernment);
			request.setAttribute("animalList", animalList);
			request.setAttribute("nowLocate", localGovernment);
		} else {
			request.setAttribute("animalList", LocalStrayListUpdateListener.getAllAnimalList());
			request.setAttribute("nowLocate", "우리 지역");
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