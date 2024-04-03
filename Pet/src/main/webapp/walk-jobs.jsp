<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Util.MyWebContextListener" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>산책 아르바이트</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body style="padding-top: 150px;">
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">산책 아르바이트</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <c:choose>
                        <c:when test="${sessionScope.userId != null}">
                            <span class="nav-link">안녕하세요, ${sessionScope.userName}님!</span>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item">
                                <a class="nav-link" href="login.jsp">로그인</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="signupform.jsp">회원가입</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">로그아웃</a>
                </li>
            </ul>
        </div>
    </nav>
</header>

<main>
    <div class="container">
        <section class="strays-info">
            <h2 class="float-right">게시글 목록</h2>
            <button class="btn btn-primary" onclick="location.href='dogwalking/form_new.jsp'">글쓰기</button>
            <div class="clearfix"></div>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="thead-dark">
                    <tr>
                        <th>번호</th>
                        <th>근무지</th>
                        <th>제목</th>
                        <th>근무 요일</th>
                        <th>근무 시간</th>
                        <th>급여</th>
                        <th>작성일</th>
                    </tr>
                    </thead>
                    <tbody>
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
                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("num") %></td>
                        <td><%= rs.getString("address") %></td>
                        <td><a href="dogwalking/dogwalking_board_read.jsp?num=<%= rs.getInt("num") %>"><%= rs.getString("title") %></a></td>
                        <td><%= rs.getString("day") %></td>
                        <td><%= rs.getString("time") %></td>
                        <td><%= rs.getInt("pay") %></td>
                        <td><%= rs.getTimestamp("today_date") %></td>
                    </tr>
                    <% 
                            }
                            // 페이징 처리
                            String countQuery = "SELECT COUNT(*) AS total FROM pet.dogwalker";
                            PreparedStatement countPs = connection.prepareStatement(countQuery);
                            ResultSet countRs = countPs.executeQuery();
                            countRs.next();
                            int totalRecords = countRs.getInt("total");
                            int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
                    %>
                    </tbody>
                </table>
            </div>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <% if(currentPage > 1) { %>
                    <li class="page-item">
                        <a class="page-link" href="walk-jobs.jsp?currentPage=<%= currentPage - 1 %>" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                    <% } %>
                    <% for(int i = 1; i <= totalPages; i++) { %>
                    <li class="page-item <%= i == currentPage ? "active" : "" %>">
                        <a class="page-link" href="walk-jobs.jsp?currentPage=<%= i %>"><%= i %></a>
                    </li>
                    <% } %>
                    <% if(currentPage < totalPages) { %>
                    <li class="page-item">
                        <a class="page-link" href="walk-jobs.jsp?currentPage=<%= currentPage + 1 %>" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                    <% } %>
                </ul>
            </nav>
            <%
                } catch (Exception e) {
                    out.println("오류가 발생했습니다. 오류 메시지: " + e.getMessage());
                }
            %>
        </section>
    </div>
</main>

<footer class="footer mt-auto py-3">
    <div class="container">
        <p>&copy; 2024 Pet. 모든 권리 보유.</p>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
