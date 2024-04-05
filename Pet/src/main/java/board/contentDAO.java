package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Util.MyWebContextListener;

public class contentDAO {
	private contentDTO dto;
	private List<contentDTO> contents = new ArrayList<>();
	
	public List<contentDTO> selectContents(String post_idx){
	    String sql = "SELECT * FROM comment_content WHERE post_idx = ? ORDER BY content_time DESC";
	    List<contentDTO> contents = new ArrayList<>(); // 댓글 목록 초기화

	    try(Connection conn = MyWebContextListener.getConnection();
	            PreparedStatement pst = conn.prepareStatement(sql)){
	        pst.setString(1, post_idx);

	        try (ResultSet rs = pst.executeQuery()) {
	            while (rs.next()) {
	                contentDTO dto = new contentDTO(); // 각 댓글에 대한 새 DTO 객체 생성
	                dto.setNum(String.valueOf(rs.getInt("num")));
	                dto.setId(rs.getString("id"));
	                dto.setContent(rs.getString("content"));
	                dto.setContent_time(rs.getTimestamp("content_time").toString());
	                dto.setLike(String.valueOf(rs.getInt("like")));
	                dto.setDislike(String.valueOf(rs.getInt("dislike")));

	                contents.add(dto); // 생성된 객체를 목록에 추가
	            }
	            return contents; // 완성된 목록 반환
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return null; // 오류 발생 시 null 반환
	}

}
