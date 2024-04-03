package board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SignIn.User;
import dao.UserDAO;


@WebServlet("/comment.do")
public class comment extends HttpServlet { // 유저가 쓴 댓글 action으로 가져오기 => 디비에도 넣고, 리다이렉트 게시글보여주는 jsp이동 => 그 게시글 댓글 보이게 만들어줘야됨. 
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    HttpSession session = req.getSession();
	    String userId = (String)session.getAttribute("userId");
	    User user = null;

	    if(userId != null) {
	        user = UserDAO.getUserById(userId);
	        // 댓글 내용 받아오기
	        String comment = req.getParameter("comment");
	        // 여기서 'comment'는 <textarea> 태그의 name 속성값.

	        // TODO: 댓글 처리 로직 구현 (예: 데이터베이스에 저장)
	        // 예를 들어, CommentDAO 클래스의 메서드를 호출하여 댓글을 저장할 수 있습니다.
	        
	        // 게시글 보기 페이지로 리다이렉트
	        resp.sendRedirect("boardReading.jsp?idx=" + idx); // 'idx'는 게시글의 식별자입니다.
	    } else {
	        // 로그인하지 않은 경우, 로그인 페이지나 메시지 표시 등의 처리
	    }
	}

	 
	 

}
