<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Util.MyWebContextListener" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
        }
        .card {
            margin-bottom: 20px;
        }
        .card img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
<%
    String postId = request.getParameter("postId");
    if(postId != null && !postId.isEmpty()) {
    	String query = "SELECT * FROM dogwalker WHERE num = ?";
    	try (Connection conn = MyWebContextListener.getConnection();
        		PreparedStatement pstmt = conn.prepareStatement(query);){
            pstmt.setInt(1, Integer.parseInt(postId));
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                String title = rs.getString("title");
                String size = rs.getString("size");
                String day = rs.getString("day");
                String time = rs.getString("time");
                String address = rs.getString("address");
                String addressDetail = rs.getString("address_detail");
                double pay = rs.getDouble("pay");
                String content = rs.getString("content");
                Timestamp todayDate = rs.getTimestamp("today_date");
                String fileName1 = rs.getString("fileName1");
                String fileRoute1 = rs.getString("file_route1");
                String fileName2 = rs.getString("fileName2");
                String fileRoute2 = rs.getString("file_route2");
                String fileName3 = rs.getString("fileName3");
                String fileRoute3 = rs.getString("file_route3");
                String fileName4 = rs.getString("fileName4");
                String fileRoute4 = rs.getString("file_route4");
                String fileName5 = rs.getString("fileName5");
                String fileRoute5 = rs.getString("file_route5");
%>
<div class="card">
    <div class="card-body">
        <table class="table">
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    <td><%= title %></td>
                </tr>
                <tr>
                    <th scope="row">작성 날짜</th>
                    <td><%= todayDate %></td>
                </tr>
                <tr>
                    <th scope="row">크기</th>
                    <td><%= size %></td>
                </tr>
                <tr>
                    <th scope="row">요일</th>
                    <td><%= day %></td>
                </tr>
                <tr>
                    <th scope="row">시간</th>
                    <td><%= time %></td>
                </tr>
                <tr>
                    <th scope="row">주소</th>
                    <td><%= address %> <%= addressDetail %></td>
                </tr>
                <tr>
                    <th scope="row">시급</th>
                    <td><%= pay %> 원</td>
                </tr>
                <tr>
                    <th scope="row">소개</th>
                    <td><%= content %></td>
                </tr>
            </tbody>
        </table>
        <div class="row">
            <div class="col-md-2">
                <img src="<%= fileRoute1 %>" class="img-fluid" alt="Dog Photo1">
            </div>
            <div class="col-md-2">
                <img src="<%= fileRoute2 %>" class="img-fluid" alt="Dog Photo2">
            </div>
            <div class="col-md-2">
                <img src="<%= fileRoute3 %>" class="img-fluid" alt="Dog Photo3">
            </div>
            <div class="col-md-2">
                <img src="<%= fileRoute4 %>" class="img-fluid" alt="Dog Photo4">
            </div>
            <div class="col-md-2">
                <img src="<%= fileRoute5 %>" class="img-fluid" alt="Dog Photo5">
            </div>
        </div>
        <div>
            <a href="/mypage/EditPost.jsp?postId=<%= postId %>" class="btn btn-primary">수정</a>
            <a href="#" onclick="confirmDelete('<%= postId %>')" class="btn btn-danger">삭제</a>


<script>
    function confirmDelete(postId) {
        var confirmResult = confirm("정말로 삭제하시겠습니까?");
        if (confirmResult) {
            window.location.href = "/mypage/DeletePost.jsp?postId=" + postId;
        }
    }
</script>
        </div>
    </div>
</div>

<%
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
%>
<a href="/walk-jobs.jsp" class="btn btn-primary">목록으로 돌아가기</a>
</body>
</html>
