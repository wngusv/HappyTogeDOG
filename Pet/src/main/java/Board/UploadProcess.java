package Board;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Util.MyWebContextListener;

@WebServlet("/UploadProcess.do")
@MultipartConfig(maxFileSize = 1024 * 1024 * 1, maxRequestSize = 1024 * 1024 * 10)
public class UploadProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fileUploadPath = getServletContext().getInitParameter("fileUploadPath");
			 File uploadDirFile = new File(fileUploadPath);
			    if (!uploadDirFile.exists()) {
			        uploadDirFile.mkdirs(); // 디렉토리가 존재하지 않으면 생성
			    }
			String originalFileName = FileUtil.uploadFile(req, fileUploadPath);
			System.out.println(originalFileName);
			insertMyFile(req, resp, originalFileName, originalFileName);
			resp.sendRedirect("board.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("errorMessage", "파일 업로드 오류");
			req.getRequestDispatcher("boardWrite.jsp").forward(req, resp);
		}
	}

	private void insertMyFile(HttpServletRequest req, HttpServletResponse resp, String oFileName, String sFileName)
			throws ServletException, IOException {
		// 세션에서 사용자 ID 가져오기
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("userId");

		if (userId == null) {
			// 사용자가 로그인하지 않은 경우 처리
			req.setAttribute("errorMessage", "로그인을 해주세요.");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
			return;
		}

		// 로그인한 회원 동네
		String town = null;
		String sql_neighborhood = "SELECT CASE WHEN address LIKE '%시%' THEN LEFT(address, LOCATE('시', address)) WHEN address LIKE '%군%' THEN LEFT(address, LOCATE('군', address)) WHEN address LIKE '%구%' THEN LEFT(address, LOCATE('구', address)) END AS neighborhood FROM user WHERE id = ? AND (address LIKE '%시%' OR address LIKE '%군%' OR address LIKE '%구%')";
		try (Connection conn = MyWebContextListener.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql_neighborhood)) {
			stmt.setString(1, userId);

			try (ResultSet rs = stmt.executeQuery();) {
				if (rs.next()) {
					town = rs.getString("neighborhood");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String title = req.getParameter("title");
		String category = req.getParameter("category");
		String content = req.getParameter("content");

		WritingDTO dto = new WritingDTO();
		dto.setTitle(title);
		dto.setCategory(category);
		dto.setContent(content);
		dto.setOfile(oFileName);
		dto.setSfile(sFileName);
		dto.setId(userId); // DTO에 사용자 ID 설정
		dto.setTown(town);

		WritingDAO dao = new WritingDAO();
		dao.insertFile(dto);
	}

}
