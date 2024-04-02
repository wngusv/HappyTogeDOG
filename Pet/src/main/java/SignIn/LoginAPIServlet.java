package SignIn;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/api/login")

public class LoginAPIServlet extends HttpServlet {
	LoginDAO loginDao = new LoginDAO();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		String password = req.getParameter("userPassword");
		try {
			User user = loginDao.checkLogin(userId, password);
			if (user != null) {
				HttpSession session = req.getSession();
				session.setAttribute("userId", user.getId());
				session.setAttribute("userName", user.getName());

				// 로그인 정보를 URL 파라미터로 전달
				String redirectUrl = "../index.jsp" ;
				resp.sendRedirect(redirectUrl);
			} else {
				  resp.sendRedirect("../login.html");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}