package carpool;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/showPosts")
public class ShowPostsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 서블릿 컨텍스트에서 게시글 목록 가져오기
        List<Post> posts = (List<Post>) getServletContext().getAttribute("posts");

        // 게시글 목록을 request 속성에 저장 후 JSP로 포워드
        request.setAttribute("posts", posts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/showPosts.jsp");
        dispatcher.forward(request, response);
    }
}
