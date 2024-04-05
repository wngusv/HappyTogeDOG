<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Util.MyWebContextListener" %>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
            String query = "SELECT * FROM pet.dogwalker WHERE num = ?";
        try (Connection conn = MyWebContextListener.getConnection();
        		PreparedStatement pstmt = conn.prepareStatement(query);){
            
            
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
                String fileRealName1 = rs.getString("fileRealName1");
                String fileRoute1 = rs.getString("file_route1");
                String fileName2 = rs.getString("fileName2");
                String fileRoute2 = rs.getString("file_route2");
                String fileRealName2 = rs.getString("fileRealName2");
                String fileName3 = rs.getString("fileName3");
                String fileRoute3 = rs.getString("file_route3");
                String fileRealName3 = rs.getString("fileRealName3");
                String fileName4 = rs.getString("fileName4");
                String fileRoute4 = rs.getString("file_route4");
                String fileRealName4 = rs.getString("fileRealName4");
                String fileName5 = rs.getString("fileName5");
                String fileRoute5 = rs.getString("file_route5");
                String fileRealName5 = rs.getString("fileRealName5");
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
            <label for="dogSize">견종(크기):</label>
            <select class="form-control" id="dogSize" name="dogSize">
                <option value="소형견(7kg이하)" <%= size.equals("소형견(7kg이하)") ? "selected" : "" %>>소형견(7kg이하)</option>
                <option value="중형견(8kg이상)" <%= size.equals("중형견(8kg이상)") ? "selected" : "" %>>중형견(8kg이상)</option>
                <option value="대형견(16kg이상)" <%= size.equals("대형견(16kg이상)") ? "selected" : "" %>>대형견(16kg이상)</option>
                <option value="초대형견(45kg이상)" <%= size.equals("초대형견(45kg이상)") ? "selected" : "" %>>초대형견(45kg이상)</option>
            </select>
        </div>
        <div class="form-group">
            <label for="day">요일:</label>
            <select class="form-control" id="day" name="day">
                <option value="평일" <%= day.equals("평일") ? "selected" : "" %>>평일</option>
                <option value="주말" <%= day.equals("주말") ? "selected" : "" %>>주말</option>
            </select>
        </div>
        <div class="form-group">
            <label for="time">시간:</label>
            <select class="form-control" id="time" name="time">
                <option value="오전" <%= time.equals("오전") ? "selected" : "" %>>오전</option>
                <option value="오후" <%= time.equals("오후") ? "selected" : "" %>>오후</option>
            </select>
        </div>
        <div class="form-group">
            <label for="pickupLocation">픽업위치:</label><br>
            <button type="button" class="btn btn-primary mb-2" onclick="sample6_execDaumPostcode()">우편번호 찾기</button><br>
            <input type="text" class="form-control mb-2" id="sample6_address" placeholder="주소" value="<%= address %>" name="sample6_address" readonly>
            <input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소" value="<%= addressDetail %>" name="sample6_detailAddress">
        </div>
        <div class="form-group">
            <label for="pay">시급</label>
            <input type="text" class="form-control" id="pay" name="pay" value="<%= pay %>">
        </div>
        <div class="form-group">
            <label for="content">소개</label>
            <textarea class="form-control" id="content" name="content" rows="3"><%= content %></textarea>
<div class="form-group">
    <label for="file1">사진1</label>
    <input type="file" class="form-control-file" id="file1" name="file1" onchange="previewImage(this, 'preview1');">
    <div id="preview1" style="display: none;"></div>
    <% if (fileRoute1 != null && !fileRoute1.isEmpty()) { %>
        <img src="<%= fileRoute1 %>" class="img-thumbnail" alt="사진1">
    <% } %>
</div>
<div class="form-group">
    <label for="file2">사진2</label>
    <input type="file" class="form-control-file" id="file2" name="file2" onchange="previewImage(this, 'preview2');">
    <div id="preview2" style="display: none;"></div>
    <% if (fileRoute2 != null && !fileRoute2.isEmpty()) { %>
        <img src="<%= fileRoute2 %>" class="img-thumbnail" alt="사진2">
    <% } %>
</div>
<div class="form-group">
    <label for="file3">사진3</label>
    <input type="file" class="form-control-file" id="file3" name="file3" onchange="previewImage(this, 'preview3');">
    <div id="preview3" style="display: none;"></div>
    <% if (fileRoute3 != null && !fileRoute3.isEmpty()) { %>
        <img src="<%= fileRoute3 %>" class="img-thumbnail" alt="사진3">
    <% } %>
</div>
<div class="form-group">
    <label for="file4">사진4</label>
    <input type="file" class="form-control-file" id="file4" name="file4" onchange="previewImage(this, 'preview4');">
    <div id="preview4" style="display: none;"></div>
    <% if (fileRoute4 != null && !fileRoute4.isEmpty()) { %>
        <img src="<%= fileRoute4 %>" class="img-thumbnail" alt="사진4">
    <% } %>
</div>
<div class="form-group">
    <label for="file5">사진5</label>
    <input type="file" class="form-control-file" id="file5" name="file5" onchange="previewImage(this, 'preview5');">
    <div id="preview5" style="display: none;"></div>
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
    
    // 수정 폼에서 데이터 업데이트 처리
    if(request.getMethod().equalsIgnoreCase("POST")) {
        //String postId = request.getParameter("postId");
        String title = request.getParameter("title");
        String size = request.getParameter("dogSize");
        String day = request.getParameter("day");
        String time = request.getParameter("time");
        String address = request.getParameter("sample6_address");
        String address_detail = request.getParameter("sample6_detailAddress");
        String payStr = request.getParameter("pay");
        int pay = 0;
        if (payStr != null && !payStr.isEmpty()) {
            pay = Integer.parseInt(payStr);
        }
        String content = request.getParameter("content");
        
        // 파일 업로드 처리
        String uploadDir = application.getRealPath("/uploads");
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs(); // 디렉토리가 존재하지 않으면 생성
        }

        int maxSize = 100 * 1024 * 1024; // 최대 업로드 파일 크기
        MultipartRequest multipartRequest = new MultipartRequest(request, uploadDir, maxSize, "UTF-8", new DefaultFileRenamePolicy());
        String fileName1 = multipartRequest.getOriginalFileName("file1");
        String fileName2 = multipartRequest.getOriginalFileName("file2");
        String fileName3 = multipartRequest.getOriginalFileName("file3");
        String fileName4 = multipartRequest.getOriginalFileName("file4");
        String fileName5 = multipartRequest.getOriginalFileName("file5");
        
        String fileRealName1 = multipartRequest.getFilesystemName("dogPhoto1");
        String fileRealName2 = multipartRequest.getFilesystemName("dogPhoto2");
        String fileRealName3 = multipartRequest.getFilesystemName("dogPhoto3");
        String fileRealName4 = multipartRequest.getFilesystemName("dogPhoto4");
        String fileRealName5 = multipartRequest.getFilesystemName("dogPhoto5");
        
        String fileRoute1 = "/uploads/" + fileName1;
        String fileRoute2 = "/uploads/" + fileName2;
        String fileRoute3 = "/uploads/" + fileName3;
        String fileRoute4 = "/uploads/" + fileName4;
        String fileRoute5 = "/uploads/" + fileName5;

            String query = "UPDATE pet.dogwalker SET title=?, size=?, day=?, time=?, address=?, address_detail=?, pay=?, content=?, fileName1=?, fileRealName1=?, file_route1=?, fileName2=?, fileRealName2=?, file_route2=?, fileName3=?, fileRealName3=?, file_route3=?, fileName4=?, fileRealName4=?, file_route4=?, fileName5=?, fileRealName5=?, file_route5=? WHERE num=?";
        try (Connection conn = MyWebContextListener.getConnection();
        		PreparedStatement pstmt = conn.prepareStatement(query);){
            pstmt.setString(1, title);
            pstmt.setString(2, size);
            pstmt.setString(3, day);
            pstmt.setString(4, time);
            pstmt.setString(5, address);
            pstmt.setString(6, address_detail);
            pstmt.setInt(7, pay);
            pstmt.setString(8, content);
            pstmt.setString(9, fileName1);
            pstmt.setString(10, fileRealName1);
            pstmt.setString(11, fileRoute1);
            pstmt.setString(12, fileName2);
            pstmt.setString(13, fileRealName2);
            pstmt.setString(14, fileRoute2);
            pstmt.setString(15, fileName3);
            pstmt.setString(16, fileRealName3);
            pstmt.setString(17, fileRoute3);
            pstmt.setString(18, fileName4);
            pstmt.setString(19, fileRealName4);
            pstmt.setString(20, fileRoute4);
            pstmt.setString(21, fileName5);
            pstmt.setString(22, fileRealName5);
            pstmt.setString(23, fileRoute5);
            pstmt.setInt(24, Integer.parseInt(postId));
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            response.sendRedirect("success.jsp");
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
%>

<script>
function previewImage(input, previewId) {
    var preview = document.getElementById(previewId);
    while (preview.firstChild) {
        preview.removeChild(preview.firstChild);
    }
    
    Array.from(input.files).forEach(function(file) {
        if (file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                var img = document.createElement('img');
                img.src = e.target.result;
                img.style.maxWidth = '200px';
                img.style.maxHeight = '200px';
                img.style.marginRight = '10px';
                preview.appendChild(img);
            }
            reader.readAsDataURL(file);
        }
    });
    preview.style.display = 'block';
}
</script>

</body>
</html>
