<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>기부</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
#paypal-container-67S6SPN9VDZ3L {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
</head>
<body>
	<header>
		<div class="container">
			<h1>기부</h1>
			<nav>
				<ul>
					<li><a href="index.jsp">홈으로</a></li>
					<li><a href="signupform.jsp">회원가입</a></li>
					<li><a id="login-button" href="login.jsp">로그인</a></li>
				</ul>
			</nav>
		</div>
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

	<footer>
		<div class="container">
			<p>&copy; 2024 Pet. 모든 권리 보유.</p>
		</div>
	</footer>
</body>
</html>
