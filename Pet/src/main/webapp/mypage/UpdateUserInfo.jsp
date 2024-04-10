<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.HttpSession, Util.MyWebContextListener" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 업데이트 결과</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>회원 정보 업데이트 결과</h1>
    <% 
    try (Connection connection = MyWebContextListener.getConnection();) {
        String userId = (String) session.getAttribute("userId");
        String type = request.getParameter("type"); // 수정할 정보 종류 받기

        // 사용자가 입력한 값을 가져오기
        String newValue = request.getParameter(type);

        // 쿼리문 작성
        String updateQuery = "";
        if (type.equals("password")) {
            updateQuery = "UPDATE pet.user SET pw = ? WHERE id = ?";
        } else if (type.equals("userName")) {
            updateQuery = "UPDATE pet.user SET user_name = ? WHERE id = ?";
        } else if (type.equals("phone")) {
            updateQuery = "UPDATE pet.user SET phone = ? WHERE id = ?";
        } else if (type.equals("address")) {
            updateQuery = "UPDATE pet.user SET address = ?, address_detail = ? WHERE id = ?";
        } 

        // PreparedStatement를 사용하여 쿼리 실행
        PreparedStatement pstmt = connection.prepareStatement(updateQuery);
        if (type.equals("address")) {
            pstmt.setString(1, newValue);
            pstmt.setString(2, request.getParameter("addressDetail"));
            pstmt.setString(3, userId);
        } else {
            pstmt.setString(1, newValue);
            pstmt.setString(2, userId);
        }

        // 쿼리 실행
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
    %>
        <p>회원 정보가 성공적으로 업데이트되었습니다.</p>
    <% } else { %>
        <p>회원 정보 업데이트에 실패했습니다.</p>
    <% }
        pstmt.close();
    } catch (Exception e) {
        out.println("오류가 발생했습니다. 오류 메시지: " + e.getMessage());
    }
    %>
    <a href="/mypage.jsp">마이페이지로 돌아가기</a>
</body>
</html>
