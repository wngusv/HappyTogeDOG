<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.nio.file.*, java.nio.file.attribute.*, java.sql.*, javax.servlet.annotation.MultipartConfig, javax.servlet.http.*, Util.MyWebContextListener" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
    String postId = request.getParameter("postId");
    if(postId != null && !postId.isEmpty()) {
        try {
            Connection conn = MyWebContextListener.getConnection();
            String query = "SELECT * FROM dogwalker WHERE num = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(postId));
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next()) {
                // 기존 게시물 정보 가져오기
                String title = rs.getString("title");
                String size = rs.getString("size");
                String day = rs.getString("day");
                String time = rs.getString("time");
                String address = rs.getString("address");
                String addressDetail = rs.getString("address_detail");
                double pay = rs.getDouble("pay");
                String content = rs.getString("content");
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
                // 수정 폼 표시
%>
<div class="container">
    <h2>게시글 수정</h2>
    <form action="UpdatePost.jsp" method="post" enctype="multipart/form-data">
        <input type="hidden" name="postId" value="<%= postId %>">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" value="<%= title %>">
        </div>
        <div class="form-group">
            <label for="size">크기</label>
            <input type="text" class="form-control" id="size" name="size" value="<%= size %>">
        </div>
        <div class="form-group">
            <label for="day">요일</label>
            <input type="text" class="form-control" id="day" name="day" value="<%= day %>">
        </div>
        <div class="form-group">
            <label for="time">시간</label>
            <input type="text" class="form-control" id="time" name="time" value="<%= time %>">
        </div>
        <div class="form-group">
            <label for="address">주소</label>
            <input type="text" class="form-control" id="address" name="address" value="<%= address %> <%= addressDetail %>">
        </div>
        <div class="form-group">
            <label for="pay">시급</label>
            <input type="text" class="form-control" id="pay" name="pay" value="<%= pay %>">
        </div>
        <div class="form-group">
            <label for="content">소개</label>
            <textarea class="form-control" id="content" name="content" rows="3"><%= content %></textarea>
        </div>
        <div class="form-group">
            <label for="file1">사진1</label>
            <input type="file" class="form-control-file" id="file1" name="file1">
            <% if (fileRoute1 != null && !fileRoute1.isEmpty()) { %>
                <img src="<%= fileRoute1 %>" class="img-thumbnail" alt="사진1">
            <% } %>
        </div>
        <div class="form-group">
            <label for="file2">사진2</label>
            <input type="file" class="form-control-file" id="file2" name="file2">
            <% if (fileRoute2 != null && !fileRoute2.isEmpty()) { %>
                <img src="<%= fileRoute2 %>" class="img-thumbnail" alt="사진2">
            <% } %>
        </div>
        <div class="form-group">
            <label for="file3">사진3</label>
            <input type="file" class="form-control-file" id="file3" name="file3">
            <% if (fileRoute3 != null && !fileRoute3.isEmpty()) { %>
                <img src="<%= fileRoute3 %>" class="img-thumbnail" alt="사진3">
            <% } %>
        </div>
        <div class="form-group">
            <label for="file4">사진4</label>
            <input type="file" class="form-control-file" id="file4" name="file4">
            <% if (fileRoute4 != null && !fileRoute4.isEmpty()) { %>
                <img src="<%= fileRoute4 %>" class="img-thumbnail" alt="사진4">
            <% } %>
        </div>
        <div class="form-group">
            <label for="file5">사진5</label>
            <input type="file" class="form-control-file" id="file5" name="file5">
            <% if (fileRoute5 != null && !fileRoute5.isEmpty()) { %>
                <img src="<%= fileRoute5 %>" class="img-thumbnail" alt="사진5">
            <% } %>
        </div>
        <button type="submit" class="btn btn-primary">수정</button>
    </form>
</div>

<%
            } else {
%>
<div class="alert alert-danger" role="alert">
    게시물을 찾을 수 없습니다.
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
</body>
</html>
