package SMS;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SignIn.FindIDDAO;

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
	       // String userFindId = new FindIDDAO().findID(사용자 이름, 사용자 폰 번호);
	     // 사용자 이름과 전화번호를 받아옵니다.
	        String userName = request.getParameter("name");
	        String userPhone = request.getParameter("phone");

	        // 데이터베이스에서 사용자 아이디를 찾습니다.
	        FindIDDAO findIDDAO = new FindIDDAO();
	        String userFindId = findIDDAO.findID(userName, userPhone);

	        if (userFindId != null) {
	            response.getWriter().write(" 찾은 아이디: " + userFindId);
	        }else {
	            response.getWriter().write(" 해당 정보로 등록된 아이디를 찾을 수 없습니다.");
	        }
	    } else {
	        response.getWriter().write("인증번호가 일치하지 않습니다.");
	    }
	}

}
