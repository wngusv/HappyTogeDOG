package carpool;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet(urlPatterns = "/initServlet", loadOnStartup = 1)
public class InitServlet extends HttpServlet {
	@Override
	public void init() throws ServletException {
		List<Post> posts = new ArrayList<>();
		// 초기 게시글 데이터 생성
		posts.add(new Post(1, "첫 번째 게시글", "내용", "user1", System.currentTimeMillis()));
		posts.add(new Post(2, "두 번째 게시글", "내용", "user2", System.currentTimeMillis()));

		// 서블릿 컨텍스트에 게시글 목록 저장
		getServletContext().setAttribute("posts", posts);
	}
}
