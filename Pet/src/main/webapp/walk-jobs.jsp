<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Util.MyWebContextListener" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
            <h1>게시글 목록</h1>
            <% 
                try {
                    Connection connection = MyWebContextListener.getConnection();
                    int recordsPerPage = 10;
                    int currentPage = 1;
                    if (request.getParameter("currentPage") != null) {
                        currentPage = Integer.parseInt(request.getParameter("currentPage"));
                    }
                    int start = (currentPage - 1) * recordsPerPage;
                    String query = "SELECT * FROM pet.dogwalker ORDER BY num DESC LIMIT ?, ?";
                    PreparedStatement ps = connection.prepareStatement(query);
                    ps.setInt(1, start);
                    ps.setInt(2, recordsPerPage);
                    ResultSet rs = ps.executeQuery();
            %>
            <table border="1">
                <tr>
                    <td>번호</td>
                    <td>근무지</td>
                    <td>제목</td>
                    <td>근무 요일</td>
                    <td>근무 시간</td>
                    <td>급여</td>
                    <td>작성일</td>
                </tr>
                <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("num") %></td>
                    <td><%= rs.getString("address") %></td>
                    <td><a href="dogwalking/dogwalking_board_read.jsp?num=<%= rs.getInt("num") %>"><%= rs.getString("title") %></a></td>
                    <td><%= rs.getString("day") %></td>
                    <td><%= rs.getString("time") %></td>
                    <td><%= rs.getInt("pay") %></td>
                    <td><%= rs.getTimestamp("today_date") %></td>
                </tr>
                <% } %>
            </table>
            <% 
                // 페이징 처리
                String countQuery = "SELECT COUNT(*) AS total FROM pet.dogwalker";
                PreparedStatement countPs = connection.prepareStatement(countQuery);
                ResultSet countRs = countPs.executeQuery();
                countRs.next();
                int totalRecords = countRs.getInt("total");
                int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
            %>
            <div class="pagination">
                <% if(currentPage > 1) { %>
                <a href="walk-jobs.jsp?currentPage=<%= currentPage - 1 %>">이전</a>
                <% } %>

                <% for(int i = 1; i <= totalPages; i++) { %>
                <% if(i == currentPage) { %>
                <span class="current"><%= i %></span>
                <% } else { %>
                <a href="walk-jobs.jsp?currentPage=<%= i %>"><%= i %></a>
                <% } %>
                <% } %>

                <% if(currentPage < totalPages) { %>
                <a href="walk-jobs.jsp?currentPage=<%= currentPage + 1 %>">다음</a>
                <% } %>
            </div>
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
