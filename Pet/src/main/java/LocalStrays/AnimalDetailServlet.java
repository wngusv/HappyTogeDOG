package LocalStrays;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.LocalStrayListUpdateListener;

@WebServlet("/AnimalDetailServlet")
public class AnimalDetailServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String desertionNo = req.getParameter("desertionNo");
		List<Animal> allAnimalList = LocalStrayListUpdateListener.getAllAnimalList();

		for (Animal ani : allAnimalList) {
			if (ani.getDesertionNo().equals(desertionNo)) {
				req.setAttribute("animal", ani);
			}
		}
		resp.setContentType("text/html;charset=UTF-8");
		req.getRequestDispatcher("/animalDetail.jsp").forward(req, resp);
	}

}
