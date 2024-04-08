<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헤드 메뉴</title>
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .navbar {
            background-color: #FFA500; /* 주황색 배경 */
        }

        .navbar-brand, .navbar-nav .nav-link {
            color: #FFD700; /* 노랑색 글자 */
        }

        .navbar-nav .nav-link:hover {
            color: #FFE4B5; /* 베이지색으로 호버 시 글자 색 변경 */
        }

        .menubox {
            max-width: 100%
        }

        .menu {
            margin-top: 58px;
            background-color: #FFD700; /* 노랑색 배경 */
            color: #FF4500; /* 주황색 글자 */
            padding-top: 25px;
            width: 80%;
        }

        .menu ul {
            list-style: none;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .menu ul li {
            display: inline-block;
            margin: 0 10px;
        }

        .menu ul li a {
            color: #FF4500; /* 주황색 글자 */
            text-decoration: none;
            font-size: 18px;
            transition: all 0.3s ease;
        }

        .menu ul li a:hover {
            color: #FF6347; /* 살구색으로 호버 시 글자 색 변경 */
        }

        .board {
            background-color: #f8f9fa;
            padding: 20px;
            margin-top: 20px;
        }
    </style>
</head>

<body>

    <header>

        <nav class="navbar navbar-expand-lg navbar-dark bg-beige">
            <div class="container">
                <a class="navbar-brand" href="#"><c:out value="${pageTitle}" /></a>
                <a class="navbar-brand" href="index.jsp"><c:out value="     홈" /></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><c:choose>
                                <c:when test="${sessionScope.userId != null}">
                                    <li id="username-container"><span id="username-greeting">안녕하세요,
                                            ${sessionScope.userName}님! </span> <a id="logout-button"
                                            href="./api/logout">로그아웃</a></li>
                                    <li><a href="mypage.jsp">마이페이지</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a id="login-button" href="login.jsp">로그인</a></li>
                                    <li><a id="login-button" href="signupform.jsp">회원가입</a></li>
                                </c:otherwise>
                            </c:choose></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <section class="menu">
        <div class="menubox">
            <ul class="nav justify-content-center">
                <li class="nav-item"><a class="nav-link" href="walk-jobs.jsp">산책 아르바이트</a></li>
                <li class="nav-item"><a class="nav-link" href="pet-facilities.jsp">반려동물 시설</a></li>
                <li class="nav-item"><a class="nav-link" href="/AnimalServlet">지역 유기동물</a></li>
                <li class="nav-item"><a class="nav-link" href="local-shelters.jsp">지역 유기견 보호센터</a></li>
                <li class="nav-item"><a class="nav-link" href="carpool-main.jsp">반려견 카풀</a></li>
                <li class="nav-item"><a class="nav-link" href="donations.jsp">기부</a></li>
                <li class="nav-item"><a class="nav-link" href="board.jsp">게시판</a></li>
            </ul>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition,
                    showError);
            } else {
                alert("Geolocation is not supported by this browser.");
            }
        }

        function showPosition(position) {
            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/saveLocation", true);
            xhr.setRequestHeader("Content-Type",
                "application/x-www-form-urlencoded;charset=UTF-8");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    console.log("Location saved successfully");
                }
            };
            var data = "latitude=" + encodeURIComponent(latitude)
                + "&longitude=" + encodeURIComponent(longitude);
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

        window.onload = function () {
            var userId = "${sessionScope.userId}";
            if (userId) {
                getLocation();
            }
        };
    </script>
</body>

</html>
