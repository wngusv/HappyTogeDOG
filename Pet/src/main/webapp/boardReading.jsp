<%@page import="Util.MyWebContextListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
</head>
<body>
	<%
	String idx = request.getParameter("idx");
	if (idx != null && !idx.isEmpty()) {

		String sql = "SELECT * FROM board WHERE idx = ?";
		try (Connection conn = MyWebContextListener.getConnection(); 
				PreparedStatement psmt = conn.prepareStatement(sql)) {
			psmt.setInt(1, Integer.parseInt(idx));
			try (ResultSet rs = psmt.executeQuery();) {
		if (rs.next()) {
			//제목 아이디 글 사진 + 댓글...
			String title = rs.getString("title");
			String id = rs.getString("id");
			String content = rs.getString("content");
			String sfile = rs.getString("sfile");
	%>
	<h2>
		<%=title%>
	</h2>
	<p>
		아이디:
		<%=id%></p>
	<p>
		내용:
		<%=content%></p>
	<img src="<%=sfile%>" alt="게시글 사진 오류">

	<%
			}
			}
		}
	}
	%>

</body>
</html>
