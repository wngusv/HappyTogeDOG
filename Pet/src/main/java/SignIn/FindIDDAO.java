package SignIn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Util.MyWebContextListener;

public class FindIDDAO { // id랑 pw 찾는 dao인데,, 지금 이름 바꾸면 다른 클래스 수정하다가 깃허브 부숴질 것 같아서.. 아직 안 바꿈 

	public String findID(String name, String phone) {
		
		
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
	
	
	public String findPW(String name, String phone) {
		
		
		String sql = "SELECT pw FROM user where user_name = ? and phone = ? ";
		try (Connection conn = MyWebContextListener.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, name);
			stmt.setString(2, phone);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					String pw = rs.getString("pw");
					return pw; // id 반환
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
