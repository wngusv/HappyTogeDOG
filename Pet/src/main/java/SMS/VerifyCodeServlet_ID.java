package SMS;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VerifyCodeServlet_ID extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    String savedCode = (String) session.getAttribute("authCode");
	    String userCode = request.getParameter("code");

	    System.out.println("Saved Code: " + savedCode);
	    System.out.println("User Code: " + userCode);

	    if (savedCode != null && savedCode.equals(userCode)) {
	        response.getWriter().write("인증되었습니다.");
	        // 디비에 들어가기
	        // String sql = "SELECT id FROM user where "
	    } else {
	        response.getWriter().write("인증번호가 일치하지 않습니다.");
	    }
	}

}
