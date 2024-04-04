package carpool;

import com.google.gson.Gson;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/submit-post")
public class SubmitPostServlet extends HttpServlet {

	private Gson gson = new Gson();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청 본문에서 JSON 데이터 읽기
		StringBuilder sb = new StringBuilder();
		String line;
		try (BufferedReader reader = request.getReader()) {
			while ((line = reader.readLine()) != null) {
				sb.append(line);
			}
		}
		String requestData = sb.toString();

		// JSON 문자열을 BoardData 자바 객체로 변환
		BoardData boardData = gson.fromJson(requestData, BoardData.class);

		// TODO: postData 객체를 사용하여 필요한 로직 처리

		// 응답 JSON 생성 및 전송
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("{\"message\":\"Post submitted successfully\"}");
	}

}
