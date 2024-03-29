<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
    /* 본인인증 다이얼로그 스타일 */
    .modal {
        display: none; /* 기본적으로 숨김 */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }


    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 80%; /* Could be more or less, depending on screen size */
    }

    /* 회색 글씨 스타일 */
    .gray-text {
        color: #888;
    }
</style>
</head>
<body>
<header>
   <div class="container">
      <div class="logo">
         <h1>회원가입</h1>
      </div>
      <nav>
         <ul>
            <li><a href="#">로그인</a></li>
            <li><a href="#">회원가입</a></li>
         </ul>
      </nav>
   </div>
</header>

<section class="signup-form">
   <div class="container">
      <form action="ProcessSignupServlet" method="post" onsubmit="return comparePasswords()">
         <div class="form-group">
            <label for="id">아이디</label> <input type="text" id="id" maxlength="10" name="id" required>
            <button type="button" id="checkDuplicate">중복확인</button>
            <span id="duplicateResult" class="gray-text"></span>
         </div>
         <div class="form-group">
            <label for="password">비밀번호</label> <input type="password" id="password" maxlength="20" name="password" required>
         </div>
         <div class="form-group">
            <label for="confirmPassword">비밀번호 확인</label> <input type="password" id="confirmPassword" maxlength="20" name="confirmPassword" required>
         </div>
         <div class="form-group">
            <label for="name">이름</label> <input type="text" id="name" name="name" required>
         </div>
         <div class="form-group">
            <label for="phone">전화번호</label> <input type="text" maxlength="11" id="phone" name="phone" required oninput="this.value = this.value.replace(/[^0-9]/g, '')">
            <button type="button" id="verifyPhone" onclick="sendSMS()">본인인증</button>
         </div>
         <div class="form-group">
            <label for="address">주소</label>
            <input type="text" id="sample6_postcode" placeholder="우편번호">
            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br> 
            <input type="text" id="sample6_address" placeholder="주소" name="address"><br> 
            <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="address_detail">
         </div>
         <button type="submit">확인</button>
      </form>
   </div>
</section>

<!-- 비밀번호 불일치 모달 -->
<div id="passwordMismatchModal" class="modal">
   <div class="modal-content">
       <h2>비밀번호가 일치하지 않습니다</h2>
       <button type="button" onclick="closePasswordMismatchModal()">확인</button>
   </div>
</div>



<!-- 본인인증 다이얼로그 HTML -->
<div id="phoneVerificationModal" class="modal">
    <div class="modal-content">
        <h2>본인 인증</h2>
        <p>인증번호를 입력하세요:</p>
        <input type="text" id="verificationCode" class="gray-text" placeholder="5자리 숫자를 입력하세요.">
        <button type="button" onclick="verifyCode()">확인</button>
        <button type="button" onclick="closeModal()">취소</button>
    </div>
</div>



<footer>
   <div class="container">
      <p>&copy; 2024 산책 아르바이트. All rights reserved.</p>
   </div>
</footer>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sendSMS() {
    var phoneNumber = document.getElementById("phone").value;
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "SendSmsServlet?phone=" + phoneNumber, true);
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            // 성공적으로 SMS 발송 요청을 처리했을 때의 로직
            alert("인증번호가 발송되었습니다.");
        } else {
            // 에러 처리
            alert("SMS 발송에 실패했습니다.");
        }
    };
    xhr.send();
}

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                var addr = ''; // 주소 변수
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    // 다이얼로그 열기 함수
    function openModal() {
        document.getElementById('phoneVerificationModal').style.display = 'block';
        document.getElementById('verificationCode').classList.remove('gray-text');
    }

    // 다이얼로그 닫기 함수
    function closeModal() {
        document.getElementById('phoneVerificationModal').style.display = 'none';
        document.getElementById('verificationCode').classList.add('gray-text');
    }

    // 인증번호 검증 함수
function verifyCode() {
    var code = document.getElementById('verificationCode').value;
    
    // AJAX 요청 생성 및 전송
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "VerifyCodeServlet", true); // VerifyCodeServlet는 인증번호 검증을 처리하는 서블릿의 URL
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            // 서버로부터의 응답 처리
            alert(this.responseText); // 예: "인증되었습니다." 또는 "인증번호가 일치하지 않습니다."
            if (this.responseText.includes("인증되었습니다")) {
                closeModal(); // 인증 성공 시 다이얼로그 닫기
            }
        }
    };
    xhr.send("code=" + code); // POST 요청의 본문에 인증번호 포함
}


//    document.getElementById('verifyPhone').addEventListener('click', openModal);
    
 // 본인인증 버튼 상태를 토글하는 함수
//    function toggleVerifyPhoneButton() {
//        var phoneInput = document.getElementById('phone').value;
//        var verifyPhoneButton = document.getElementById('verifyPhone');
        // 전화번호 입력이 정확히 11자리 and 모든 문자가 숫자로만 구성된 경우에 참
//        verifyPhoneButton.disabled = !(phoneInput.length === 11 && /^\d+$/.test(phoneInput));
//    }

    // 전화번호 입력 변경시 이벤트 리스너
//    document.getElementById('phone').addEventListener('input', toggleVerifyPhoneButton);

    // 페이지 로드시 버튼 상태를 올바르게 설정하기 위해 초기 호출
//    toggleVerifyPhoneButton();

    // 기존 본인인	증 버튼에 대한 이벤트 리스너
//    document.getElementById('verifyPhone').addEventListener('click', openModal);
    
    // 중복 확인 버튼을 클릭했을 때 실행될 함수
    function checkDuplicateClick() {
        var id = document.getElementById('id').value; // 아이디 입력란의 값 가져오기

        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'CheckIDServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var resp = xhr.responseText;
                    document.getElementById('duplicateResult').textContent = resp; // 결과를 화면에 표시
                } else {
                    console.error('서버 오류:', xhr.status);
                }
            }
        };
        xhr.send('id=' + id); // 아이디를 서버로 전송
    }

    document.getElementById('checkDuplicate').addEventListener('click', checkDuplicateClick);

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

</script>
</body>
</html>
