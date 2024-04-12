package dogwalking;


import Util.MyWebContextListener;
import userManagement.User;
import userManagement.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GetUserAddressServlet", value = "/GetUserAddressServlet")
public class GetUserAddressServlet extends HttpServlet {
 @Override
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     HttpSession session = request.getSession();
     String userId = (String) session.getAttribute("userId");
     User user = UserDAO.getUserById(userId);
     
     if (user != null) {
         response.setContentType("application/json");
         response.setCharacterEncoding("UTF-8");
         response.getWriter().write("{\"address\":\"" + user.getAddress() + "\", \"address_detail\":\"" + user.getAddress_detail() + "\"}");
     } else {
         response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
     }
 }
}
