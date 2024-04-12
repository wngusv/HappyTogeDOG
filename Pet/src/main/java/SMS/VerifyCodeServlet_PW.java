package SMS;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import UserManagement.UserDAO;

public class VerifyCodeServlet_PW extends HttpServlet {
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
	        String userId = request.getParameter("id");
	        String userPhone = request.getParameter("phone");

	        // 데이터베이스에서 사용자 아이디를 찾습니다.
	        UserDAO userDAO = new UserDAO();
	        String userFindPW = userDAO.findPW(userName,userId, userPhone);

	        if (userFindPW != null) {
	            response.getWriter().write(" 찾은 비밀번호: " + userFindPW);
	        }else {
	            response.getWriter().write(" 해당 정보로 등록된 회원을 찾을 수 없습니다. 다시 확인해주세요.");
	        }
	    } else {
	        response.getWriter().write("인증번호가 일치하지 않습니다.");
	    }
	}

}
