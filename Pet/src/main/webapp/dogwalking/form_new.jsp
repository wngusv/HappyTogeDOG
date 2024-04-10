<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,Util.MyWebContextListener,dao.UserDAO,SignIn.User"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>산책 아르바이트 공고</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        /* Add any additional styles here */
        #preview {
            max-width: 200px;
            max-height: 200px;
        }
    </style>
</head>
<body style="background-color: rgb(254, 247, 222);">
<%
    String userId = (String)session.getAttribute("userId");
    User user = null;
    if(userId != null) {
        user = UserDAO.getUserById(userId);
    }
%>
<div class="container mt-5">
    <h1 class="mb-4">반려견 산책 아르바이트 공고</h1>
    <form method="post" action="form_send.jsp" enctype="multipart/form-data">
        <div class="form-group">
            <label for="title">제목:</label>
            <input type="text" class="form-control" id="title" placeholder="제목" name="title" maxlength="20" value="">
        </div>
        <div class="form-group">
            <label for="dogSize">견종(크기):</label>
            <select class="form-control" id="dogSize" name="dogSize">
                <option value="소형견(7kg이하)">소형견(7kg이하)</option>
                <option value="중형견(8kg이상)">중형견(8kg이상)</option>
                <option value="대형견(16kg이상)">대형견(16kg이상)</option>
                <option value="초대형견(45kg이상)">초대형견(45kg이상)</option>
            </select>
        </div>
        <div class="form-group">
            <label for="day">요일:</label>
            <select class="form-control" id="day" name="day">
                <option value="평일">평일</option>
                <option value="주말">주말</option>
            </select>
        </div>
        <div class="form-group">
            <label for="time">시간:</label>
            <select class="form-control" id="time" name="time">
                <option value="오전">오전</option>
                <option value="오후">오후</option>
            </select>
        </div>
        <div class="form-group">
            <label for="pickupLocation">픽업위치:</label><br>
            <button type="button" class="btn btn-primary mb-2" onclick="sample6_execDaumPostcode()" style="background-color: rgb(88, 184, 117); border-color: rgb(88, 184, 117);">우편번호 찾기</button><br>
            <input type="text" class="form-control mb-2" id="sample6_address" placeholder="주소" value="<%= user != null ? user.getAddress() : "" %>" name="sample6_address" readonly>
            <input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소" value="<%= user != null ? user.getAddress_detail() : "" %>" name="sample6_detailAddress">
        </div>
        <div class="form-group">
            <label for="pay">시급:</label>
            <input type="number" class="form-control" id="pay" placeholder="시급" name="pay">
        </div>
        <div class="form-group">
            <label for="introduction">소개글:</label>
            <textarea class="form-control" id="introduction"
            placeholder="반려견의 이름, 성격 등을 최대한 자세히 소개 해주세요. 원하는 근무 요일과 시간을 명확히 작성해주세요." name="introduction" maxlength="2048" style="height:150px;"></textarea>
        </div>
<div class="form-group">
    <label for="dogPhoto">강아지 사진 (최대 5개까지):<small class="form-text text-muted">이미지 파일만(jpg, png) 첨부 가능합니다. (각 파일 2MB 이하)</small></label><br>
    <input type="file" name="dogPhoto1" accept="image/*" multiple onchange="previewImage(this, 'preview1');"><br>
    <div id="preview1" style="display: none;"></div>
    <input type="file" name="dogPhoto2" accept="image/*" multiple onchange="previewImage(this, 'preview2');"><br>
    <div id="preview2" style="display: none;"></div>
    <input type="file" name="dogPhoto3" accept="image/*" multiple onchange="previewImage(this, 'preview3');"><br>
    <div id="preview3" style="display: none;"></div>
    <input type="file" name="dogPhoto4" accept="image/*" multiple onchange="previewImage(this, 'preview4');"><br>
    <div id="preview4" style="display: none;"></div>
    <input type="file" name="dogPhoto5" accept="image/*" multiple onchange="previewImage(this, 'preview5');"><br>
    <div id="preview5" style="display: none;"></div>
    
</div>
        <hr>
        <button type="submit" class="btn btn-primary" style="background-color: rgb(235, 111, 98); color: white; border-color: rgb(235, 111, 98);">등록하기</button>
    </form>
</div>
<script>
function previewImage(input, previewId) {
    var preview = document.getElementById(previewId);
    while (preview.firstChild) {
        preview.removeChild(preview.firstChild);
    }
    
    Array.from(input.files).slice(0, 5).forEach(function(file) {
        if (file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                var img = document.createElement('img');
                img.src = e.target.result;
                img.style.maxWidth = '200px';
                img.style.maxHeight = '200px';
                img.style.marginRight = '10px';
                preview.appendChild(img);
            }
            reader.readAsDataURL(file);
        }
    });
    preview.style.display = 'block';
}



    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.userSelectedType === 'R' ? data.roadAddress : data.jibunAddress;
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById('sample6_address').value = addr;
                document.getElementById('sample6_detailAddress').focus();
            }
        }).open();
    }
</script>
</body>
</html>
