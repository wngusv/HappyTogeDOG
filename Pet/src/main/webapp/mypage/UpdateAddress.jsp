<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.HttpSession, Util.MyWebContextListener"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주소 업데이트</title>
</head>
<body>
    <%
        // Retrieve address details from the request
        String address = request.getParameter("address");
        String detailAddress = request.getParameter("detailAddress");

        try (Connection connection = MyWebContextListener.getConnection();) {
            String userId = (String) session.getAttribute("userId");
            // Update address in the database
            String updateQuery = "UPDATE pet.user SET address=?, address_detail=? WHERE id=?";
            try (PreparedStatement pstmt = connection.prepareStatement(updateQuery)) {
                pstmt.setString(1, address);
                pstmt.setString(2, detailAddress);
                pstmt.setString(3, userId);
                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
    %>
    <h2>주소가 업데이트 되었습니다.</h2>
    <%
                } else {
    %>
    <h2>주소 업데이트에 실패했습니다.</h2>
    <%
                }
            }
        } catch (Exception e) {
    %>
    <h2>오류가 발생했습니다. 오류 메시지: <%= e.getMessage() %></h2>
    <%
        }
    %>
</body>
</html>
