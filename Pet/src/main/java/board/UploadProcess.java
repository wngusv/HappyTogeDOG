package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UploadProcess.do")
@MultipartConfig(
	maxFileSize = 1024 * 1024 * 1,
	maxRequestSize = 1024 * 1024 * 10
		)
public class UploadProcess extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String saveDirectory = getServletContext().getRealPath("/Upload");
			String originalFileName = FileUtil.uploadFile(req, saveDirectory);
			String saveFileName = FileUtil.renameFile(saveDirectory, originalFileName);
			insertMyFile(req, originalFileName, saveFileName);
			resp.sendRedirect("board.jsp"); 
		} catch(Exception e) {
			e.printStackTrace();
			req.setAttribute("errorMessage", "파일 업로드 오류");
			req.getRequestDispatcher("boardWrite.jsp").forward(req, resp);
		}
	}
	
	private void insertMyFile(HttpServletRequest req, String oFileName, String sFileName) {
		String title = req.getParameter("title");
		String category = req.getParameter("category");
		String content = req.getParameter("content");
		
		WritingDTO dto = new WritingDTO();
		dto.setTitle(title);
		dto.setCategory(category);
		dto.setContent(content);
		dto.setOfile(oFileName);
		dto.setSfile(sFileName);
		
		 // 세션에서 사용자 ID 가져오기
	    HttpSession session = req.getSession();
	    String userId = (String) session.getAttribute("userId"); 
	    // DTO에 사용자 ID 설정
	    dto.setId(userId);
	    
		
		WritingDAO dao = new WritingDAO();
		dao.insertFile(dto);
	}
	
	
}
