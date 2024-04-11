<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Util.MyWebContextListener"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/floating-banner.jsp"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<header class="my-header">
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>


.card {
	margin-bottom: 20px;
}

.card img {
	max-width: 100%;
	height: auto;
}
</style>
</header>
<body style="background-color: rgb(254, 247, 222);">
	    <jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
	<%
	String num = request.getParameter("num");
	if (num != null && !num.isEmpty()) {
		String query = "SELECT * FROM dogwalker WHERE num = ?";
		try (Connection conn = MyWebContextListener.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);) {
			pstmt.setInt(1, Integer.parseInt(num));
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
		String title = rs.getString("title");
		String size = rs.getString("size");
		String day = rs.getString("day");
		String time = rs.getString("time");
		String address = rs.getString("address");
		String addressDetail = rs.getString("address_detail");
		double pay = rs.getDouble("pay");
		String content = rs.getString("content");
		Timestamp todayDate = rs.getTimestamp("today_date");
		String fileName1 = rs.getString("fileName1");
		String fileRealName1 = rs.getString("fileRealName1");
		String fileRoute1 = rs.getString("file_route1");
		String fileName2 = rs.getString("fileName2");
		String fileRealName2 = rs.getString("fileRealName2");
		String fileRoute2 = rs.getString("file_route2");
		String fileName3 = rs.getString("fileName3");
		String fileRealName3 = rs.getString("fileRealName3");
		String fileRoute3 = rs.getString("file_route3");
		String fileName4 = rs.getString("fileName4");
		String fileRealName4 = rs.getString("fileRealName4");
		String fileRoute4 = rs.getString("file_route4");
		String fileName5 = rs.getString("fileName5");
		String fileRealName5 = rs.getString("fileRealName5");
		String fileRoute5 = rs.getString("file_route5");
	%>
	<div class="card">
		<div class="card-body">
			<table class="table">
				<tbody>
					<tr>
						<th scope="row">제목</th>
						<td><%=title%></td>
					</tr>
					<tr>
						<th scope="row">작성 날짜</th>
						<td><%=todayDate%></td>
					</tr>
					<tr>
						<th scope="row">크기</th>
						<td><%=size%></td>
					</tr>
					<tr>
						<th scope="row">요일</th>
						<td><%=day%></td>
					</tr>
					<tr>
						<th scope="row">시간</th>
						<td><%=time%></td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td><%=address%> <%=addressDetail%></td>
					</tr>
					<tr>
						<th scope="row">시급</th>
						<td><%=pay%> 원</td>
					</tr>
					<tr>
						<th scope="row">소개</th>
						<td><%=content%></td>
					</tr>
				</tbody>
			</table>
			<div class="row">
				<%
				if (fileName1 != null && !fileName1.isEmpty()) {
				%>
				<div class="col-md-2">
					<img src="<%=request.getContextPath()%>/image/<%=fileRealName1%>"
						class="img-fluid" alt="Dog Photo1">
				</div>
				<%
				}
				%>
				<%
				if (fileName2 != null && !fileName2.isEmpty()) {
				%>
				<div class="col-md-2">
					<img src="<%=request.getContextPath()%>/image/<%=fileRealName2%>"
						class="img-fluid" alt="Dog Photo2">
				</div>
				<%
				}
				%>
				<%
				if (fileName3 != null && !fileName3.isEmpty()) {
				%>
				<div class="col-md-2">
					<img src="<%=request.getContextPath()%>/image/<%=fileRealName3%>"
						class="img-fluid" alt="Dog Photo3">
				</div>
				<%
				}
				%>
				<%
				if (fileName4 != null && !fileName4.isEmpty()) {
				%>
				<div class="col-md-2">
					<img src="<%=request.getContextPath()%>/image/<%=fileRealName4%>"
						class="img-fluid" alt="Dog Photo4">
				</div>
				<%
				}
				%>
				<%
				if (fileName5 != null && !fileName5.isEmpty()) {
				%>
				<div class="col-md-2">
					<img src="<%=request.getContextPath()%>/image/<%=fileRealName5%>"
						class="img-fluid" alt="Dog Photo5">
				</div>
				<%
				}
				%>
			</div>

		</div>
	</div>


	<%
	}
	rs.close();
	pstmt.close();
	conn.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	}
	%>
	<a href="/walk-jobs.jsp" class="btn btn-primary" style="background-color: rgb(235, 111, 98); color: white;; border-color: rgb(235, 111, 98);">목록으로 돌아가기</a>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%@ include file="/WEB-INF/footer.jsp"%>
</body>
</html>
