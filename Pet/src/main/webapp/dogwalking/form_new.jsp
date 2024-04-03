<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,Util.MyWebContextListener,dao.UserDAO,SignIn.User"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>산책 알바 구하기</title>
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
<body>
<%
    String userId = (String)session.getAttribute("userId");
    User user = null;
    if(userId != null) {
        user = UserDAO.getUserById(userId);
    }
%>
<div class="container mt-5">
    <h1 class="mb-4">산책 알바 구하기 입력폼</h1>
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
            <input type="text" class="form-control mb-2" id="sample6_postcode" placeholder="우편번호">
            <button type="button" class="btn btn-primary mb-2" onclick="sample6_execDaumPostcode()">우편번호 찾기</button><br>
            <input type="text" class="form-control mb-2" id="sample6_address" placeholder="주소" value="<%= user != null ? user.getAddress() : "" %>" name="sample6_address" readonly>
            <input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소" value="<%= user != null ? user.getAddress_detail() : "" %>" name="sample6_detailAddress">
        </div>
        <div class="form-group">
            <label for="pay">시급:</label>
            <input type="number" class="form-control" id="pay" placeholder="시급" name="pay">
        </div>
        <div class="form-group">
            <label for="introduction">소개글:</label>
            <textarea class="form-control" id="introduction" placeholder="소개글" name="introduction" maxlength="2048" style="height:150px;"></textarea>
        </div>
        <div class="form-group">
            <label for="dogPhoto">강아지 사진:</label>
            <input type="file" class="form-control-file" id="dogPhoto" name="dogPhoto" accept="image/*" onchange="previewImage(this);">
            <small class="form-text text-muted">이미지 파일만(jpg, png) 첨부 가능합니다. (각 파일 2MB 이하)</small>
            <img id="preview" src="#" alt="사진 미리보기" style="display:none;">
        </div>
        <hr>
        <button type="submit" class="btn btn-primary">등록하기</button>
    </form>
</div>
<script>
    function previewImage(input) {
        var file = input.files[0];
        if (file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                var preview = document.getElementById('preview');
                preview.src = e.target.result;
                preview.style.display = 'block';
            }
            reader.readAsDataURL(file);
        }
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
