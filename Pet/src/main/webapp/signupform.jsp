<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

  .form-wrapper {
    padding: 20px;
  }
  /* 모달 전체 스타일 */
  .modal {
    display: none; /* 기본적으로 숨겨져 있음 */
    position: fixed; /* 고정된 위치 */
    z-index: 1; /* 다른 요소 위에 표시 */
    left: 0;
    top: 0;
    width: 100%; /* 전체 너비 */
    height: 100%; /* 전체 높이 */
    overflow: auto; /* 필요한 경우 스크롤바 */
    background-color: rgb(0, 0, 0); /* 불투명도를 가진 검정색 배경 */
    background-color: rgba(0, 0, 0, 0.4); /* 배경의 약간의 투명도 */
  }

  /* 모달 내용 스타일 */
  .modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 상단 여백과 자동 가로 정렬 */
    padding: 20px;
    border: 1px solid #888;
    width: 50%; /* 모달 창의 너비 */
    max-width: 600px; /* 최대 너비 설정 */
  }
</style>
</head>
<body style="background-color: rgb(254, 247, 222);">
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light" >
			<div class="container">
				<a class="navbar-brand" href="#"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon" ></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="login.jsp">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="index.jsp">메인화면</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<section class="signup-form">
		<div class="container">
			<form action="ProcessSignupServlet" method="post"
				onsubmit="return comparePasswords()">
				<div class="form-group">
					<label for="id">아이디</label>
					<div class="input-group">
						<input type="text" id="id" class="form-control" maxlength="10"
							name="id" required>
						<div class="input-group-append">
							<button type="button" id="checkDuplicate"
								class="btn btn-outline-secondary">중복확인</button>
						</div>
					</div>
					<span id="duplicateResult" class="gray-text"></span>
				</div>
				<div class="form-group">
					<label for="password">비밀번호</label> <input type="password"
						id="password" class="form-control" maxlength="20" name="password"
						required>
				</div>
				<div class="form-group">
					<label for="confirmPassword">비밀번호 확인</label> <input type="password"
						id="confirmPassword" class="form-control" maxlength="20"
						name="confirmPassword" required>
				</div>
				<div class="form-group">
					<label for="name">이름</label> <input type="text" id="name"
						class="form-control" name="name" required>
				</div>
				<div class="form-group">
					<label for="phone">전화번호</label>
					<div class="input-group">
						<input type="text" id="phone" class="form-control" maxlength="11"
							name="phone" required
							oninput="this.value = this.value.replace(/[^0-9]/g, '')">
						<div class="input-group-append">
							<button type="button" id="verifyPhone"
								class="btn btn-outline-secondary" onclick="sendSMS()">본인인증</button>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="address">주소</label>
					<div class="input-group mb-3">
						<input type="text" id="sample6_postcode" class="form-control"
							placeholder="우편번호">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
						</div>
					</div>
					<input type="text" id="sample6_address" class="form-control mb-2"
						placeholder="주소" name="address"> <input type="text"
						id="sample6_detailAddress" class="form-control" placeholder="상세주소"
						name="address_detail">
				</div>
				<button type="submit" id="submitBtn" class="btn btn-primary">확인</button>
			</form>
		</div>
	</section>

	<!-- 비밀번호 불일치 모달 -->
	<div id="passwordMismatchModal" class="modal">
		<div class="modal-content">
			<h2>비밀번호가 일치하지 않습니다</h2>
			<button type="button" onclick="closePasswordMismatchModal()"
				class="btn btn-primary">확인</button>
		</div>
	</div>

	<!-- 본인인증 다이얼로그 HTML -->
	<div id="phoneVerificationModal" class="modal">
		<div class="modal-content">
			<h2>본인 인증</h2>
			<p>인증번호를 입력하세요:</p>
			<input type="text" id="verificationCode" class="form-control"
				placeholder="5자리 숫자를 입력하세요.">
			<button type="button" onclick="verifyCode()" class="btn btn-primary">확인</button>
			<button type="button" onclick="closeModal()"
				class="btn btn-secondary">취소</button>
		</div>
	</div>

	<footer class="footer mt-auto py-3">
		<div class="container">
			
		</div>
	</footer>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		var isVerified = false; // 본인 인증 상태
		var isIdChecked = false; // 중복 확인 상태

		function sendSMS() {
			var phoneNumber = document.getElementById("phone").value;
			var xhr = new XMLHttpRequest();
			xhr.open('POST', '/api/sendSMS', true);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					// 성공적으로 SMS 발송 요청을 처리했을 때의 로직
					alert("인증번호가 발송되었습니다.");
				} else if (xhr.readyState == 4) {
					// 에러 처리
					alert("SMS 발송에 실패했습니다.");
				}
			};
			var data = JSON.stringify({
				phone : phoneNumber
			});
			xhr.send(data);
		}

		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							var addr = ''; // 주소 변수
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}

		// 다이얼로그 열기 함수
		function openModal() {
			document.getElementById('phoneVerificationModal').style.display = 'block';
			document.getElementById('verificationCode').classList
					.remove('gray-text');
		}

		// 다이얼로그 닫기 함수
		function closeModal() {
			document.getElementById('phoneVerificationModal').style.display = 'none';
			document.getElementById('verificationCode').classList
					.add('gray-text');
		}
		// 버튼 활성화 상태를 업데이트하는 함수
		function updateSubmitButtonState() {
			document.getElementById('submitBtn').disabled = !(isVerified && isIdChecked);
		}

		// 인증번호 검증 함수
		function verifyCode() {
			var code = document.getElementById('verificationCode').value;

			// AJAX 요청 생성 및 전송
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "VerifyCodeServlet", true); // VerifyCodeServlet는 인증번호 검증을 처리하는 서블릿의 URL
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					alert(this.responseText);
					if (this.responseText.includes("인증되었습니다")) {
						isVerified = true; // 본인 인증 성공 상태로 설정
						updateSubmitButtonState(); // 버튼 상태 업데이트
						closeModal();
					} else {
						isVerified = false; // 본인 인증 실패 또는 아직 인증되지 않음
					}
				}
			};
			xhr.send("code=" + code); // POST 요청의 본문에 인증번호 포함
		}

		// 페이지 로드 시 확인 버튼 비활성화
		window.onload = function() {
			document.getElementById('submitBtn').disabled = true;
		};

		// 기존 본인인증 버튼에 대한 이벤트 리스너
		document.getElementById('verifyPhone').addEventListener('click',
				openModal);

		// 중복 확인 버튼을 클릭했을 때 실행될 함수
		function checkDuplicateClick() {
			var id = document.getElementById('id').value; // 아이디 입력란의 값 가져오기

			var xhr = new XMLHttpRequest();
			xhr.open('POST', 'CheckIDServlet', true);
			xhr.setRequestHeader('Content-Type',
					'application/x-www-form-urlencoded; charset=UTF-8');
			xhr.onreadystatechange = function() {
				if (xhr.readyState === XMLHttpRequest.DONE) {
					if (xhr.status === 200) {
						var resp = xhr.responseText;
						document.getElementById('duplicateResult').textContent = resp; // 결과를 화면에 표시
						if (resp === "사용 가능한 아이디입니다.") {
							isIdChecked = true;
						} else {
							isIdChecked = false;
						}
						updateSubmitButtonState(); // 버튼 상태 업데이트
					} else {
						console.error('서버 오류:', xhr.status);
					}
				}
			};
			xhr.send('id=' + id); // 아이디를 서버로 전송 
		}

		// 페이지 로드 시 확인 버튼 비활성화
		window.onload = function() {
			updateSubmitButtonState();
		};

		document.getElementById('checkDuplicate').addEventListener('click',
				checkDuplicateClick);

		// 비밀번호 일치 여부 확인 함수
		function comparePasswords() {
			var password = document.getElementById("password").value;
			var confirmPassword = document.getElementById("confirmPassword").value;

			if (password !== confirmPassword) {
				// 비밀번호와 비밀번호 확인이 일치하지 않을 때
				openPasswordMismatchModal();
				return false; // 제출 중단
			}

			return true; // 비밀번호가 일치하므로 제출 계속
		}

		// 다이얼로그 열기 함수
		function openPasswordMismatchModal() {
			document.getElementById("passwordMismatchModal").style.display = "block";
		}

		// 비밀번호 불일치 모달 닫기 함수
		function closePasswordMismatchModal() {
			var modal = document.getElementById("passwordMismatchModal");
			modal.style.display = "none"; // 모달 숨기기
		}
		
		function validateFormFields() {
		    var id = document.getElementById("id").value;
		    var password = document.getElementById("password").value;
		    var confirmPassword = document.getElementById("confirmPassword").value;
		    var name = document.getElementById("name").value;
		    var phone = document.getElementById("phone").value;
		    var address = document.getElementById("sample6_address").value;
		    var detailAddress = document.getElementById("sample6_detailAddress").value;

		    // 필드가 비어있는지 확인
		    if (!id) {
		        alert("아이디를 입력해주세요.");
		        return false; // 폼 제출을 중단합니다.
		    } else if (!password) {
		    	alert("비밀번호를 입력해주세요.")
		    	return false;
		    } else if (!confirmPassword) {
		    	alert("비밀번호 확인 해주세요.")
		    	return false;
		    } else if (!name) {
		    	alert("이름을 입력해주세요.")
		    	return false;
		    } else if (!phone) {
		    	alert("전화번호를 입력해주세요.")
		    	return false;
		    } else if (!sample6_address) {
		    	alert("주소를 입력해주세요.")
		    	return false;
		    } else if (!sample6_detailAddress) {
		    	alert("상세주소를 입력해주세요.")
		    	return false;
		    }
		    return true; // 모든 필드가 채워져 있으므로 폼 제출을 계속합니다.
		}

	</script>
</body>
</html>
