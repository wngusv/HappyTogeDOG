package UserManagement;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/ProcessSignupServlet")
public class ProcessSignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;

	public void init() {
		userDAO = new UserDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 회원가입 양식에서 제출된 데이터를 받아옵니다.
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String address_detail = request.getParameter("address_detail");

		User user = new User(id, password, name, phone, address, address_detail);
		try {
			userDAO.signUp(user);
			// 성공 메시지를 세션에 저장
			
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("signupError", "회원가입 중 오류가 발생했습니다.");
		}
		
        response.sendRedirect("index.jsp");
	}
}