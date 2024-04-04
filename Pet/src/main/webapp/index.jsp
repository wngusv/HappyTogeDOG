<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>메인페이지</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
.floating-banner {
	position: fixed;
	top: 180px;
	right: 20px;
	background-color: #f50057;
	color: white;
	padding: 10px;
	border-radius: 5px;
	cursor: pointer;
	z-index: 1000;
}

.floating-banner:hover {
	background-color: #c51162;
}
</style>
</head>
<body>
	<header>
		<div class="container">
			<div class="logo">
				<h1>메인페이지</h1>
			</div>
			<nav>
				<ul>
					<c:choose>
						<c:when test="${sessionScope.userId != null}">
							<li id="username-container"><span id="username-greeting">
									안녕하세요, ${sessionScope.userName}님! </span> <a id="logout-button"
								href="./api/logout">로그아웃</a></li>
							<li><a href="mypage.jsp">마이페이지</a></li>
						</c:when>
						<c:otherwise>
							<li><a id="login-button" href="login.jsp">로그인</a></li>
						</c:otherwise>
					</c:choose>
					<li><a href="signupform.jsp">회원가입</a></li>
				</ul>
			</nav>
		</div>
		<section class="menu">
			<div class="container" style="padding-top: 8px;">
				<ul>
					<li><a href="walk-jobs.jsp">산책 아르바이트</a></li>
					<li><a href="pet-facilities.jsp">반려동물 시설</a></li>
					<li><a href="/AnimalServlet">지역 유기동물</a></li>
					<li><a href="local-shelters.jsp">지역 유기견 보호센터</a></li>
					<li><a href="carpool-main.jsp">반려견 카풀</a></li>
					<li><a href="donations.jsp">기부</a></li>
					<li><a href="board.jsp">게시판</a></li>
				</ul>
			</div>
		</section>
	</header>

	<div class="floating-banner"
		onclick="window.location.href='donations.jsp';">기부</div>

	<footer>
		<div class="container">
			<p>&copy; 2024 pet. All rights reserved.</p>
		</div>
	</footer>
</body>
<script>
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition, showError);
		} else {
			alert("Geolocation is not supported by this browser.");
		}
	}

	function showPosition(position) {
		var latitude = position.coords.latitude;
		var longitude = position.coords.longitude;
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "/saveLocation", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				console.log("Location saved successfully");
			}
		};
		var data = "latitude=" + encodeURIComponent(latitude) + "&longitude=" + encodeURIComponent(longitude);
		xhr.send(data);
	}

	function showError(error) {
		switch (error.code) {
		case error.PERMISSION_DENIED:
			alert("User denied the request for Geolocation.");
			break;
		case error.POSITION_UNAVAILABLE:
			alert("Location information is unavailable.");
			break;
		case error.TIMEOUT:
			alert("The request to get user location timed out.");
			break;
		case error.UNKNOWN_ERROR:
			alert("An unknown error occurred.");
			break;
		}
	}

	window.onload = function() {
		var userId = "${sessionScope.userId}";
		if (userId) {
			getLocation();
		}
	};
</script>
</html>
