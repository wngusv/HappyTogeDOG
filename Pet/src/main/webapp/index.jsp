<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>메인페이지</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        .full-screen-bg {
            width: 100vw;
            height: 100vh; /* 뷰포트의 전체 높이 */
            top: 120px;
            position: relative;
            background-image: url('/images/메인최종.png');
            background-position: center; /* 이미지를 가운데 정렬 */
            background-repeat: no-repeat; /* 이미지 반복 방지 */
            background-size: contain; /* 이미지를 가로, 세로 비율에 맞게 조정 */
            overflow-y: auto; /* 세로 스크롤만 허용 */
            overflow-x: hidden; /* 가로 스크롤 없애기 */
        }

        footer {
            position: fixed;
            width: 100vw;
            background-color: #f8f9fa; /* Footer의 배경색 */
            padding: 20px 0; /* 상하 좌우 padding 설정 */
            text-align: center; /* 텍스트를 중앙으로 정렬 */
        }
    </style>
</head>
<body style="background-color: #FFEFD5;">
    <header>
        <% request.setAttribute("pageTitle", "메인페이지"); %>
        <jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
    </header>

    <div class="full-screen-bg"></div>

    <footer>
        <div class="container">
            <p>&copy; 2024 pet. All rights reserved.</p>
        </div>
    </footer>
    <script src="forIndex.js" defer></script>
</body>
</html>
