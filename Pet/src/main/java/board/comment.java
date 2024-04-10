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
		int postIdx = Integer.parseInt(req.getParameter("postIdx"));
		String type = req.getParameter("action");

		if (userId != null) {
			// '추천' 또는 '비추천' 문자열

			// 데이터베이스 연결과 로직을 처리합니다.
			String checkSql = "SELECT * FROM comment WHERE post_idx = ? AND id = ?";

			try (Connection conn = MyWebContextListener.getConnection();
					PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {

				checkStmt.setInt(1, postIdx);
				checkStmt.setString(2, userId);

				try (ResultSet rs = checkStmt.executeQuery()) {
					if (rs.next()) {
						String existingType = rs.getString("type");
						// Null 체크
						if (existingType == null || existingType.equals(type)) {
							// 추천/비추천이 없거나 같은 타입이면 삭제
							String deleteSql = "DELETE FROM comment WHERE post_idx = ? AND id = ?";
							try (PreparedStatement deleteStmt = conn.prepareStatement(deleteSql)) {
								deleteStmt.setInt(1, postIdx);
								deleteStmt.setString(2, userId);
								deleteStmt.executeUpdate();
							}
						} else {
							// 다른 타입이면 업데이트
							String updateSql = "UPDATE comment SET type = ? WHERE post_idx = ? AND id = ?";
							try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
								updateStmt.setString(1, type);
								updateStmt.setInt(2, postIdx);
								updateStmt.setString(3, userId);
								updateStmt.executeUpdate();
							}
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

			// 추천 및 비추천 카운트를 계산
			int recommendationCount = 0;
			int notRecommendationCount = 0;
			try (Connection conn = MyWebContextListener.getConnection()) {
				// 추천 카운트 쿼리
				String sqlRec = "SELECT COUNT(*) AS rec_count FROM comment WHERE post_idx = ? AND type = '추천'";
				try (PreparedStatement psmtRec = conn.prepareStatement(sqlRec)) {
					psmtRec.setInt(1, postIdx);
					try (ResultSet rsRec = psmtRec.executeQuery()) {
						if (rsRec.next()) {
							recommendationCount = rsRec.getInt("rec_count");
						}
					}
				}
				// 비추천 카운트 쿼리
				String sqlNotRec = "SELECT COUNT(*) AS not_rec_count FROM comment WHERE post_idx = ? AND type = '비추천'";
				try (PreparedStatement psmtNotRec = conn.prepareStatement(sqlNotRec)) {
					psmtNotRec.setInt(1, postIdx);
					try (ResultSet rsNotRec = psmtNotRec.executeQuery()) {
						if (rsNotRec.next()) {
							notRecommendationCount = rsNotRec.getInt("not_rec_count");
						}
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
				// 에러 발생 시 JSON 응답을 통해 클라이언트에게 전달
				resp.setContentType("application/json");
				PrintWriter out = resp.getWriter();
				out.print("{\"status\": \"error\", \"message\": \"" + e.getMessage() + "\"}");
				return;
			}

			// JSON 형식으로 카운트 정보를 클라이언트에 반환
			resp.setContentType("application/json");
			PrintWriter out = resp.getWriter();
			out.print("{\"status\": \"success\", \"recommendationCount\": " + recommendationCount
					+ ", \"notRecommendationCount\": " + notRecommendationCount + "}");
		} else {
			// 로그인하지 않은 경우, 로그인 페이지나 메시지 표시 등의 처리
			// 예: 로그인 페이지로 리다이렉트
			resp.sendRedirect("login.jsp");
		}
	}

}
