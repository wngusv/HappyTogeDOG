<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주소 검색</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <h1>주소 검색</h1>
  <form action="/mypage/UpdateAddress.jsp" method="post">
    <div>
        <input type="text" id="sample6_postcode" name="postcode" placeholder="우편번호">
        <button type="button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
    </div>
    <div>
        <input type="text" id="sample6_address" name="address" placeholder="주소">
    </div>
    <div>
        <input type="text" id="sample6_detailAddress" name="detailAddress" placeholder="상세 주소">
    </div>
    <button type="submit">주소 변경</button>
</form>

       
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = '';
                    if (data.userSelectedType === 'R') {
                        addr = data.roadAddress;
                    } else {
                        addr = data.jibunAddress;
                    }
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>
</body>
</html>