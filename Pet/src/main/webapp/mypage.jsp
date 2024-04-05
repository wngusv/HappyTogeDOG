<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.HttpSession, Util.MyWebContextListener" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>마이페이지</h1>
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
            String address = userInfoRs.getString("address");
            String addressDetail = userInfoRs.getString("address_detail");
    %>
    <div>
        <h2>회원 정보</h2>
        <p><strong>아이디:</strong> <%= id %></p>
<p><strong>패스워드:</strong> <%= password %></p>
        <p><strong>이름:</strong> <%= userName %></p>
        <p><strong>주소:</strong> <%= address %> <%= addressDetail %></p>
        <a href="/mypage/EditUserInfo.jsp?type=address">회원정보수정</a>
    </div>
    <div>
        <h2>내가 쓴 글 보기</h2>
        <table border="1">
            <tr>
                <th>제목</th>
                <th>작성 날짜</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
            <% 
            // 사용자가 작성한 글 가져오기
            String userPostsQuery = "SELECT * FROM dogwalker WHERE id = '" + userId + "' ORDER BY today_date DESC";
            ResultSet userPostsRs = stmt.executeQuery(userPostsQuery);
            while (userPostsRs.next()) {
                int postId = userPostsRs.getInt("num");
                String title = userPostsRs.getString("title");
                String todayDate = userPostsRs.getString("today_date");
            %>
            <tr>
                <td><a href="/mypage/ViewPost.jsp?postId=<%= postId %>"><%= title %></a></td>
                <td><%= todayDate %></td>
                <td><a href="/mypage/EditPost.jsp?postId=<%= postId %>">수정</a></td>
                <td><a href="#" onclick="confirmDelete('<%= postId %>')">삭제</a></td>

<script>
    function confirmDelete(postId) {
        var confirmResult = confirm("정말로 삭제하시겠습니까?");
        if (confirmResult) {
            window.location.href = "/mypage/DeletePost.jsp?postId=" + postId;
        }
    }
</script>
            </tr>
            <% 
            }
            userPostsRs.close();
            %>
        </table>
    </div>
    <div>
        <h2>내 채팅방 보기</h2>
    </div>
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
