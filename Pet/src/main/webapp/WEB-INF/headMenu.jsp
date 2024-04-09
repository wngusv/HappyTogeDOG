<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/floating-banner.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도기도기</title>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
    }
    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: rgb(250, 230, 163);
        padding: 10px 50px;
    }
    .nav-menu, .navbar-nav {
        display: flex;
        list-style: none;
        padding: 0;
    }
    .nav-menu li, .navbar-nav li {
        padding: 0 20px;
    }
    .nav-menu li a, .navbar-nav li a {
        text-decoration: none;
        color: rgb(59, 39, 8);
        font-size: 18px;
        font-weight: bold;
        position: relative; /* 상대 위치 설정 */
        display: inline-block; /* 인라인 블록 요소로 설정하여 호버 효과가 텍스트를 가리지 않도록 함 */
        padding: 10px 20px; /* 선택된 메뉴의 배경 크기 조정 */
        border-radius: 20px; /* 선택된 메뉴의 모서리를 둥글게 설정 */
    }
    .nav-menu li.active a, .navbar-nav li.active a {
        background-color: #fff; /* 선택된 메뉴의 배경색을 흰색으로 지정 */
        color: rgb(255, 144, 61); /* 활성화된 메뉴의 색상 설정 */
    }
    /* 별도 클래스 추가 */
    .user-info a, .user-info span,
    .user-info img {
        font-size: 14px; /* 선택된 메뉴와 다른 글자 크기 설정 */
        font-weight: normal; /* bold체 해제 */
    }

    .user-info img {
        width: 25px; /* 이미지 크기 조정 */
        height: 25px;
        vertical-align: middle;
    }

    .nav-menu li a:hover, .navbar-nav li a:hover,
    .nav-menu li a:focus, .navbar-nav li a:focus {
        color: rgb(255, 144, 61);
    }
    #username-container {
        padding-right: 20px;
    }
    #logout-button, #login-button {
        color: #007bff;
        text-decoration: none;
    }
    #logout-button:hover, #login-button:hover {
        text-decoration: underline;
    }

</style>
<script>
    // JavaScript를 사용하여 현재 페이지의 URL과 메뉴 항목의 링크 URL을 비교하여 활성화 클래스를 추가함
    document.addEventListener("DOMContentLoaded", function() {
        var currentPageUrl = window.location.href;
        var menuItems = document.querySelectorAll(".nav-menu li a, .navbar-nav li a");
        menuItems.forEach(function(item) {
            if (item.href === currentPageUrl) {
                item.parentElement.classList.add("active");
            }
        });
    });
</script>
</head>
<body>

<div class="header">
    <a href="index.jsp">
    <img src="/images/Group 35.png" alt="로고 이미지">
</a>
    <ul class="nav-menu">
        <li><a href="walk-jobs.jsp">산책 아르바이트</a></li>
        <li><a href="pet-facilities.jsp">반려동물 시설</a></li>
        <li><a href="/AnimalServlet">지역 유기동물</a></li>
        <li><a href="local-shelters.jsp">지역 유기견 보호센터</a></li>
        <li><a href="carpool-main.jsp">반려견 카풀</a></li>
        <li><a href="board.jsp">게시판</a></li>
    </ul>
    <ul class="navbar-nav">
        <c:choose>
            <c:when test="${sessionScope.userId != null}">
                <li id="username-container" class="user-info"><span id="username-greeting">안녕하세요, ${sessionScope.userName}님!</span> <a id="logout-button" href="./api/logout">로그아웃</a></li>
                <li><a href="mypage.jsp"><img src="/images/마이페이지.png" alt="마이페이지">마이페이지</a></li>

            </c:when>
            <c:otherwise>
                <li><a id="login-button" href="login.jsp">로그인</a></li>
                <li><a id="signup-button" href="signupform.jsp">회원가입</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>

</body>
</html>
