<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 창</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: sans-serif;
}

.login-wrapper {
	margin: 50px auto;
	width: 300px;
	padding: 20px;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

#login-error {
	color: red;
	text-align: center;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	
	<div class="login-wrapper">
		<h2>로그인</h2>
		<div id="login-error"></div>
		<form method="post" action="api/login" id="login-form">
			<div class="form-group">
				<input type="text" class="form-control" name="userId"
					placeholder="아이디" />
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="userPassword"
					placeholder="비밀번호" />
			</div>
			<button type="submit" class="btn btn-primary btn-block">로그인</button>
			<div class="text-center mt-3">
				<button type="button" class="btn btn-link" id="findID">아이디
					찾기</button>
				<button type="button" class="btn btn-link" id="findPW">비밀번호
					찾기</button>
			</div>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// 아이디찾기 버튼에 클릭 이벤트 리스너 추가
			document.getElementById('findID').addEventListener('click',
					function() {
						// "아이디 찾기" 페이지로 이동
						window.location.href = 'findID.jsp'; // 아이디 찾기 페이지의 URL로 변경해야 함
					});
		});

		document.addEventListener('DOMContentLoaded', function() {
			// 비밀번호찾기 버튼에 클릭 이벤트 리스너 추가
			document.getElementById('findPW').addEventListener('click',
					function() {
						// "비밀번호 찾기" 페이지로 이동
						window.location.href = 'findPW.jsp'; // 비밀번호 찾기 페이지의 URL로 변경해야 함
					});
		});
	</script>
</body>
</html>
