<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/floating-banner.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
/* Add any additional styles here */
#preview {
	max-width: 200px;
	max-height: 200px;
}
</style>
</head>
<script>
	// < 업로드용 폼 화면 > 
	function validateForm(form) {
		if (form.title.value == "") {
			alert("제목을 입력하세요")
			form.title.focus();
			return false;
		}
	}
</script>
<body>
	<form name="writeForm" method="post" enctype="multipart/form-data"
		action="/UploadProcess.do" onsubmit="return validateForm(this);">
		<!-- 파일을 업로드하기 위해 enctype을 multipart/form-data로 설정 -->
		<table border="1" width=500>
			<tr>
				<th colspan="2">글쓰기</th>
			</tr>
			<tr>

				<td width=50><select name="category">
						<option value="소통">소통</option>
						<option value="긴급">긴급</option>
						<option value="후기">후기</option>
				</select></td>
				<td><input type="text" name="title" placeholder="제목을 입력하세요."
					maxlength="20" style="width: 100%"></td>
			</tr>

			<tr>
				<td colspan="2" height=400><textarea name="content"
						placeholder="내용을 입력하세요." style="width: 100%; height: 100%"></textarea>
				</td>
			</tr>
			<div class="form-group">
				<tr>
					<td>첨부 파일</td>
					<td><input type="file" class="form-control-file" name="oFile"
						accept="image/*" onchange="previewImage(this);" /> <img
						id="preview" src="#" alt="사진 미리보기" style="display: none;"></td>
				</tr>
			</div>
			<tr>
				<td colspan="2" align=right><c:choose>
						<c:when test="${sessionScope.userId != null}">
							<input type="submit" value="글쓰기">
						</c:when>

						<c:otherwise>
							<input type="button" value="글쓰기"
								onclick="alert('로그인 후 이용해주세요.'); location.href='login.jsp'">
						</c:otherwise>
					</c:choose> <input type="button" value="목록으로"
					onclick="location.href='board.jsp';"></td>
			</tr>
		</table>
	</form>
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
	</script>
</body>
</body>
</html>