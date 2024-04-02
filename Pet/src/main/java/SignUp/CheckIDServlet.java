package SignUp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckIDServlet")
public class CheckIDServlet extends	HttpServlet {
	 private static final long serialVersionUID = 1L;
	    private SignUpDAO signUpDAO;

	    public void init() {
	        signUpDAO = new SignUpDAO();
	    }

	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    	req.setCharacterEncoding("UTF-8");
	    	
	    	String id = req.getParameter("id");
	        boolean isDuplicate = signUpDAO.checkID(id);
	        if (isDuplicate) {
	        	req.setCharacterEncoding("UTF-8");
	        	System.out.println("이미사용중인아이디");
	            resp.getWriter().write("이미 사용 중인 아이디입니다.");
	        } else {
	        	req.setCharacterEncoding("UTF-8");
	        	System.out.println("사용가능한아이디");
	            resp.getWriter().write("사용 가능한 아이디입니다.");
	        }
	    }
}
