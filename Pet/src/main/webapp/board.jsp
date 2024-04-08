<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Util.MyWebContextListener"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/floating-banner.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<style>
    .social-links {
        list-style: none;
        padding: 0;
        margin: 0;
        display: flex;
        justify-content: flex-end;
        align-items: center;
    }
    .social-links li {
        margin-left: 10px;
    }
</style>
<body style="padding-top: 150px;">
    <header>
        <%
            request.setAttribute("pageTitle", "게시판");
        %>
        <jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
    </header>

    <main>
        <div class="container">
            <section class="strays-info">
                <h2>본인동네 자유게시판(ex.부산진구 자유게시판)</h2>

                <!-- 검색 폼 -->
                <form action="board.jsp" method="get">
                    <input type="text" name="find" value="<%=request.getParameter("find") != null ? request.getParameter("find") : ""%>">
                    <input type="submit" value="검색">
                </form>

                <input type="button" value="글쓰기" onclick="location.href='boardWrite.jsp';">
                <button type="button" onclick="sortByNewest()">최신순</button>
                <button type="button" onclick="sortByRecommendation()">추천순</button>

                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th width=100>
                                <!-- 카테고리 선택 폼 -->
                                <form action="board.jsp" method="get">
                                    <select name="categoryFilter" onchange="this.form.submit()">
                                        <option value="">전체</option>
                                        <option value="소통">소통</option>
                                        <option value="긴급">긴급</option>
                                        <option value="후기">후기</option>
                                    </select>
                                </form>
                            </th>
                            <th>제목</th>
                            <th>아이디</th>
                            <th>작성시간</th>
                            <th>추천순</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 데이터 로드 및 출력 -->
                        <%
                            String categoryFilter = request.getParameter("categoryFilter");
                            String find = request.getParameter("find");
                            int pagee = 1;
                            int pageeSize = 10;
                            if (request.getParameter("pagee") != null) {
                                pagee = Integer.parseInt(request.getParameter("pagee"));
                            }

                            String sql = "SELECT b.idx, b.category, b.title, b.id, b.postdate, "
                                       + "COUNT(DISTINCT c.id) AS 추천수 "
                                       + "FROM board b "
                                       + "LEFT JOIN comment c ON b.idx = c.post_idx AND c.type = '추천' ";

                            if (find != null && !find.isEmpty()) {
                                sql += "WHERE REPLACE(b.title, ' ', '') LIKE ? ";
                            } else if (categoryFilter != null && !categoryFilter.isEmpty()) {
                                sql += "WHERE b.category = ? ";
                            }

                            String sort = request.getParameter("sort");
                            String orderBy = "b.postdate DESC";
                            if ("recommendation".equals(sort)) {
                                orderBy = "추천수 DESC, b.postdate DESC";
                            } else if ("newest".equals(sort)) {
                                orderBy = "b.postdate DESC";
                            }

                            sql += "GROUP BY b.idx ORDER BY " + orderBy + " LIMIT ?, ?";
                            try (Connection conn = MyWebContextListener.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
                                int paramIndex = 1;
                                if (find != null && !find.isEmpty()) {
                                    stmt.setString(paramIndex++, "%" + find.replace(" ", "") + "%");
                                } else if (categoryFilter != null && !categoryFilter.isEmpty()) {
                                    stmt.setString(paramIndex++, categoryFilter);
                                }
                                stmt.setInt(paramIndex++, (pagee - 1) * pageeSize);
                                stmt.setInt(paramIndex, pageeSize);

                                try (ResultSet rs = stmt.executeQuery();) {
                                    while (rs.next()) {
                                        %>
                                        <tr>
                                            <td><%=rs.getString("category")%></td>
                                            <td><a href="boardReading.jsp?idx=<%=rs.getInt("idx")%>"><%=rs.getString("title")%></a></td>
                                            <td><%=rs.getString("id")%></td>
                                            <td><%=rs.getTimestamp("postdate").toString()%></td>
                                            <td><%=rs.getInt("추천수")%></td>
                                        </tr>
                                        <%
                                    }
                                }
                            } catch (Exception ex) {
                                out.println("오류가 발생했습니다: " + ex.getMessage());
                            }
                        %>
                    </tbody>
                </table>

                <!-- 페이징 -->
                <%
                    String countSql = "SELECT COUNT(*) FROM board";
                    if (find != null && !find.isEmpty()) {
                        countSql += " WHERE REPLACE(title, ' ', '') LIKE ?";
                    } else if (categoryFilter != null && !categoryFilter.isEmpty()) {
                        countSql += " WHERE category = ?";
                    }

                    try (Connection conn = MyWebContextListener.getConnection(); PreparedStatement stmt = conn.prepareStatement(countSql)) {
                        if (find != null && !find.isEmpty()) {
                            stmt.setString(1, "%" + find.replace(" ", "") + "%");
                        } else if (categoryFilter != null && !categoryFilter.isEmpty()) {
                            stmt.setString(1, categoryFilter);
                        }

                        try (ResultSet rs = stmt.executeQuery();) {
                            if (rs.next()) {
                                int totalPosts = rs.getInt(1);
                                int totalPages = (int) Math.ceil((double) totalPosts / pageeSize);
                                %>
                                <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-center">
                                        <%
                                        for (int i = 1; i <= totalPages; i++) {
                                            String link = "board.jsp?pagee=" + i;
                                            if (find != null && !find.isEmpty()) {
                                                link += "&find=" + URLEncoder.encode(find, "UTF-8");
                                            }
                                            if (categoryFilter != null && !categoryFilter.isEmpty()) {
                                                link += "&categoryFilter=" + URLEncoder.encode(categoryFilter, "UTF-8");
                                            }
                                            %>
                                            <li class="page-item <%=pagee == i ? "active" : ""%>">
                                                <a class="page-link" href="<%=link%>"><%=i%></a>
                                            </li>
                                            <%
                                        }
                                        %>
                                    </ul>
                                </nav>
                                <%
                            }
                        }
                    } catch (Exception ex) {
                        out.println("오류가 발생했습니다: " + ex.getMessage());
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
<script>
    window.onload = function() {
        var categorySelect = document.getElementsByName("categoryFilter")[0];
        var selectedCategory = "<%=categoryFilter%>";
        if (selectedCategory) {
            for (var i = 0; i < categorySelect.options.length; i++) {
                if (categorySelect.options[i].value === selectedCategory) {
                    categorySelect.selectedIndex = i;
                    break;
                }
            }
        }
    };

    function sortByRecommendation() {
        var currentUrl = window.location.href;
        var newUrl = new URL(currentUrl);
        newUrl.searchParams.set('sort', 'recommendation');
        console.log("Sort by recommendation:", newUrl.href);
        window.location.href = newUrl.href;
    }

    function sortByNewest() {
        var currentUrl = window.location.href;
        var newUrl = new URL(currentUrl);
        newUrl.searchParams.set('sort', 'newest');
        console.log("Sort by newest:", newUrl.href);
        window.location.href = newUrl.href;
    }
</script>
</html>
