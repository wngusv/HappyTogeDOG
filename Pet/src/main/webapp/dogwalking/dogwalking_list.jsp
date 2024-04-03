<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 목록</title>
</head>
<body>
    <!-- 게시글 목록 폼임을 표시 -->
    <h1>게시글 목록</h1>
      <%
      try
      {
        // JDBC 드라이버 연결
        Class.forName("com.mysql.jdbc.Driver");
        String db_address = "jdbc:mysql://192.168.0.106:3306/pet";
        String db_username = "wngus";
        String db_pwd = "wngus";
        Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
        
        // MySQL로 전송하기 위한 쿼리문인 insertQuery 문자열 선언
        String insertQuery = "SELECT * FROM pet.dogwalker order by num desc";
        
        // MySQL 쿼리문 실행
        PreparedStatement psmt = connection.prepareStatement(insertQuery);
        
        // 쿼리문을 전송해 받아온 정보를 result 객체에 저장
        ResultSet result = psmt.executeQuery();%>
        
        <!-- 게시글 목록을 표시할 기본 테이블 생성 -->
        <table border="1">
        <tr>
          <td colspan="5">
            <h3>게시글 제목 클릭시 상세 열람 가능</h3>
          </td>
        </tr>
        <tr>
          <td colspan="5">
            <button type="button" value="신규 글 작성" onClick="location.href='board_new.jsp'">신규 글 작성</button>
          </td>
        </tr>
        <tr>
          <td>번호</td>
          <td>제목</td>
          <td>작성일</td>
        </tr>
        <%
        // 받아온 정보를 입력하고, 하나씩 커서를 다음으로 넘김
        while (result.next())
          {%>
            <tr>
              <!-- 번호 <td> 아래에 DB에서 받아온 num 칼럼값 삽입 -->
              <td><%=result.getInt("num") %></td>
              
              <!-- 제목 <td> 아래에 DB에서 받아온 title 칼럼값 삽입, 제목 클릭시 board_read.jsp로 연결되며 num 칼럼값을 parameter로 넘김 -->
              <td><a href="board_read.jsp?num=<%=result.getInt("num") %>"><%=result.getString("title") %></a></td>
              
              <!-- 작성일 <td> 아래에 DB에서 받아온 date 칼럼값 삽입 -->
              <td><%=result.getTimestamp("date") %></td>
            </tr>
            <%
            }%>
          </table>
        <%
        }
      catch (Exception ex)
      {
        out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
      }%>
</body>
</html>