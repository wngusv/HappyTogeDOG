package SignUp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SignIn.User;
import SignUp.SignUpDAO;

//@WebServlet("/SignupServlet")
public class ProcessSignupServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   private SignUpDAO SignUpDAO;

   public void init() {
      SignUpDAO = new SignUpDAO();
   }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 회원가입 양식에서 제출된 데이터를 받아옵니다.
        String id = req.getParameter("id");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String address_detail = req.getParameter("address_detail");

        User user = new User(id, password, name, phone, address, address_detail);
        try {
         SignUpDAO.signUp(user);
         
         req.getRequestDispatcher("login.html").forward(req, resp);
      } catch (Exception e) {
         e.printStackTrace();
      }
//        response.sendRedirect("index.jsp");
    }
}