package SignIn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Util.MyWebContextListener;

public class FindIDDAO {

	public String findID(String name, String phone) {
		// TODO: 본인인증 숫자랑 일치하는지 확인후 본인인증 번호랑 일치하면 디비로 들어가기
		
		
		
		
		
		
		
		String sql = "SELECT id FROM user where user_name = ? and phone = ? ";
		try (Connection conn = MyWebContextListener.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, name);
			stmt.setString(2, phone);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					String id = rs.getString("id");
					return id; // id 반환
				}else {
					return null;
				} 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
