<%@page import="java.sql.*, javax.servlet.http.HttpSession, Util.MyWebContextListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경 결과</title>
</head>
<body>
    <%
        try (Connection connection = MyWebContextListener.getConnection();) {
            String userId = (String) session.getAttribute("userId");
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            // Validate if newPassword and confirmPassword match
            if (!newPassword.equals(confirmPassword)) {
    %>
    <h3>새로운 비밀번호와 확인 비밀번호가 일치하지 않습니다.</h3>
    <p><a href="/mypage/ChangePassword.jsp">비밀번호 변경 페이지로 돌아가기</a></p>
    <%
                return;
            }

            // Check if the current password matches the one in the database
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM pet.user WHERE id = ? AND pw = ?");
            ps.setString(1, userId);
            ps.setString(2, currentPassword);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Update the password in the database
                PreparedStatement updatePs = connection.prepareStatement("UPDATE pet.user SET pw = ? WHERE id = ?");
                updatePs.setString(1, newPassword);
                updatePs.setString(2, userId);
                int updatedRows = updatePs.executeUpdate();
                if (updatedRows > 0) {
    %>
    <h3>비밀번호가 성공적으로 변경되었습니다.</h3>
    <p><a href="/mypage.jsp">마이페이지로 돌아가기</a></p>
    <%
                } else {
    %>
    <h3>비밀번호 변경에 실패했습니다. 다시 시도해 주세요.</h3>
    <p><a href="/mypage/edit/password.jsp">비밀번호 변경 페이지로 돌아가기</a></p>
    <%
                }
            } else {
    %>
    <h3>현재 비밀번호가 올바르지 않습니다.</h3>
    <p><a href="/mypage/edit/password.jsp">비밀번호 변경 페이지로 돌아가기</a></p>
    <%
            }
        } catch (Exception e) {
            out.println("오류가 발생했습니다. 오류 메시지: " + e.getMessage());
        }
    %>
</body>
</html>
