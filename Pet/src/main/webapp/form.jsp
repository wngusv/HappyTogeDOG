<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산책 알바 구하기</title>
<script>
function previewImage(input) {
    var file = input.files[0];
    if (file) {
        var reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('preview').src = e.target.result;
        }
        reader.readAsDataURL(file);
    }
}
</script>
</head>
<body>
    <h1>산책 알바 구하기 입력폼</h1>
    <form method="post" action="board_new_send.jsp" enctype="multipart/form-data">
        <table>
            <tr>
                <td>제목: <input type="text" placeholder="제목" name="title" maxlength="20" value=""></td>
            </tr>
            <tr>
                <td>견종(크기):
                    <select name="dogSize">
                        <option value="small">소형견(7kg이하)</option>
                        <option value="medium">중형견(8kg이상)</option>
                        <option value="large">대형견(16kg이상)</option>
                        <option value="xlarge">초대형견(45kg이상)</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>요일:
                    <select name="day">
                        <option value="weekday">평일</option>
                        <option value="weekend">주말</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>시간:
                    <select name="time">
                        <option value="morning">오전</option>
                        <option value="afternoon">오후</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>픽업위치: <input type="text" placeholder="픽업위치" name="pickupLocation"></td>
            </tr>
            <tr>
                <td>시급: <input type="number" placeholder="시급" name="hourlyRate"></td>
            </tr>
            <tr>
                <td>소개글: <textarea placeholder="소개글" name="introduction" maxlength="2048" style="height:150px;"></textarea></td>
            </tr>
            <tr>
                <td>강아지 사진: <input type="file" name="dogPhoto" onchange="previewImage(this);"></td>
            </tr>
            <tr>
                <td><img id="preview" src="#" alt="사진 미리보기" style="display:none; max-width: 200px; max-height: 200px;"></td>
            </tr>
        </table>
        <hr>
        <input type="submit" value="등록하기">
    </form>
    <script>
        // 이미지 미리보기를 위한 스크립트
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
</html>
