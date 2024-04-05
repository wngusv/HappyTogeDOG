<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.nio.file.*, java.nio.file.attribute.*, java.sql.*, javax.servlet.annotation.MultipartConfig, javax.servlet.http.*, Util.MyWebContextListener" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정 결과</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
    String postId = request.getParameter("postId");
    String title = request.getParameter("title");
    String size = request.getParameter("size");
    String day = request.getParameter("day");
    String time = request.getParameter("time");
    String address = request.getParameter("address");
    String pay = request.getParameter("pay");
    String content = request.getParameter("content");
    // 업로드한 파일 처리
    String fileName1 = "", fileRealName1 = "", fileRoute1 = "";
    String fileName2 = "", fileRealName2 = "", fileRoute2 = "";
    String fileName3 = "", fileRealName3 = "", fileRoute3 = "";
    String fileName4 = "", fileRealName4 = "", fileRoute4 = "";
    String fileName5 = "", fileRealName5 = "", fileRoute5 = "";

    Part filePart1 = request.getPart("dogPhoto1");
    Part filePart2 = request.getPart("dogPhoto2");
    Part filePart3 = request.getPart("dogPhoto3");
    Part filePart4 = request.getPart("dogPhoto4");
    Part filePart5 = request.getPart("dogPhoto5");

    if (filePart1 != null && filePart1.getSize() > 0) {
        fileName1 = Paths.get(filePart1.getSubmittedFileName()).getFileName().toString();
        fileRealName1 = fileName1;
        fileRoute1 = "/uploads/" + fileName1;
        File uploads1 = new File(request.getServletContext().getRealPath("/uploads"));
        uploads1.mkdirs();
        try (InputStream input = filePart1.getInputStream()) {
            Files.copy(input, Paths.get(uploads1.getPath(), fileName1), StandardCopyOption.REPLACE_EXISTING);
        }
    }
    // 파일 2부터 5까지의 처리도 동일하게 수행

    String query = "UPDATE dogwalker SET title=?, size=?, day=?, time=?, address=?, pay=?, content=?, fileName1=?, fileRealName1=?, fileRoute1=?, fileName2=?, fileRealName2=?, fileRoute2=?, fileName3=?, fileRealName3=?, fileRoute3=?, fileName4=?, fileRealName4=?, fileRoute4=?, fileName5=?, fileRealName5=?, fileRoute5=? WHERE num=?";
    try (Connection conn = MyWebContextListener.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(query);){
        pstmt.setString(1, title);
        pstmt.setString(2, size);
        pstmt.setString(3, day);
        pstmt.setString(4, time);
        pstmt.setString(5, address);
        pstmt.setString(6, pay);
        pstmt.setString(7, content);
        pstmt.setString(8, fileName1);
        pstmt.setString(9, fileRealName1);
        pstmt.setString(10, fileRoute1);
        pstmt.setString(11, fileName2);
        pstmt.setString(12, fileRealName2);
        pstmt.setString(13, fileRoute2);
        pstmt.setString(14, fileName3);
        pstmt.setString(15, fileRealName3);
        pstmt.setString(16, fileRoute3);
        pstmt.setString(17, fileName4);
        pstmt.setString(18, fileRealName4);
        pstmt.setString(19, fileRoute4);
        pstmt.setString(20, fileName5);
        pstmt.setString(21, fileRealName5);
        pstmt.setString(22, fileRoute5);
        pstmt.setInt(23, Integer.parseInt(postId));
        int updatedRows = pstmt.executeUpdate();
        pstmt.close();
        conn.close();

        if (updatedRows > 0) {
%>
<div class="alert alert-success" role="alert">
    게시물이 성공적으로 수정되었습니다.
</div>
<%
        } else {
%>
<div class="alert alert-danger" role="alert">
    게시물 수정 중 오류가 발생했습니다.
</div>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<a href="/walk-jobs.jsp" class="btn btn-primary">목록으로 돌아가기</a>
</body>
</html>
