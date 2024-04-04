<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>카풀 메인</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <header>
        <% request.setAttribute("pageTitle", "반려견 카풀"); %>
        <jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
    </header>
    <main>
        <div class="container">
            <button onclick="openPopup()">카풀 모집</button>
            <h2>게시글 목록</h2>
            <table>
                <tr>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록 시간</th>
                </tr>
                <c:forEach items="${posts}" var="post">
                    <tr>
                        <td><a href="postDetails.jsp?id=${post.id}">${post.title}</a></td>
                        <td>${post.userId}</td>
                        <td><fmt:formatDate value="${post.createdAt}" pattern="yyyy-MM-dd HH:mm"/></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </main>
    <footer>
        <div class="container">
            <p>&copy; 2024 Pet. 모든 권리 보유.</p>
        </div>
    </footer>
    <script>
        function openPopup() {
            var popupOptions = "width=600,height=400,top=100,left=100";
            var jspUrl = "carpool-map.jsp";
            window.open(jspUrl, "_blank", popupOptions);
        }
    </script>
</body>
</html>
