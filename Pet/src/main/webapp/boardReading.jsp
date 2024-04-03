<%@page import="Util.MyWebContextListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<!-- 부트스트랩 CSS 추가 -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.post-title {
	font-size: 2rem; /* 제목 크기 */
	color: #007bff; /* 제목 색상 */
}

.post-meta {
	font-size: 1rem; /* 메타 데이터 폰트 크기 */
	color: #6c757d; /* 메타 데이터 색상 */
}

.post-content {
	font-size: 1.2rem; /* 내용 폰트 크기 */
	margin-top: 20px; /* 상단 여백 */
}

.post-image {
	margin-top: 20px; /* 이미지 상단 여백 */
}
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="card">
			<div class="card-body">
				<%
				String idx = request.getParameter("idx");
				if (idx != null && !idx.isEmpty()) {
					String sql = "SELECT * FROM board WHERE idx = ?";
					try (Connection conn = MyWebContextListener.getConnection(); PreparedStatement psmt = conn.prepareStatement(sql)) {
						psmt.setInt(1, Integer.parseInt(idx));
						try (ResultSet rs = psmt.executeQuery();) {
					if (rs.next()) {
						String title = rs.getString("title");
						String id = rs.getString("id");
						String content = rs.getString("content");
						String sfile = rs.getString("sfile");
				%>
				<h2 class="post-title"><%=title%></h2>
				<div class="text-right">
					<p class="post-meta">
						작성자:
						<%=id%></p>
				</div>
				<div class="post-content">
					<%=content%>
				</div>
				<%
				if (sfile != null && !sfile.isEmpty()) {
				%>
				<img src="<%=sfile%>" alt="게시글 사진" class="img-fluid post-image">
				<%
				}
				%>
				<br>
				<!-- 댓글쓰기 버튼 추가 -->
				<div class="comment-section">
					<!-- 댓글 입력 폼 -->
					<form action="/comment.do" method="post">
						<label for="comment-input">댓글</label>
						<textarea id="comment-input" name="comment" class="form-control"
							rows="3"></textarea>
						<button type="submit" class="btn btn-primary mt-2">댓글쓰기</button>
					</form>
				</div>

				<%
				}
				}
				} catch (Exception e) {
				e.printStackTrace();
				}
				} else {
				// idx가 없거나 비어 있는 경우
				out.println("<p>게시글을 찾을 수 없습니다.</p>");
				}
				%>
			</div>
		</div>
	</div>
	<!-- 부트스트랩 JavaScript 및 종속성 파일 -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.6/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
