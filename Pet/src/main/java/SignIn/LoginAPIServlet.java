package SignIn;

import java.io.IOException;
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
		String username = req.getParameter("userName");
		String password = req.getParameter("userPassword");
		try {
			if (loginDao.checkLogin(username, password)) {
				HttpSession session = req.getSession();
				session.setAttribute("username", username);

				// 로그인 정보를 URL 파라미터로 전달
				String redirectUrl = "../index.html?login=success";
				resp.sendRedirect(redirectUrl);
			} else {
				resp.sendRedirect("../login.html");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}