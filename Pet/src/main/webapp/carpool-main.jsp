<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카풀 메인</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
.rounded-border {
	width: 50vw; /* 요소의 너비를 뷰포트 너비의 40%로 설정 */
	border-radius: 10px; /* 요소의 모서리를 둥글게 */
	border: 1px solid #ccc; /* 경계선 스타일 설정 */
	cursor: pointer; /* 마우스 오버 시 포인터 모양으로 변경 */
	margin: 0 auto; /* 상단과 하단 마진을 0으로, 좌우 마진을 자동으로 설정하여 중앙 정렬 */
}

.rounded-border:hover {
	border-color: #007bff; /* 호버 시 테두리 색상 변경 */
}
</style>
</head>
<body>
	<header>
		<%
		request.setAttribute("pageTitle", "반려견 카풀");
		%>
		<jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
	</header>
	<main>
		<div class="container">
			<button onclick="openPopup()" style="margin-top: 200px;">카풀
				모집</button>
			<h2>게시글 목록</h2>
			<c:forEach items="${posts}" var="post">
				<div class="rounded-border"
					onclick="window.location.href='/viewPost?id=${post.id}';"
					style="cursor: pointer; margin-bottom: 10px; padding: 10px;">
					<p>제목: ${post.title}</p>
					<p>작성자: ${post.userId}</p>
					<p>등록 시간: ${post.createdAt}</p>
				</div>
			</c:forEach>

		</div>
	</main>
	<footer>
		<div class="container">
			<p>&copy; 2024 Pet. 모든 권리 보유.</p>
		</div>
	</footer>
	<script>
		function openPopup() {
			var popupOptions = "width=600,height=400,top=100,left=100";
			var jspUrl = "carpool-map.jsp";
			window.open(jspUrl, "_blank", popupOptions);
		}
	</script>
</body>
</html>
