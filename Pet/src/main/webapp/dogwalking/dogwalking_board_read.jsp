<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 열람</title>
</head>
<body>
<%
    try
    {
        //JDBC 드라이버 연결
        Class.forName("com.mysql.jdbc.Driver");
        String db_address = "jdbc:mysql://192.168.0.106:3306/pet";
        String db_username = "wngus";
        String db_pwd = "wngus";
        Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
		
        // 문자열 인코딩 설정
        request.setCharacterEncoding("UTF-8");
        
        // 파라미터값을 통해 넘어온 게시글 번호를 문자열 변수에 저장
        String num = request.getParameter("num");
        
        // DB에 전송할 쿼리문 설정
        String insertQuery = "SELECT * FROM pet.dogwalker WHERE num=" + num;
				
        // 쿼리문 실행
        PreparedStatement psmt = connection.prepareStatement(insertQuery);
			
        // 받아온 정보를 result 객체에 저장
        ResultSet result = psmt.executeQuery();%>
        
        <table border="1">
        <%
        // 받아온 정보가 있다면...
        while(result.next())
        {%>
            <tbody>
                <tr>
                    <td style="width: 20%;">글 제목</td>
                    <td colspan="2"><%=result.getString("title") %></td>
                </tr>
                <tr>
                    <td>작성 일자</td>
                    <td colspan="2"><%=result.getTimestamp("today_date") %></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td colspan="2" style="height: 200px; text-align: left;"><%=result.getString("content") %></td>
                </tr>
                <tr>
                    <td>첨부파일</td>
                    <td colspan="2">
                    <%
                    // 만약, 첨부파일이 null 이라면... == 첨부파일이 없는 것
                    if (result.getString("file_route").equals("/file_board/upload/null"))
                    {%>
                    첨부파일이 없습니다.
                    <%
                    }
                    else
                    {%>
                        <a style="color: blue; text-decoration: underline;" href="<%=result.getString("file_route") %>"><%=result.getString("file_realName") %></a>
                        <%
                    }%>
                    </td>
                </tr>
            </tbody>
        </table>
    <%} %>
    <a href="board_list.jsp">목록</a>
    <%
    }
    catch(Exception ex)
    {
    	out.print(ex.getMessage());
    }%>
</body>
</html>