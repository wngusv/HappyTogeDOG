<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Util.MyWebContextListener" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
</head>
<body>
<%
    String num = request.getParameter("num");
    if(num != null && !num.isEmpty()) {
        try {
        	Connection conn = MyWebContextListener.getConnection();
            String query = "SELECT * FROM dogwalker WHERE num = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(num));
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
                String fileRealName1 = rs.getString("fileRealName1");
                String fileRoute1 = rs.getString("file_route1");
                String fileName2 = rs.getString("fileName2");
                String fileRealName2 = rs.getString("fileRealName2");
                String fileRoute2 = rs.getString("file_route2");
                String fileName3 = rs.getString("fileName3");
                String fileRealName3 = rs.getString("fileRealName3");
                String fileRoute3 = rs.getString("file_route3");
                String fileName4 = rs.getString("fileName4");
                String fileRealName4 = rs.getString("fileRealName4");
                String fileRoute4 = rs.getString("file_route4");
                String fileName5 = rs.getString("fileName5");
                String fileRealName5 = rs.getString("fileRealName5");
                String fileRoute5 = rs.getString("file_route5");
%>
                <h2><%= title %></h2>
                <p>크기: <%= size %></p>
                <p>요일: <%= day %></p>
                <p>시간: <%= time %></p>
                <p>주소: <%= address %> <%= addressDetail %></p>
                <p>시급: <%= pay %></p>
                <p>소개: <%= content %></p>
                <p>날짜: <%= todayDate %></p>
                <img src="<%= fileRoute1 %>" alt="Dog Photo1">
                <img src="<%= fileRoute2 %>" alt="Dog Photo2">
                <img src="<%= fileRoute3 %>" alt="Dog Photo3">
                <img src="<%= fileRoute4 %>" alt="Dog Photo4">
                <img src="<%= fileRoute5 %>" alt="Dog Photo5">
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
<a href="/walk-jobs.jsp">목록으로 돌아가기</a>
</body>
</html>
