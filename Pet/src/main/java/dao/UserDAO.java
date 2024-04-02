package dao;

import Util.MyWebContextListener;
import SignIn.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}


