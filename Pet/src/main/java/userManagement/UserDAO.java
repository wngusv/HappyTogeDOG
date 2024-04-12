package userManagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Util.MyWebContextListener;

//UserDAO.java에서 사용자 정보를 가져오는 메소드 예시
public class UserDAO {
	public static User getUserById(String userId) {
		User user = null;
		String sql = "SELECT * FROM user WHERE id = ?";

		try (Connection conn = MyWebContextListener.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, userId);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					user = new User();
					user.setId(rs.getString("id"));
					user.setPassword(rs.getString("pw"));
					user.setName(rs.getString("user_name"));
					user.setPhoneNumber(rs.getString("phone"));
					user.setAddress(rs.getString("address"));
					user.setAddress_detail(rs.getString("address_detail"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

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
				} else {
					return null;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String findPW(String name, String id, String phone) {

		String sql = "SELECT pw FROM user where user_name = ? and id = ? and phone = ? ";
		try (Connection conn = MyWebContextListener.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, name);
			stmt.setString(2, id);
			stmt.setString(3, phone);
			try (ResultSet rs = stmt.executeQuery()) {
				String pw = null;
				if (rs.next()) {
					pw = rs.getString("pw");
					return pw; // id 반환
				} else {
					return pw = null;

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void signUp(User user) {
		String sql = "INSERT INTO user(id, pw, user_name, phone, address, address_detail) VALUES (?, ?, ?, ?, ?, ?)";
		try (Connection conn = MyWebContextListener.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, user.getId());
			stmt.setString(2, user.getPassword());
			stmt.setString(3, user.getName());
			stmt.setString(4, user.getPhoneNumber());
			stmt.setString(5, user.getAddress());
			stmt.setString(6, user.getAddress_detail());
			stmt.executeUpdate();

			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean checkID(String id) {
		String sql = "SELECT COUNT(*) FROM user WHERE id = ?";
		try (Connection conn = MyWebContextListener.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, id);
			System.out.println(id);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					System.out.println("true");
					int count = rs.getInt(1);
					return count > 0; // 아이디가 이미 존재하면 true 반환
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false; // 아이디가 존재하지 않음
	}
}
