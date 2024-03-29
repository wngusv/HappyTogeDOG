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
    // 입력 필드와 버튼 요소를 가져옴
    var nameInput = document.getElementById('name');
    var phoneInput = document.getElementById('phone');
    var certificationButton = document.getElementById('certificationNumber');

    // 이벤트 리스너 추가
    nameInput.addEventListener('input', toggleCertificationButton);
    phoneInput.addEventListener('input', toggleCertificationButton);
    certificationButton.addEventListener('click', sendVerificationRequest);

    // 처음에 버튼 상태 설정
    toggleCertificationButton();

    // 버튼 활성화/비활성화 함수
    function toggleCertificationButton() {
        // 이름 입력란에 값이 있고, 전화번호 입력란의 길이가 11자리 숫자인지 확인
        certificationButton.disabled = !nameInput.value.trim() || !(phoneInput.value.length === 11 && /^\d+$/.test(phoneInput.value));
    }
    
    function sendVerificationRequest() {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/api/sendSMS', true); // 서버의 적절한 URL로 설정해야 합니다.
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.onreadystatechange = function() {
            if(xhr.readyState == 4 && xhr.status == 200) {
                // 요청 성공 시 처리할 코드
                console.log(xhr.responseText);
            }
        };
        var data = JSON.stringify({name: nameInput.value, phone: phoneInput.value});
        xhr.send(data);
    }

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
 <input type="text" id="checkNumber" name="checkNumber" class="gray-text" placeholder="5자리 숫자를 입력하세요." required />
 <h2>아이디 찾기 결과</h2>
<% String findId = (String) request.getAttribute("findId"); %>
<% if (findId != null) { %>
    <p>찾은 아이디: <%= findId %></p>
<% } else { %>
    <p>아이디를 찾을 수 없습니다.</p>
<% } %>
</body>
</html>