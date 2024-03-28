package SignUp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProcessSignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 회원가입 양식에서 제출된 데이터를 받아옵니다.
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // 받아온 데이터를 처리합니다. 실제로는 여기서 데이터베이스에 저장하거나 다른 처리를 해야 합니다.
        // 여기에서는 간단히 콘솔에 출력합니다.
        System.out.println("회원가입 정보");
        System.out.println("아이디: " + id);
        System.out.println("비밀번호: " + password);
        System.out.println("이름: " + name);
        System.out.println("전화번호: " + phone);
        System.out.println("주소: " + address);

        // 회원가입 정보를 처리한 후 메인 페이지로 리다이렉트합니다.
        response.sendRedirect("index.jsp");
    }
}
