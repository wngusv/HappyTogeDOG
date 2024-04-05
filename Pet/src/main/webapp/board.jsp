<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Util.MyWebContextListener"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/floating-banner.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<style>
.social-links {
	list-style: none; /* 리스트 스타일 없애기 */
	padding: 0; /* 패딩 제거 */
	margin: 0; /* 마진 제거 */
	display: flex; /* flexbox를 사용하여 요소들을 가로로 나열 */
	justify-content: flex-end; /* 요소들을 컨테이너의 오른쪽 끝으로 정렬 */
	align-items: center; /* 요소들을 중앙에 정렬 */
}

.social-links li {
	margin-left: 10px; /* 링크들 사이의 간격 설정 */
}
</style>
<body style="padding-top: 150px;">
	<header>
		<%
		request.setAttribute("pageTitle", "게시판");
		%>
		<jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
	</header>

	<main>
		<div class="container">
			<section class="strays-info">
				<h2>본인동네 자유게시판(ex.부산진구 자유게시판)</h2>
				<input type="text" name="find"> <input type="button"
					value="검색"> <input type="button" value="작성한 글보기"
					onclick="location.href='boardWrite.jsp';">
				<%-- 내가 쓴 글 목록들 보여주는 곳으로 이동시키기... --%>
				<input type="button" value="글쓰기"
					onclick="location.href='boardWrite.jsp';">
				<!-- 부트스트랩을 사용한 테이블 스타일 -->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th width=100>
								<!-- 카테고리 선택 폼 -->
								<form action="board.jsp" method="get">
									<select name="categoryFilter" onchange="this.form.submit()">
										<option value="">--</option>
										<option value="소통">소통</option>
										<option value="긴급">긴급</option>
										<option value="후기">후기</option>
									</select>
								</form>

							</th>
							<th>제목</th>
							<th>아이디</th>
							<th>작성시간</th>
							<!-- <th>좋아요</th> 일단 언젠가..-->
						</tr>
					</thead>
					<tbody>
						<!-- 테이블 데이터 행 -->
						<%
						  int pagee = 1;
					    int pageeSize = 10;
					    if(request.getParameter("pagee") != null){
					        pagee = Integer.parseInt(request.getParameter("pagee"));
					    }
					    
    String categoryFilter = request.getParameter("categoryFilter");
    String sql = "SELECT idx, category, title, id, postdate FROM board";

    // categoryFilter 값이 비어있지 않으면 WHERE 절 추가
    if (categoryFilter != null && !categoryFilter.isEmpty()) {
        sql += " WHERE category = ?";
    }
    sql += " ORDER BY postdate DESC LIMIT ?, ?";

    try (Connection conn = MyWebContextListener.getConnection(); 
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        // categoryFilter 값이 비어있지 않으면 파라미터 설정
        if (categoryFilter != null && !categoryFilter.isEmpty()) {
            stmt.setString(1, categoryFilter);
            stmt.setInt(2, (pagee-1) * pageeSize);
            stmt.setInt(3, pageeSize);
        } else {
            stmt.setInt(1, (pagee-1) * pageeSize);
            stmt.setInt(2, pageeSize);
        }

        try (ResultSet rs = stmt.executeQuery();) {
            while (rs.next()) {
						%>
						<tr>
							<td><%=rs.getString("category")%></td>
							<td><a
								href="boardReading.jsp?idx=<%=rs.getInt("idx")%>"><%=rs.getString("title")%></a></td>
							<td><%=rs.getString("id")%></td>
							<td><%=rs.getTimestamp("postdate").toString()%></td>
						</tr>

						<%
						}
						}

						} catch (Exception ex) {
						out.println("오류가 발생했습니다. " + ex.getMessage());
						}
						%>

					</tbody>
				</table>
				<%
    // 총 게시물 수 계산하기 위한 쿼리
    String countSql = "SELECT COUNT(*) FROM board";
    if (categoryFilter != null && !categoryFilter.isEmpty()) {
        countSql += " WHERE category = ?";
    }
    try (Connection conn = MyWebContextListener.getConnection(); 
         PreparedStatement stmt = conn.prepareStatement(countSql)) {

        if (categoryFilter != null && !categoryFilter.isEmpty()) {
            stmt.setString(1, categoryFilter);
        }

        try (ResultSet rs = stmt.executeQuery();) {
            if (rs.next()) {
                int totalPosts = rs.getInt(1);
                int totalPages = (int) Math.ceil((double) totalPosts / pageeSize);

                for(int i = 1; i <= totalPages; i++){
                    if(pagee == i){
                        out.print("<b>" + i + "</b> "); // 현재 페이지 강조
                    } else {
                        out.print("<a href='board.jsp?pagee=" + i + "'>" + i + "</a> ");
                    }
                }
            }
        }
    } catch (Exception ex) {
        out.println("오류가 발생했습니다: " + ex.getMessage());
    }
%>
				
			</section>

		</div>
	</main>

	<footer>
		<div class="container">
			<p>&copy; 2024 Pet. 모든 권리 보유.</p>
		</div>
	</footer>
</body>
</html>
