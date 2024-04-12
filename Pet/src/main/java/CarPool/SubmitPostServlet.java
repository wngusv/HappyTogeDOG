package CarPool;

import java.io.BufferedReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/submit-post")
public class SubmitPostServlet extends HttpServlet {
    private Gson gson = new Gson();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청 본문에서 JSON 데이터 읽기
        StringBuilder sb = new StringBuilder();
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }
        String requestData = sb.toString(); // JSON 데이터를 문자열로 변환

        // JSON 문자열을 Post 자바 객체로 변환
        Post newPost = gson.fromJson(requestData, Post.class);

        // 서블릿 컨텍스트에서 게시글 목록 가져오기
        List<Post> posts = (List<Post>) getServletContext().getAttribute("posts");
        if (posts == null) {
            posts = new ArrayList<>(); // 게시글 목록이 없으면 새로 생성
        }
        newPost.setId(posts.size()+1);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date currentDate = new Date();
        String formattedDateTime = dateFormat.format(currentDate);
        newPost.setCreatedAt(formattedDateTime);
        // 새 게시글 추가
        posts.add(newPost);

        // 게시글 목록을 다시 서블릿 컨텍스트에 저장
        getServletContext().setAttribute("posts", posts);

        // 응답 JSON 생성 및 전송
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"message\":\"Post submitted successfully\"}");
    }
}
