<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/floating-banner.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>기부</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
#paypal-container-67S6SPN9VDZ3L {
	position: fixed;
	top: 40%;
	left: 1100px; /* 좌측으로 이동 */
	transform: translateY(-50%);
}

/* 이미지 상단에 빈 공간 추가 */
.img-container {
	margin-top: 80px;
}
</style>
</head>
<body style="padding-top: 100px; background-color: rgb(254, 247, 222);">
	<header>
		<%
request.setAttribute("pageTitle", "유기견 기부");
%>
		<jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
	</header>

	<main>
		<div class="container">
			<div class="row">
				<!-- 이미지 좌측에 배치 -->
				<div class="col-md-6">
					<div class="img-container">
						<img src="/images/유기견3.jpg" alt="기부하기">
					</div>
				</div>

				<!-- 흰 이미지와 PayPal 버튼을 겹치도록 배치 -->
				<div class="col-md-6 img-container" style="position: relative;">
					<img src="/images/기부.png" alt="기부하기" style="width: 80%;">

					<!-- PayPal 버튼 -->
					<div id="paypal-container-67S6SPN9VDZ3L"
						style="position: absolute; top: 78%; left: 41%; transform: translate(-50%, -50%) scale(1);">
						<script
							src="https://www.paypal.com/sdk/js?client-id=BAAXk4KAIJ9L9-tmdyfOzfe7cySPZlzIqWkHJ22iPR4239hwkoZy0iABHvRRaV0SieAo7FEUoDB4SEiRqE&components=hosted-buttons&disable-funding=venmo&currency=USD"></script>
						<div id="paypal-container-ZFXQWUMJYVG48"></div>
						<script>
							paypal.HostedButtons({
								hostedButtonId : "ZFXQWUMJYVG48",
							}).render("#paypal-container-ZFXQWUMJYVG48")
						</script>
					</div>
				</div>

			</div>
		</div>
	</main>

<%@ include file="/WEB-INF/footer.jsp"%>
</body>
</html>
