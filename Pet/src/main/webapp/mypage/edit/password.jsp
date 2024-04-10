<%@page import="java.sql.*, javax.servlet.http.HttpSession, Util.MyWebContextListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <!-- 부트스트랩 CSS 링크 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">회원 정보 수정</h1>
        <%
            try (Connection connection = MyWebContextListener.getConnection();) {
                String userId = (String) session.getAttribute("userId");
                Statement stmt = connection.createStatement();
                String userInfoQuery = "SELECT * FROM pet.user WHERE id = '" + userId + "'";
                ResultSet userInfoRs = stmt.executeQuery(userInfoQuery);
                if (userInfoRs.next()) {
                    String id = userInfoRs.getString("id");
                    String password = userInfoRs.getString("pw");
        %>
        <form action="/mypage/UpdatePassword.jsp" method="post">
            <div class="form-group">
                <label for="currentPassword">현재 비밀번호:</label>
                <input type="password" id="currentPassword" name="currentPassword" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="newPassword">새로운 비밀번호:</label>
                <input type="password" id="newPassword" name="newPassword" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">새로운 비밀번호 확인:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">비밀번호 변경</button>
        </form>
        <%
                } else {
                    out.println("회원 정보를 찾을 수 없습니다.");
                }
            } catch (Exception e) {
                out.println("오류가 발생했습니다. 오류 메시지: " + e.getMessage());
            }
        %>
    </div>
    <!-- 부트스트랩 JS 링크 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
