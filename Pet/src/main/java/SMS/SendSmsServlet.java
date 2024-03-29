package SMS;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class SendSmsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 사용자의 전화번호를 요청 파라미터에서 가져옵니다.
        String phoneNumber = request.getParameter("phone");
        
        // SMS 객체를 생성하고 SMS를 발송합니다.
        SMS sms = new SMS();
        sms.sendSMS(phoneNumber); // sendSMS 메서드를 수정하여 전화번호를 인자로 받도록 변경해야 할 수 있습니다.
        
        // SMS 발송 결과를 사용자에게 알려줍니다. (예제에서는 단순화를 위해 생략)
        response.getWriter().write("SMS has been sent.");
    }
}
