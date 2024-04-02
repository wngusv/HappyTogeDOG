<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
</head>
<body>
    <table border="1" width=500>
        <tr>
            <th colspan="2">
                 글쓰기
            </th>
        </tr>
        <tr>
            <td width=50>
                <select>
                    <option>소통</option>
                    <option>실종</option>
                </select>
            </td>
            <td >
                <input type="text" placeholder="제목을 입력하세요."
                maxlength=20
                style="width:100%" >
            </td>
        </tr>
        <tr>
            <td colspan="2" height=400>
                <textarea placeholder="내용을 입력하세요." style="width: 100%; height: 100%"></textarea>
            </td>
        </tr>
        <tr>
            <td >첨부 파일</td>
            <td >
                <input type="file" name="file"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align=right>
                <input type="button" value="글쓰기" onclick="location.href='board.jsp';"> <%-- TODO: 디비에 저장시키고 게시판으로 넘어가게 하기 --%>
                <input type="button" value="목록으로" onclick="location.href='board.jsp';">
            </td>
        </tr>
    </table>
</body>
</html>