<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.*, javax.servlet.http.HttpSession, Util.MyWebContextListener"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="styles.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h1>마이페이지</h1>
	<%
	try (Connection connection = MyWebContextListener.getConnection();) {
		String userId = (String) session.getAttribute("userId");
		Statement stmt = connection.createStatement();
		// 회원 정보 가져오기
		String userInfoQuery = "SELECT * FROM pet.user WHERE id = '" + userId + "'";
		ResultSet userInfoRs = stmt.executeQuery(userInfoQuery);
		if (userInfoRs.next()) {
			String id = userInfoRs.getString("id");
			String password = userInfoRs.getString("pw");
			String userName = userInfoRs.getString("user_name");
			String phone = userInfoRs.getString("phone");
			String address = userInfoRs.getString("address");
			String addressDetail = userInfoRs.getString("address_detail");
	%>
	<div>
		<h2>회원 정보</h2>
		<p>
			<strong>아이디:</strong>
			<%=id%></p>
		<p>
			<strong>패스워드:</strong>
			<%=password%></p>
		<p>
			<strong>이름:</strong>
			<%=userName%></p>
		<p>
			<strong>핸드폰:</strong>
			<%=phone%></p>
		<p>
			<strong>주소:</strong>
			<%=address%>
			<%=addressDetail%></p>
		<a href="/mypage/EditUserInfo.jsp?type=address">회원정보수정</a>
	</div>
	<div>
		<h2>내가 쓴 글 보기</h2>
		<table border="1">
			<tr>
				<th>제목</th>
				<th>작성 날짜</th>
				<th>삭제</th>
			</tr>
			<%
			// 사용자가 작성한 글 가져오기
			String userPostsQuery = "SELECT * FROM dogwalker WHERE id = '" + userId + "' ORDER BY today_date DESC";
			ResultSet userPostsRs = stmt.executeQuery(userPostsQuery);
			while (userPostsRs.next()) {
				int postId = userPostsRs.getInt("num");
				String title = userPostsRs.getString("title");
				String todayDate = userPostsRs.getString("today_date");
			%>
			<tr>
				<td><a href="/mypage/ViewPost.jsp?postId=<%=postId%>"><%=title%></a></td>
				<td><%=todayDate%></td>
				<td><a href="#" onclick="confirmDelete('<%=postId%>')">삭제</a></td>


				<script>
					function confirmDelete(postId) {
						var confirmResult = confirm("정말로 삭제하시겠습니까?");
						if (confirmResult) {
							// AJAX 요청을 사용하여 글 삭제
							$.ajax({
								url : "/mypage/DeletePost.jsp", // 서버 측 삭제 처리 URL
								type : "POST", // HTTP 요청 메소드
								data : {
									postId : postId
								}, // 서버로 보낼 데이터
								success : function(response) {
									// 성공적으로 삭제된 후의 처리. 예를 들어, 페이지를 새로고침하거나, 삭제된 항목을 DOM에서 제거할 수 있습니다.
									alert("글이 성공적으로 삭제되었습니다.");
									window.location.reload(); // 페이지를 새로 고침하여 변경 사항 반영
								},
								error : function(xhr, status, error) {
									// 오류 처리
									alert("삭제 중 오류가 발생했습니다.");
								}
							});
						}
					}
				</script>
			</tr>
			<%
			}
			userPostsRs.close();
			%>
		</table>
	</div>
	<div>
		<h2>내가 쓴 게시글</h2>
		<table border="1">
			<tr>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성 날짜</th>
				<th>삭제</th>
			</tr>
			<%
			String boardReadingSql = "SELECT * FROM board WHERE id = '" + userId + "' ORDER BY postdate DESC";

			try (ResultSet boardReadingRs = stmt.executeQuery(boardReadingSql);) {
				while (boardReadingRs.next()) {
					String category = boardReadingRs.getString("category");
					String title = boardReadingRs.getString("title");
					String postdate = boardReadingRs.getString("postdate");
					int idx = boardReadingRs.getInt("idx");
			%>
			<tr>
				<td><%=category%></a></td>
				<td><a href="/boardReading.jsp?idx=<%=idx%>"><%=title%></a></td>
				<td><%=postdate%></td>
				<td><a href="#" onclick="confirmDeletee('<%=idx%>')">삭제</a></td>

				<script>
					function confirmDeletee(idx) {
						var confirmResult = confirm("정말로 삭제하시겠습니까?");
						if (confirmResult) {
							// AJAX 요청을 사용하여 글 삭제
							$.ajax({
								url : "/boardDeleteServlet.do", // 서버 측 삭제 처리 URL
								type : "GET",
								data : {
									idx : idx
								},
								success : function(response) {
									alert("글이 성공적으로 삭제되었습니다.");
									window.location.reload(); // 페이지를 새로 고침
								},
								error : function(xhr, status, error) {
									alert("삭제 중 오류가 발생했습니다.");
								}
							});
						}
					}
				</script>
			</tr>



			<%
			}
			}
			%>
		</table>
	</div>
	<div>
		<h2>내 채팅방 보기</h2>
	</div>
	<%
	} else {
	// 회원 정보가 없는 경우
	out.println("회원 정보를 찾을 수 없습니다.");
	}
	} catch (Exception e) {
	out.println("오류가 발생했습니다. 오류 메시지: " + e.getMessage());
	}
	%>
</body>
</html>