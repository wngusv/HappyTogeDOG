<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ include file="/floating-banner.jsp" %>
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
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
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
			<section class="strays-info">
				<h2>기부</h2>
			</section>
		</div>
		<script
			src="https://www.paypal.com/sdk/js?client-id=BAAXk4KAIJ9L9-tmdyfOzfe7cySPZlzIqWkHJ22iPR4239hwkoZy0iABHvRRaV0SieAo7FEUoDB4SEiRqE&components=hosted-buttons&disable-funding=venmo&currency=USD"></script>
		<div id="paypal-container-67S6SPN9VDZ3L"></div>
		<script>
			paypal.HostedButtons({
				hostedButtonId : "67S6SPN9VDZ3L",
			}).render("#paypal-container-67S6SPN9VDZ3L")
		</script>
	</main>


</body>
</html>
