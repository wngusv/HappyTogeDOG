<%@page import="java.sql.*, javax.servlet.http.HttpSession, Util.MyWebContextListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
</head>
<body>
    <h1>회원 정보 수정</h1>
    <%
        try (Connection connection = MyWebContextListener.getConnection();) {
            String userId = (String) session.getAttribute("userId");
            Statement stmt = connection.createStatement();
            // 회원 정보 가져오기
            String userInfoQuery = "SELECT * FROM pet.user WHERE id = '" + userId + "'";
            ResultSet userInfoRs = stmt.executeQuery(userInfoQuery);
            if (userInfoRs.next()) {
                String id = userInfoRs.getString("id");
                String password = userInfoRs.getString("pw");
    %>
    <form action="/mypage/UpdatePassword.jsp" method="post">
        <div>
            <label for="currentPassword">현재 비밀번호:</label>
            <input type="password" id="currentPassword" name="currentPassword" required>
        </div>
        <div>
            <label for="newPassword">새로운 비밀번호:</label>
            <input type="password" id="newPassword" name="newPassword" required>
        </div>
        <div>
            <label for="confirmPassword">새로운 비밀번호 확인:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
        </div>
        <button type="submit">비밀번호 변경</button>
    </form>
    <%
            } else {
                // 회원 정보가 없는 경우
                out.println("회원 정보를 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            out.println("오류가 발생했습니다. 오류 메시지: " + e.getMessage());
        }
    %>
</body>
</html>