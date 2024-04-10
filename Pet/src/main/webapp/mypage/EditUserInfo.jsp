<%@page import="SignIn.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.HttpSession, Util.MyWebContextListener" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script>
    function openEditWindow(fieldName) {
        var editUrl = "/mypage/edit/" + fieldName + ".jsp";
        window.open(editUrl, "_blank", "width=600,height=400");
    }
    function openAddressSearchWindow() {
        var editUrl = "/mypage/edit/AddressSearch.jsp";
        window.open(editUrl, "_blank", "width=600,height=400");
    }
    </script>
    <style>
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            margin-top: 50px;
        }
        .input-field {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container form-container">
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
                String userName = userInfoRs.getString("user_name");
                String phone = userInfoRs.getString("phone");
                String address = userInfoRs.getString("address");
                String addressDetail = userInfoRs.getString("address_detail");
        %>
            <div class="form-group">
                <label for="id">아이디:</label>
                <input type="text" id="id" name="id" class="form-control input-field" value="<%= id %>" readonly>
            </div>
            <div class="form-group">
                <label for="password">비밀번호:</label>
                <div class="input-group">
                    <input type="password" id="password" name="password" class="form-control input-field" value="<%= password %>" readonly>
                    <div class="input-group-append">
                        <button type="button" class="btn btn-outline-primary" onclick="openEditWindow('password')">수정</button>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="userName">이름:</label>
                <input type="text" id="userName" name="userName" class="form-control input-field" value="<%= userName %>" readonly>
            </div>
            <div class="form-group">
                <label for="phone">핸드폰:</label>
                <input type="text" id="phone" name="phone" class="form-control input-field" value="<%= phone %>" readonly>
            </div>
            <div class="form-group">
                <label for="address">주소:</label>
                <div class="input-group">
                    <input type="text" id="address" name="address" class="form-control input-field" value="<%= address %>" readonly>
                    <div class="input-group-append">
                        <button type="button" class="btn btn-outline-primary" onclick="openAddressSearchWindow()">주소 수정</button>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="addressDetail">상세 주소:</label>
                <input type="text" id="addressDetail" name="addressDetail" class="form-control input-field" value="<%= addressDetail %>" readonly>
            </div>
            <div class="text-center">
                <a href="/mypage.jsp" class="btn btn-outline-secondary">마이페이지로 돌아가기</a>
            </div>
        <% 
            } else {
                out.println("회원 정보를 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            out.println("오류가 발생했습니다. 오류 메시지: " + e.getMessage());
        }
        %>
    </div>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
