<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>메인페이지</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
<style>
body {
	margin: 0;
	padding: 0;
	height: 100%;
	overflow-y: auto; /* 세로 스크롤만 허용 */
	overflow-x: hidden; /* 가로 스크롤 없애기 */
}

.full-screen-bg {
	width: 100vw;
	height: calc(100vh - 120px); /* 헤더 높이만큼 뺀 나머지 높이 */
	margin-top: 120px; /* 헤더와 겹치지 않도록 상단 여백 설정 */
	position: relative;
	background-image: url('/images/메인최종2.png');
	background-position: center; /* 이미지를 가운데 정렬 */
	background-repeat: no-repeat; /* 이미지 반복 방지 */
	background-size: contain; /* 이미지를 가로, 세로 비율에 맞게 조정 */
}
</style>
</head>
<body style="background-color: #FFEFD5;">
	<header>
		<%
		request.setAttribute("pageTitle", "메인페이지");
		%>
		<jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
	</header>

	<div class="full-screen-bg"></div>

	<script src="forIndex.js" defer></script>
	<%@ include file="/WEB-INF/footer.jsp"%>
</body>
</html>
