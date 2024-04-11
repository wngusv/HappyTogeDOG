<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주소 검색</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">주소 검색</h1>
        <form id="addressForm" action="/mypage/UpdateAddress.jsp" method="post">
            <div class="form-group">
                <input type="text" id="sample6_postcode" name="postcode" class="form-control" placeholder="우편번호" readonly>
                <button type="button" class="btn btn-primary mt-2" onclick="sample6_execDaumPostcode()">주소 찾기</button>
            </div>
            <div class="form-group">
                <input type="text" id="sample6_address" name="address" class="form-control" placeholder="주소" readonly>
            </div>
            <div class="form-group">
                <input type="text" id="sample6_detailAddress" name="detailAddress" class="form-control" placeholder="상세 주소">
            </div>
            <button type="submit" class="btn btn-success">주소 변경</button>
        </form>
    </div>

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
        document.getElementById("addressForm").addEventListener("submit", function(event) {
            var postcode = document.getElementById("sample6_postcode").value;
            var address = document.getElementById("sample6_address").value;
            var detailAddress = document.getElementById("sample6_detailAddress").value;

            if (!postcode || !address || !detailAddress) {
                alert("우편번호, 주소, 상세 주소를 모두 입력해주세요.");
                event.preventDefault(); // 폼 제출 방지
            }
        });
    </script>

    <!-- 부트스트랩 JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
