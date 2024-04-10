package board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

import Util.MyWebContextListener;

@WebServlet("/commentSortServlet.do")
public class commentSortServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderType = request.getParameter("orderType");
        String postIdx = request.getParameter("postIdx");

        // SQL 쿼리에 따른 정렬 로직
        String sql = "SELECT * FROM comment_content WHERE post_idx = ?";
        if ("mostLiked".equals(orderType)) {
            sql += " ORDER BY `like` DESC";
        } else if ("latest".equals(orderType)) {
            sql += " ORDER BY content_time DESC";
        }

        List<JSONObject> comments = new ArrayList<>();
        try (Connection conn = MyWebContextListener.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, postIdx);
            
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    JSONObject comment = new JSONObject();
                    comment.put("id", rs.getString("id"));
                    comment.put("content", rs.getString("content"));
                    comment.put("content_time", rs.getTimestamp("content_time").toString());
                    comment.put("like", rs.getInt("like"));
                    comment.put("dislike", rs.getInt("dislike"));
                    comment.put("commentNum", rs.getInt("num"));
                    comments.add(comment);
                }
            } catch (SQLException e) {
                e.printStackTrace(); // 서버 로그에 에러 메시지 출력
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
            }
        } catch (SQLException e1) {
        	e1.printStackTrace();
		}

        // 결과를 JSON으로 변환하여 반환
        JSONArray jsonResult = new JSONArray(comments);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResult.toString());
    }
}
