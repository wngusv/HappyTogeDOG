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
        Statement stmt = connection.createStatement();
        // 회원 정보 가져오기
        String userInfoQuery = "SELECT * FROM pet.user WHERE id = '" + userId + "'";
        ResultSet userInfoRs = stmt.executeQuery(userInfoQuery);
        if (userInfoRs.next()) {
            String id = userInfoRs.getString("id");
            String password = userInfoRs.getString("pw");
            String userName = userInfoRs.getString("user_name");
            String phone = userInfoRs.getString("phone");
            String address = userInfoRs.getString("address");
            String addressDetail = userInfoRs.getString("address_detail");
    %>
    <form action="/mypage/UpdateUserInfo.jsp" method="post">
        <div>
            <label for="id">아이디:</label>
            <input type="text" id="id" name="id" value="<%= id %>" readonly>
        </div>
        <div>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" value="<%= password %>">
        </div>
        <div>
            <label for="userName">이름:</label>
            <input type="text" id="userName" name="userName" value="<%= userName %>">
        </div>
        <div>
            <label for="phone">핸드폰:</label>
            <input type="text" id="phone" name="phone" value="<%= phone %>">
        </div>
        <div>
            <label for="address">주소:</label>
            <input type="text" id="address" name="address" value="<%= address %>">
        </div>
        <div>
            <label for="addressDetail">상세 주소:</label>
            <input type="text" id="addressDetail" name="addressDetail" value="<%= addressDetail %>">
        </div>
        <button type="submit">저장</button>
    </form>
    <a href="/mypage.jsp">취소</a>
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
