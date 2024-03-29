<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script>
// 페이지가 로드될 때 함수를 실행
document.addEventListener('DOMContentLoaded', function () {
    var nameInput = document.getElementById('name');
    var phoneInput = document.getElementById('phone');
    var certificationButton = document.getElementById('certificationNumber');
    var checkNumberInput = document.getElementById('checkNumber');
    var checkButton = document.getElementById('check');

    // 이벤트 리스너 추가
    nameInput.addEventListener('input', toggleCertificationButton);
    phoneInput.addEventListener('input', toggleCertificationButton);
    certificationButton.addEventListener('click', sendVerificationRequest);
    checkNumberInput.addEventListener('input', toggleCheckButton);

    // 처음에 버튼 상태 설정
    toggleCertificationButton();
    toggleCheckButton();
	
    
    function toggleCertificationButton() {
        certificationButton.disabled = !nameInput.value.trim() || !(phoneInput.value.length === 11 && /^\d+$/.test(phoneInput.value));
    }
    
    function toggleCheckButton() {
        checkButton.disabled = !(checkNumberInput.value.length === 5 && /^\d+$/.test(checkNumberInput.value));
    }
    
    function sendVerificationRequest() {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/api/sendSMS', true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.onreadystatechange = function() {
            if(xhr.readyState == 4 && xhr.status == 200) {
                console.log(xhr.responseText);
            }
        };
        var data = JSON.stringify({ phone: phoneInput.value });
        xhr.send(data);
    }

    function verifyCode() {
        var userCode = document.getElementById('checkNumber').value;
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'VerifyCodeServlet_ID', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                alert(xhr.responseText);
            }
        };
        xhr.send('code=' + userCode);
    }

    document.getElementById('check').addEventListener('click', verifyCode);

    // ...
});
</script>
</head>
<body>
<h2>아이디 찾기</h2>
<form method="post" action="api/findId" id="findId-form">
 <label for="name">이름</label> 
 <input type="text" id="name" name="name" required>
 
 <label for="phone">전화번호</label> 
 <input type="text" maxlength="11" id="phone" name="phone" required oninput="this.value = this.value.replace(/[^0-9]/g, '')">

 <button type="button" id="certificationNumber" disabled>인증번호 받기</button>

 <p>인증번호:</p>
 <input type="text" maxlength="5" id="checkNumber" name="checkNumber" class="gray-text" placeholder="5자리 숫자를 입력하세요." required />
 <button type="button" id="check" disabled>확인</button>

</body>
</html>