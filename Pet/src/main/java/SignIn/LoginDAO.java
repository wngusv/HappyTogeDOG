package SignIn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Util.MyWebContextListener;

public class LoginDAO {

	public boolean checkLogin(String Id, String Password) throws SQLException {
		String sql = "select * from user where id= ? and pw= ? ;";
		try (Connection conn = MyWebContextListener.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, Id);
			stmt.setString(2, Password);
			try (ResultSet rs = stmt.executeQuery()) {
				return rs.next();
			}
		}

	}
}
