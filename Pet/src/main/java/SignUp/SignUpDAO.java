package SignUp;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
}