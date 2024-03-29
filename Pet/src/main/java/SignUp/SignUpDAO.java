package SignUp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import SignIn.User;
import Util.MyWebContextListener;

public class SignUpDAO {
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