<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        color: #333;
    }
    .nav-menu li a:hover, .navbar-nav li a:hover {
        color: #007bff;
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
</head>
<body>

<div class="header">
    <a href="index.jsp">
    <img src="/images/Group 35.png" alt="도기도기 이미지">
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
                <li id="username-container"><span id="username-greeting">안녕하세요, ${sessionScope.userName}님!</span> <a id="logout-button" href="./api/logout">로그아웃</a></li>
                <li><a href="mypage.jsp"><img src="/images/마이페이지.png" alt="마이페이지" style="width: 30px; height: 30px; vertical-align: middle;"></a></li>

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
