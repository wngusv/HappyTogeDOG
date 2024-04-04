<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카풀 메인</title>
<link rel="stylesheet" type="text/css" href="styles.css">


</head>
<body>

	<body style="padding-top: 150px;">
		<header>
		<%
		request.setAttribute("pageTitle", "반려견 카풀");
		%>
		<jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
	</header>
	<main>
		<div class="container">
			<button onclick="openPopup()">카풀 모집</button>
		</div>
	</main>

	<footer>
		<div class="container">
			<p>&copy; 2024 Pet. 모든 권리 보유.</p>
		</div>
	</footer>
	<script>
		function openPopup() {
			// 팝업 창을 열기 위한 옵션 설정
			var popupOptions = "width=600,height=400,top=100,left=100";

			// JSP 파일이 위치한 경로
			var jspUrl = "carpool-map.jsp";

			// 팝업 창 열기
			window.open(jspUrl, "_blank", popupOptions);
		}
	</script>
	
</body></html>