<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카풀 메인</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
.rounded-border {
	width: 50vw;
	border-radius: 10px;
	border: 1px solid #ccc;
	cursor: pointer;
	margin: 0 auto;
}

.rounded-border:hover {
	border-color: #007bff;
}
</style>
</head>
<body>
<header>
    <%
        request.setAttribute("pageTitle", "반려견 카풀");
    %>
    <jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
</header>
<main>
    <div class="container">
        <button id="carpoolButton" style="margin-top: 200px;">카풀 모집</button>
        <h2>게시글 목록</h2>
        <c:forEach items="${posts}" var="post">
            <div class="rounded-border" onclick="window.location.href='/viewPost?id=${post.id}';"
                style="cursor: pointer; margin-bottom: 10px; padding: 10px;">
                <p>제목: ${post.title}</p>
                <p>작성자: ${post.userId}</p>
                <p>등록 시간: ${post.createdAt}</p>
            </div>
        </c:forEach>
    </div>
</main>
<footer>
    <div class="container">
        <p>&copy; 2024 Pet. 모든 권리 보유.</p>
    </div>
</footer>
<script>
        document.getElementById("carpoolButton").addEventListener("click", function() {
            window.location.href = 'carpool-map.jsp';
        });
</script>
</body>
</html>
