<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>산책 아르바이트</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body style="padding-top: 150px;">
    <header>
        <div class="container">
            <h1>산책 아르바이트</h1>
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
    </header>

    <main>
        <div class="container">
            <section class="strays-info">
                <h2>산책 아르바이트</h2>
                    <button onclick="location.href='dogwalking/form_new.jsp'">글쓰기</button>
            </section>
        </div>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2024 Pet. 모든 권리 보유.</p>
        </div>
    </footer>
</body>
</html>
