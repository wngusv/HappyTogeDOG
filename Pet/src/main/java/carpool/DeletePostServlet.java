package carpool;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deletePost")
public class DeletePostServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Post> posts = (List<Post>) getServletContext().getAttribute("posts");
		String userId = (String) req.getSession().getAttribute("userId");
		String postIdStr = req.getParameter("id");
		Integer postId = Integer.valueOf(postIdStr); 
		if (userId != null) {
			for (Post post : posts) {
				if (post.getId()==postId && post.getUserId().equals(userId)) {
					posts.remove(post);
					req.setAttribute("posts", posts);
					resp.setStatus(200);
					resp.sendRedirect("/mypage.jsp");
				}
			}
		}else {
			resp.sendRedirect("/mypage.jsp");
		}
	}

}
