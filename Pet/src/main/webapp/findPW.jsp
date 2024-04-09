<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <!-- 부트스트랩 CSS 추가 -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            margin-top: 50px;
        }
        .gray-text {
            color: #888;
        }
    </style>
</head>
<body>
    <div class="container form-container">
        <h2 class="mb-4">비밀번호 찾기</h2>
        <form method="post" action="api/findPW" id="findPW-form">
            <div class="form-group">
                <label for="name">이름</label> 
                <input type="text" id="name" name="name" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="phone">전화번호</label> 
                <input type="text" maxlength="11" id="phone" name="phone" class="form-control" required oninput="this.value = this.value.replace(/[^0-9]/g, '')">
            </div>
            <div class="form-group">
                <button type="button" id="certificationNumber" class="btn btn-secondary" disabled>인증번호 받기</button>
            </div>
            <div class="form-group">
                <label>인증번호:</label>
                <input type="text" maxlength="5" id="checkNumber" name="checkNumber" class="form-control gray-text" placeholder="5자리 숫자를 입력하세요." required />
            </div>
            <div class="form-group">
				<button type="button" id="check" class="btn"
					style="background-color: rgb(88, 185, 117); border-color: rgb(88, 185, 117);"
					disabled>확인</button>
			</div>
        </form>
    </div>

    <!-- 부트스트랩 JavaScript 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- 여기에 기존 JavaScript 코드를 추가 -->
    <script>
// 페이지가 로드될 때 함수를 실행
document.addEventListener('DOMContentLoaded', function () {
	var nameInput = document.getElementById('name');
    var phoneInput = document.getElementById('phone');
    var certificationButton = document.getElementById('certificationNumber');
    var checkNumberInput = document.getElementById('checkNumber');
    var checkButton = document.getElementById('check');

    function updateButtonStates() {
        var isNameFilled = nameInput.value.trim().length > 0;
        var isPhoneCorrect = phoneInput.value.length === 11 && /^\d+$/.test(phoneInput.value);
        var isCodeCorrect = checkNumberInput.value.length === 5 && /^\d+$/.test(checkNumberInput.value);

        certificationButton.disabled = !(isNameFilled && isPhoneCorrect);
        checkButton.disabled = !isCodeCorrect;
    }

    nameInput.addEventListener('input', updateButtonStates);
    phoneInput.addEventListener('input', updateButtonStates);
    checkNumberInput.addEventListener('input', updateButtonStates);

    updateButtonStates();
    
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
    	var userName = document.getElementById('name').value;
        var userPhone = document.getElementById('phone').value;
        var userCode = document.getElementById('checkNumber').value;
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'VerifyCodeServlet_PW', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                alert(xhr.responseText);
            }
        };
     // 여기에 userName과 userPhone을 포함합니다.
        var postData = 'code=' + encodeURIComponent(userCode) +
                       '&name=' + encodeURIComponent(userName) +
                       '&phone=' + encodeURIComponent(userPhone);
        xhr.send(postData);
    }

    
    certificationButton.addEventListener('click', sendVerificationRequest);
    checkButton.addEventListener('click', verifyCode);
    // ...
});
</script>
</body>
</html>
