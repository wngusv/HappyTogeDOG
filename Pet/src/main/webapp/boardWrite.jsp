<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        #preview {
            max-width: 200px;
            max-height: 200px;
            margin-top: 10px;
        }
          .btn-primary {
        background-color: rgb(111, 94, 75); /* 배경색 변경 */
        border-color: transparent; /* 버튼 테두리 색상 */
    color: white; /* 텍스트 색상 변경 */
    }
    .btn-primary:hover {
   background-color: rgb(149, 204, 143); /* 버튼 배경색 */
	border-color: transparent; /* 버튼 테두리 색상 */
	color: black; /* 버튼 내 텍스트 색상 */
}
    </style>
</head>
<body style="background-color: rgb(254, 247, 222);">
    <div class="container mt-5">
        <h2 class="mb-4"><img src="/images/게시판글쓰기.png">자유게시판 글쓰기</h2>
        <form name="writeForm" method="post" enctype="multipart/form-data" action="/UploadProcess.do" onsubmit="return validateForm(this);" class="needs-validation" novalidate>
            <div class="form-group">
                <label for="categorySelect">카테고리</label>
                <select name="category" id="categorySelect" class="form-control">
                    <option value="소통">소통</option>
                    <option value="긴급">긴급</option>
                    <option value="후기">후기</option>
                </select>
            </div>
            <div class="form-group">
                <label for="titleInput">제목</label>
                <input type="text" name="title" id="titleInput" class="form-control" placeholder="제목을 입력하세요." maxlength="80" required>
                <div class="invalid-feedback">제목을 입력해주세요.</div>
            </div>
            <div class="form-group">
                <label for="contentTextarea">내용</label>
                <textarea name="content" id="contentTextarea" class="form-control" placeholder="내용을 입력하세요." style="height: 200px;" required></textarea>
                <div class="invalid-feedback">내용을 입력해주세요.</div>
            </div>
            <div class="form-group">
                <label for="fileInput">첨부 파일</label>
                <input type="file" class="form-control-file" id="fileInput" name="oFile" accept="image/*" onchange="previewImage(this);" />
                <img id="preview" src="#" alt="사진 미리보기" style="display: none;">
            </div>
            <div class="form-group text-right">
                <c:choose>
                    <c:when test="${sessionScope.userId != null}">
                        <input type="submit" value="등록" class="btn btn-primary">
                    </c:when>
                    <c:otherwise>
                        <input type="button" value="등록" class="btn btn-secondary" onclick="alert('로그인 후 이용해주세요.'); location.href='login.jsp'">
                    </c:otherwise>
                </c:choose>
                <input type="button" value="목록으로" class="btn btn-outline-secondary" onclick="location.href='board.jsp';">
            </div>
        </form>
    </div>
    <script>
        function validateForm(form) {
            if (form.title.value == "") {
                alert("제목을 입력하세요")
                form.title.focus();
                return false;
            }
        }

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
    </script>
    <!-- Bootstrap JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
