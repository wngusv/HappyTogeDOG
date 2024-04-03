 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,Util.MyWebContextListener,dao.UserDAO,SignIn.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>산책 아르바이트</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body style="padding-top: 150px;">
    <header>
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

    <main>
        <div class="container">
            <section class="strays-info">
                <h2>산책 아르바이트</h2>
                    <button onclick="location.href='dogwalking/form_new.jsp'">글쓰기</button>
                    <!-- 게시글 목록 추가 -->
            <h1>게시글 목록</h1>
            <% 
                try {
                    Connection connection = Util.MyWebContextListener.getConnection();
                    String query = "SELECT * FROM pet.dogwalker ORDER BY num DESC";
                    PreparedStatement ps = connection.prepareStatement(query);
                    ResultSet rs = ps.executeQuery();
                %>
            <table border="1">
                <tr>
                    <td>번호</td>
                    <td>제목</td>
                    <td>작성일</td>
                </tr>
                <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("num") %></td>
                    <td><a href="dogwalking/dogwalking_board_read.jsp?num=<%= rs.getInt("num") %>"><%= rs.getString("title") %></a></td>
                    <td><%= rs.getTimestamp("today_date") %></td>
                </tr>
                <% } %>
            </table>
            <%
            } catch (Exception e) {
                out.println("오류가 발생했습니다. 오류 메시지: " + e.getMessage());
            }
            %>
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