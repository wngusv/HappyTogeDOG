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
				System.out.println("아이디 비밀번호 확인 완료");
			} else {
				resp.sendRedirect("../login.html");
				HttpSession session = req.getSession();
				session.setAttribute("username", username);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}