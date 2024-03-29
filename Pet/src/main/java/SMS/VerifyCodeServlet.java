package SMS;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VerifyCodeServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 세션에서 저장된 인증번호 가져오기
	    HttpSession session = request.getSession();
	    String savedCode = (String) session.getAttribute("authCode");

	    // 클라이언트로부터 받은 인증번호
	    String userCode = request.getParameter("code");

	    // 인증번호 검증
	    if (savedCode != null && savedCode.equals(userCode)) {
	        response.getWriter().write("인증되었습니다.");
	    } else {
	        response.getWriter().write("인증번호가 일치하지 않습니다.");
	    }
	}

}
