package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Util.MyWebContextListener;

public class WritingDAO {
	// 새로운 게시물 입력
	public int insertFile(WritingDTO dto) {
		int applyResult = 0;
		String sql = "INSERT INTO board (title, category, content, ofile, sfile, id) VALUES (?, ?, ?, ?, ?, ?)";


		try(Connection conn = MyWebContextListener.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, dto.getTitle());
			System.out.println("카테고리: " + dto.getCategory());
			stmt.setString(2, dto.getCategory());
			stmt.setString(3, dto.getContent());
			stmt.setString(4, dto.getOfile());
			stmt.setString(5, dto.getSfile());
			stmt.setString(6, dto.getId());


			
			applyResult = stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("INSERT 중 예외 발생");
			e.printStackTrace();
		}
		return applyResult;
	}
}
