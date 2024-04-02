
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
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
                <li id="username-container">
                  <span id="username-greeting">
                    안녕하세요, ${sessionScope.userName}님!
                  </span>
                  <a id="logout-button" href="./api/logout">로그아웃</a>
                </li>
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
          <li><a href="donations.jsp">기부</a></li>
          <li><a href="board.jsp">게시판</a></li>
        </ul>
      </div>
    </section>
    </header>


    <footer>
      <div class="container">
        <p>&copy; 2024 pet. All rights reserved.</p>
      </div>
    </footer>
  </body>
</html>
