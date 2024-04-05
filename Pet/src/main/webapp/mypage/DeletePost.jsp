<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Util.MyWebContextListener" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 삭제</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
    String postId = request.getParameter("postId");
    if(postId != null && !postId.isEmpty()) {
    	String query = "DELETE FROM dogwalker WHERE num = ?";
    	try(Connection conn = MyWebContextListener.getConnection();
        		PreparedStatement pstmt = conn.prepareStatement(query);) {
            pstmt.setInt(1, Integer.parseInt(postId));
            int deletedRows = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            
            if(deletedRows > 0) {
%>
<div class="alert alert-success" role="alert">
    게시물이 성공적으로 삭제되었습니다.
</div>
<%
            } else {
%>
<div class="alert alert-danger" role="alert">
    게시물 삭제 중 오류가 발생했습니다.
</div>
<%
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
%>
<a href="/walk-jobs.jsp" class="btn btn-primary">목록으로 돌아가기</a>
</body>
</html>
