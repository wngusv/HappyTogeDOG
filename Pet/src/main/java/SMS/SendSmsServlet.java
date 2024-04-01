package SMS;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.json.JSONObject;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/api/sendSMS")
public class SendSmsServlet extends HttpServlet {
	private SMS smsService = new SMS();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StringBuilder sb = new StringBuilder();
		String line;
		try (BufferedReader reader = request.getReader()) {
			while ((line = reader.readLine()) != null) {
				sb.append(line);
			}
		} catch (Exception e) {
			// 오류 처리
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Error reading request body: " + e.getMessage());
			return;
		}

		String requestBody = sb.toString();
		JSONObject json = new JSONObject(requestBody);
		String phoneNumber = json.getString("phone");

		try {
			
			int randomNumber = smsService.sendSMS(phoneNumber);

			if (randomNumber == -1) {
				throw new Exception("Failed to send SMS.");
			}

			// 세션에 인증번호 저장
			HttpSession session = request.getSession();
			session.setAttribute("authCode", String.valueOf(randomNumber));
			// 결과를 클라이언트에게 전송
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("{\"randomNumber\": " + randomNumber + "}");
		} catch (Exception e) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error in sending SMS: " + e.getMessage());
		}
	}
}
