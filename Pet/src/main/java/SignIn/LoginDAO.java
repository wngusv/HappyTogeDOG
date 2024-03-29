package SignIn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Util.MyWebContextListener;

public class LoginDAO {

	public User checkLogin(String Id, String Password) throws SQLException {
		String sql = "select * from user where id= ? and pw= ? ;";
		try (Connection conn = MyWebContextListener.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, Id);
			stmt.setString(2, Password);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					User user = User.builder().Id(rs.getString("id")).Password(rs.getString("pw"))
							.Name(rs.getString("user_name")).PhoneNumber(rs.getString("phone"))
							.address(rs.getString("address")).address_detail(rs.getString("address_detail")).build();
					return user;
				} 
			}
		}
		return null;

	}
}
