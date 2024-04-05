package carpool;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/viewPost")
public class ViewPostServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String postId = request.getParameter("id");
		List<Post> posts = (List<Post>) getServletContext().getAttribute("posts");
		System.out.println(posts);
		Post selectedPost = null;
		for (Post post : posts) {
			if (post.getId() == Integer.parseInt(postId)) {
				selectedPost = post;
				break;
			}
		}
		request.setAttribute("selectedPost", selectedPost);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/carpool-viewpost.jsp");
		dispatcher.forward(request, response);
	}
}
