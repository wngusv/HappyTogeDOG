<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<body>
	<header>
		<div class="container">
			<h1>게시판</h1>
			<nav>
				<ul>
					<c:choose>
						<c:when test="${sessionScope.userId != null}">
							<!-- 로그인된 경우: 사용자 이름과 로그아웃 버튼만 표시 -->
							<li id="username-container"><span id="username-greeting">
									안녕하세요, ${sessionScope.userName}님! </span> <a id="logout-button"
								href="./api/logout">로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<!-- 로그인되지 않은 경우: 로그인 및 회원가입 링크 표시 -->
							<li><a id="login-button" href="login.jsp">로그인</a></li>
							<li><a href="signupform.jsp">회원가입</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
			<!-- SNS 공유 버튼 -->
			<div class="sns-go">
				<ul class="social-links">
					<li><a href="#"
						onclick="javascript:window.open('http://share.naver.com/web/shareView.nhn?url=' +encodeURIComponent(document.URL)+'&title='+encodeURIComponent(document.title), 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
						target="_blank" alt="Share on Naver"><img
							src="./images/sns_naver.png" width="40" alt="네이버 블로그 공유"></a></li>
					<li><a href="#"
						onclick="javascript:window.open('http://band.us/plugin/share?body='+encodeURIComponent(document.title)+encodeURIComponent('\r\n')+encodeURIComponent(document.URL)+'&route='+encodeURIComponent(document.URL), 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;"
						target="_blank" alt="네이버 밴드 공유하기"><img
							src="./images/naverband.png" width="40px" alt='네이버 밴드 공유'></a></li>
					<li><a href="#"
						onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
						target="_blank" alt="Share on Facebook"><img
							src="./images/sns_face.png" width="40" alt="페이스북 공유"></a></li>
				</ul>
			</div>
		</div>
	</header>
 
	<main>
		<div class="container">
			<section class="strays-info">
				<h2>본인동네 자유게시판(ex.부산진구 자유게시판)</h2>
				<input type="text" name="find"> <input type="button"
					value="검색"> <input type="button" value="작성한 글보기" onclick="location.href='boardWrite.jsp';"> <%-- 내가 쓴 글 목록들 보여주는 곳으로 이동시키기... --%>
					 <input type="button" value="글쓰기" onclick="location.href='boardWrite.jsp';">
				<!-- 부트스트랩을 사용한 테이블 스타일 -->
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th width=100><select>
									<option>소통</option>
									<option>긴급</option>
							</select></th>
							<th>제목</th>
							<th>아이디</th>
							<th>작성시간</th>
							<th>좋아요</th>
						</tr>
					</thead>
					<tbody>
						<!-- 테이블 데이터 행 -->
					</tbody>
				</table>
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
