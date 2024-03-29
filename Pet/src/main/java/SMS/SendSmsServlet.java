package SMS;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class SendSmsServlet extends HttpServlet {
	// SendSmsServlet.java 수정
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String phoneNumber = request.getParameter("phone");
	    
	    SMS sms = new SMS();
	    int authCode = sms.sendSMS(phoneNumber); // 인증번호 반환받음
	    
	    // 세션에 인증번호 저장
	    HttpSession session = request.getSession();
	    session.setAttribute("authCode", String.valueOf(authCode));
	    
	    response.getWriter().write("SMS has been sent.");
	}

}
