package board;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SignIn.User;
import Util.MyWebContextListener;
import dao.UserDAO;

@WebServlet("/comment.do")
public class comment extends HttpServlet { // 유저가 쓴 댓글 action으로 가져오기 => 디비에도 넣고, 리다이렉트 게시글보여주는 jsp이동 => 그 게시글 댓글 보이게
											// 만들어줘야됨.

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("userId");
		// User user = null; 유저 안 만들어도 될 것 같기둥..

		if (userId != null) {
			// user = UserDAO.getUserById(userId); // 공감한 유저 아이디

			int postIdx = Integer.parseInt(req.getParameter("postIdx")); // 게시글 Idx
			String type = req.getParameter("type"); // '추천' 또는 '비추천' 문자열

			// 데이터베이스 연결과 로직을 처리합니다.
			// 예: DB에 추천/비추천 상태 업데이트(insert or update)
			String checkSql = "SELECT * FROM comment WHERE post_idx = ? AND id = ?";

			try (Connection conn = MyWebContextListener.getConnection();
					PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {

				checkStmt.setInt(1, postIdx);
				checkStmt.setString(2, userId);

				try (ResultSet rs = checkStmt.executeQuery()) {
					if (rs.next()) {
						// 이미 추천/비추천이 있다면, 업데이트 처리
						String updateSql = "UPDATE comment SET type = ? WHERE post_idx = ? AND id = ?";
						try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
							updateStmt.setString(1, type);
							updateStmt.setInt(2, postIdx);
							updateStmt.setString(3, userId);
							updateStmt.executeUpdate();
						}
					} else {
						// 추천/비추천이 없다면, 새로 추가
						String insertSql = "INSERT INTO comment (post_idx, id, type) VALUES (?, ?, ?)";
						try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
							insertStmt.setInt(1, postIdx);
							insertStmt.setString(2, userId);
							insertStmt.setString(3, type);
							insertStmt.executeUpdate();
						}
					}
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else {
			// 로그인하지 않은 경우, 로그인 페이지나 메시지 표시 등의 처리
		}
	}

}
