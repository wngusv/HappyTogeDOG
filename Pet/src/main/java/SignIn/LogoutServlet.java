package SignIn;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/api/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 세션에서 로그인 정보를 삭제합니다.
        HttpSession session = req.getSession();
        session.removeAttribute("userId");
        session.removeAttribute("username");

        // **메인 페이지로 이동합니다.**
        String redirectUrl = "../index.jsp";
        resp.sendRedirect(redirectUrl);
    }
}