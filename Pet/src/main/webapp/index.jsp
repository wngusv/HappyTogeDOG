<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/floating-banner.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>메인페이지</title>
<link rel="stylesheet" type="text/css" href="styles.css">

</head>
<body>
	<header>
		<%
		request.setAttribute("pageTitle", "메인페이지");
		%>
		<jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
	</header>
	<input type="hidden" id="userId" value="${sessionScope.userId}" />


	<footer>
		<div class="container">
			<p>&copy; 2024 pet. All rights reserved.</p>
		</div>
	</footer>
</body>
<script src="forIndex.js" defer></script>


</html>
