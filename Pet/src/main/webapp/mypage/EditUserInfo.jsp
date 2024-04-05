<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.HttpSession, Util.MyWebContextListener" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>회원 정보 수정</h1>
    <% 
    try (Connection connection = MyWebContextListener.getConnection();) {
        String userId = (String) session.getAttribute("userId");
        String type = request.getParameter("type"); // 수정할 정보 종류 받기

        if (type != null && !type.isEmpty()) {
            Statement stmt = connection.createStatement();
            String userInfoQuery = "SELECT * FROM pet.user WHERE id = '" + userId + "'";
            ResultSet userInfoRs = stmt.executeQuery(userInfoQuery);

            if (userInfoRs.next()) {
                String id = userInfoRs.getString("id");
                String password = userInfoRs.getString("pw");
                String userName = userInfoRs.getString("user_name");
                String address = userInfoRs.getString("address");
                String addressDetail = userInfoRs.getString("address_detail");
    %>
    <form action="UpdateUserInfo.jsp" method="post">
        <% if (type.equals("password")) { %>
            <div>
                <label for="password">새로운 패스워드:</label>
                <input type="password" id="password" name="password">
            </div>
        <% } else if (type.equals("username")) { %>
            <div>
                <label for="username">새로운 이름:</label>
                <input type="text" id="username" name="username" value="<%= userName %>">
            </div>
        <% } else if (type.equals("address")) { %>
            <div>
                <label for="address">새로운 주소:</label>
                <input type="text" id="address" name="address" value="<%= address %>">
            </div>
            <div>
                <label for="addressDetail">상세 주소:</label>
                <input type="text" id="addressDetail" name="addressDetail" value="<%= addressDetail %>">
            </div>
        <% } %>
        <input type="hidden" name="type" value="<%= type %>">
        <button type="submit">저장</button>
    </form>
    <a href="/mypage.jsp">취소</a>
    <% 
            }
            userInfoRs.close();
            stmt.close();
        }
    } catch (Exception e) {
        out.println("오류가 발생했습니다. 오류 메시지: " + e.getMessage());
    }
    %>
</body>
</html>
