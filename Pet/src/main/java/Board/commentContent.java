package Board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Util.MyWebContextListener;

@WebServlet("/commentContent.do")
public class commentContent extends HttpServlet {
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		int postIdx = Integer.parseInt(request.getParameter("postIdx")); // 이거 읽어오려낭? 
		String comment = request.getParameter("comment");
		
		if (userId != null) {
			String sql = "INSERT INTO comment_content (post_idx, id, content) VALUES (?, ?, ?)";
			try(Connection conn = MyWebContextListener.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql)){
				pstmt.setInt(1, postIdx);
				pstmt.setString(2, userId);
				pstmt.setString(3, comment);
				pstmt.executeUpdate();
				
				response.sendRedirect("boardReading.jsp?idx=" + postIdx);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			// 로그인x
		}
	}

}
