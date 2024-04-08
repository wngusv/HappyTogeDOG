<%@ page import="java.sql.*, Util.MyWebContextListener" %>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String insertQuery = "INSERT INTO pet.dogwalker(num, id, title, size, day, time, address, address_detail, pay, content, today_date, fileName1, fileRealName1, file_route1, fileName2, fileRealName2, file_route2 ,fileName3, fileRealName3, file_route3, fileName4, fileRealName4, file_route4, fileName5, fileRealName5, file_route5) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
try (Connection connection = MyWebContextListener.getConnection();
		PreparedStatement psmt = connection.prepareStatement(insertQuery);) {
    // 인코딩 UTF-8 설정
    request.setCharacterEncoding("UTF-8");
    
    // 게시글 번호를 결정하기 위한 임시 정수형 변수 선언
    int num = 0;

    // 파일 업로드 디렉토리 확인 및 생성
    String uploadDir = application.getRealPath("/uploads");
    File uploadDirFile = new File(uploadDir);
    if (!uploadDirFile.exists()) {
        uploadDirFile.mkdirs(); // 디렉토리가 존재하지 않으면 생성
    }

    // 파일 업로드 처리
    int maxSize = 100 * 1024 * 1024; // 최대 업로드 파일 크기
    MultipartRequest multipartRequest = new MultipartRequest(request, uploadDir, maxSize, "UTF-8", new DefaultFileRenamePolicy());
    String id = (String) session.getAttribute("userId"); 
    // MultipartRequest 객체에서 데이터 추출
    String title = multipartRequest.getParameter("title");
    if (title == null || title.trim().isEmpty()) {
        // 제목을 입력하지 않았을 때
        out.println("<script>alert('제목을 입력하세요.');history.back();</script>");
        return; // 처리 중단
    }
    String size = multipartRequest.getParameter("dogSize");
    String day = multipartRequest.getParameter("day");
    String time = multipartRequest.getParameter("time");
    String address = multipartRequest.getParameter("sample6_address");
    String address_detail = multipartRequest.getParameter("sample6_detailAddress");
    String payStr = multipartRequest.getParameter("pay"); // 'pay' 값을 문자열로 읽음
    int pay = 0; // 초기화
    if (payStr != null && !payStr.isEmpty()) {
        pay = Integer.parseInt(payStr); // 문자열이 null이나 빈 문자열이 아닐 때만 파싱
    } else {
        // 시급을 입력하지 않았을 때
        out.println("<script>alert('시급을 입력하세요.');history.back();</script>");
        return; // 처리 중단
    }
    String content = multipartRequest.getParameter("introduction");
    
    Timestamp today_date = new Timestamp(System.currentTimeMillis());
    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
    String formattedDate = sdf.format(today_date);
    
    String fileName1 = multipartRequest.getOriginalFileName("dogPhoto1");
    String fileRealName1 = multipartRequest.getFilesystemName("dogPhoto1");
    String file_route1 = "/uploads/" + fileRealName1; // 상대 경로 저장
    
    String fileName2 = multipartRequest.getOriginalFileName("dogPhoto2");
    String fileRealName2 = multipartRequest.getFilesystemName("dogPhoto2");
    String file_route2 = "/uploads/" + fileRealName2; // 상대 경로 저장
    
    String fileName3 = multipartRequest.getOriginalFileName("dogPhoto3");
    String fileRealName3 = multipartRequest.getFilesystemName("dogPhoto3");
    String file_route3 = "/uploads/" + fileRealName3; // 상대 경로 저장
    
    String fileName4 = multipartRequest.getOriginalFileName("dogPhoto4");
    String fileRealName4 = multipartRequest.getFilesystemName("dogPhoto4");
    String file_route4 = "/uploads/" + fileRealName4; // 상대 경로 저장
    
    String fileName5 = multipartRequest.getOriginalFileName("dogPhoto5");
    String fileRealName5 = multipartRequest.getFilesystemName("dogPhoto5");
    String file_route5 = "/uploads/" + fileRealName5; // 상대 경로 저장

    // DB 연결 및 SQL 쿼리 실행
    
    
    
    psmt.setInt(1, num);
    psmt.setString(2, id);
    psmt.setString(3, title);
    psmt.setString(4, size);
    psmt.setString(5, day);
    psmt.setString(6, time);
    psmt.setString(7, address);
    psmt.setString(8, address_detail);
    psmt.setInt(9, pay);
    psmt.setString(10, content);
    psmt.setTimestamp(11, today_date);
    psmt.setString(12, fileName1);
    psmt.setString(13, fileRealName1);
    psmt.setString(14, file_route1);
    psmt.setString(15, fileName2);
    psmt.setString(16, fileRealName2);
    psmt.setString(17, file_route2);
    psmt.setString(18, fileName3);
    psmt.setString(19, fileRealName3);
    psmt.setString(20, file_route3);
    psmt.setString(21, fileName4);
    psmt.setString(22, fileRealName4);
    psmt.setString(23, file_route4);
    psmt.setString(24, fileName5);
    psmt.setString(25, fileRealName5);
    psmt.setString(26, file_route5);

    psmt.executeUpdate();

    // 성공 시, 게시글 목록 페이지로 리다이렉트
    response.sendRedirect("/walk-jobs.jsp");
} catch (Exception ex) {
    out.println("오류가 발생했습니다. 오류 메시지: " + ex.getMessage());
    ex.printStackTrace();
}
%>