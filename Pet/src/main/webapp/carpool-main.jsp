<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/floating-banner.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카풀 메인</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.rounded-border {
	width: 50vw;
	border-radius: 10px;
	border: 1px solid #ccc;
	cursor: pointer;
	margin: 0 auto;
	border-radius: 10px;
	border: 2px solid rgb(111, 94, 75);
}

.centered-message {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100px; /* 높이를 조정하여 중앙 정렬을 더 잘 보여줄 수 있습니다 */
	margin-bottom: 10px;
	padding: 10px;
}
</style>
</head>
<body style="background-color: rgb(254, 247, 222);">
	<header>
		<%
		request.setAttribute("pageTitle", "반려견 카풀");
		%>
		<jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
	</header>
	<main>
		<div class="container">
			<button onclick="checklogin();"
				style="float: right; margin-top: 200px;">카풀 모집</button>
			<h2 style="margin-top: 200px;">반려견 카풀</h2>
			<c:if test="${empty posts}">
				<div class="rounded-border centered-message">등록된 글이 없습니다.</div>
			</c:if>
			<c:if test="${not empty posts}">
				<c:forEach items="${posts}" var="post">
					<div class="rounded-border"
						onclick="window.location.href='/viewPost?id=${post.id}';"
						style="cursor: pointer; margin-bottom: 10px; padding: 10px;">
						<p>제목: ${post.title}</p>
						<p>출발지: ${post.startInput} (${post.startRoadInput})</p> 
						<p>도착지: ${post.endInput} (${post.endRoadInput})</p>
						<p>작성자: ${post.userId}</p>
						<p>등록 시간: ${post.createdAt}</p>
					</div>
				</c:forEach>
			</c:if>

		</div>
	</main>
	<footer>
		<div class="container"></div>
	</footer>
	<script>
       	function checklogin() {
       		var login = '<%=session.getAttribute("userId")%>';
			if (login == "null" || login == "") {
				alert("로그인이 필요합니다.")
				window.location.href = 'login.jsp';
				return;
			}
			window.location.href = 'carpool-map.jsp';
		}
	</script>
</body>
</html>
