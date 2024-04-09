package board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.MyWebContextListener;

@WebServlet("/boardDeleteServlet.do")
public class boardDeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idx = request.getParameter("idx");
		if (idx != null && !idx.isEmpty()) {
			String sql = "DELETE FROM board WHERE idx = ?";
			try (Connection conn = MyWebContextListener.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);) {
				pstmt.setInt(1, Integer.parseInt(idx));

				pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			}

			// mypage.jsp로 리다이렉트
			response.sendRedirect("/mypage.jsp");
		}
	}

}
