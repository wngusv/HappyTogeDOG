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
            background-color: rgb(254, 247, 222);
        }

        .container-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .img-container img {
            max-width: 100%;
            height: auto;
        }

        .login-wrapper {
            padding: 20px;
        }
        .container-wrapper {
    margin: 0 auto; /* 중앙 정렬 */
    max-width: 1000px; /* 최대 너비 설정 */
}
</style>
</head>
<body>
    <div class="container container-wrapper">
        <div class="row">
            <!-- 이미지 좌측에 배치 -->
            <div class="col-md-6">
                <div class="img-container">
                    <img src="/images/소개.png" alt="이미지">
                </div>
            </div>
            <!-- 로그인 창 우측에 배치 -->
            <div class="col-md-6 login-wrapper">
                <!-- 로그인 폼 내용 -->
                <br>
                <h2>로그인</h2>
                <br>
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
			<br>
			<button type="submit" class="btn btn-primary btn-block" style="background-color: rgb(235, 135, 106); border-color: rgb(235, 135, 106)">로그인</button>
			<div class="text-center mt-3">
				<button type="button" class="btn btn-link" id="findID" style="color: rgb(109, 95, 80);">아이디 찾기</button>
				<button type="button" class="btn btn-link" id="findPW" style="color: rgb(109, 95, 80);">/  비밀번호 찾기</button>
			</div>
		</form>
                
                
            </div>
            
        </div>
    </div>
    
    <!-- 나머지 스크립트와 HTML 내용 -->
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
		 function getQueryParam(param) {
	            var searchParams = new URLSearchParams(window.location.search);
	            return searchParams.get(param);
	        }
	        
	        // "error" 쿼리 파라미터 확인
	        var errorMessage = getQueryParam("error");
	        if (errorMessage) {
	            alert(decodeURIComponent(errorMessage));
	        }
	</script>
</body>
</html>
