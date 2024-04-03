<%@page import="java.sql.*"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
try {
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

    // MultipartRequest 객체에서 데이터 추출
    String title = multipartRequest.getParameter("title");
    String size = multipartRequest.getParameter("dogSize");
    String day = multipartRequest.getParameter("day");
    String time = multipartRequest.getParameter("time");
    String address = multipartRequest.getParameter("sample6_address");
    String address_detail = multipartRequest.getParameter("sample6_detailAddress");
    String payStr = multipartRequest.getParameter("pay"); // 'pay' 값을 문자열로 읽음
    int pay = 0; // 초기화
    if (payStr != null && !payStr.isEmpty()) {
        pay = Integer.parseInt(payStr); // 문자열이 null이나 빈 문자열이 아닐 때만 파싱
    }
    String content = multipartRequest.getParameter("introduction");
    Timestamp today_date = new Timestamp(System.currentTimeMillis());
    String fileName = multipartRequest.getOriginalFileName("dogPhoto");
    String fileRealName = multipartRequest.getFilesystemName("dogPhoto");
    String file_route = "/uploads/" + fileRealName; // 상대 경로 저장

    // DB 연결 및 SQL 쿼리 실행
    Connection connection = DriverManager.getConnection("jdbc:mysql://192.168.0.106:3306/pet", "wngus", "wngus");
    String insertQuery = "INSERT INTO pet.dogwalker(num, title, size, day, time, address, address_detail, pay, content, today_date, fileName, fileRealName, file_route) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    PreparedStatement psmt = connection.prepareStatement(insertQuery);
    psmt.setInt(1, num);
    psmt.setString(2, title);
    psmt.setString(3, size);
    psmt.setString(4, day);
    psmt.setString(5, time);
    psmt.setString(6, address);
    psmt.setString(7, address_detail);
    psmt.setInt(8, pay);
    psmt.setString(9, content);
    psmt.setTimestamp(10, today_date);
    psmt.setString(11, fileName);
    psmt.setString(12, fileRealName);
    psmt.setString(13, file_route);

    psmt.executeUpdate();

    // 성공 시, 게시글 목록 페이지로 리다이렉트
    response.sendRedirect("/walk-jobs.jsp");
} catch (Exception ex) {
    out.println("오류가 발생했습니다. 오류 메시지: " + ex.getMessage());
    ex.printStackTrace();
}
%>

