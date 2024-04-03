<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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
            Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.0.106:3306/pet", "wngus", "wngus");
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
                String fileName = rs.getString("fileName");
                String fileRealName = rs.getString("fileRealName");
                String fileRoute = rs.getString("file_route");
%>
                <h2><%= title %></h2>
                <p>크기: <%= size %></p>
                <p>요일: <%= day %></p>
                <p>시간: <%= time %></p>
                <p>주소: <%= address %> <%= addressDetail %></p>
                <p>시급: <%= pay %></p>
                <p>소개: <%= content %></p>
                <p>날짜: <%= todayDate %></p>
                <img src="<%= fileRoute %>" alt="Dog Photo">
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
