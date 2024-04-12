<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="CarPool.Post"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>카풀 게시글</title>
    <link rel="stylesheet" href="styles.css">
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4948263d9bbfca4b09376e303d5e533&libraries=services"></script>
    <style>
        body {
            padding-top: 150px;
            background-color: #f7f7f7;
            font-family: 'Malgun Gothic', sans-serif;
        }
        header {
            margin-bottom: 40px;
        }
        .post-container {
            width: 80%;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        #map-container {
            margin-top: 20px;
            text-align: center;
        }
        #map {
            width: 100%;
            height: 400px;
            border-radius: 10px;
			border: 2px solid rgb(111, 94, 75);
        }
        #postTitle, #postUser, #postContent {
            text-align: left;
            margin: 15px 0;
        }
        #postTitle {
            font-size: 24px;
            font-weight: bold;
        }
        #postUser {
            color: #888;
            margin-bottom: 20px;
        }
        #postContent {
            line-height: 1.6;
        }
        .chat-button {
            display: block;
            width: 200px;
            margin: 20px auto;
            text-align: center;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
    </header>
    <div class="post-container">
        <%
        Post post = (Post) request.getAttribute("selectedPost");
        if (post != null) {
        %>
            <div id="postTitle">제목: <%= post.getTitle() %></div>
            <div id="postUser">아이디: <%= post.getUserId() %></div>
            <div id="map-container">
                <div id="map"></div>
            </div>
            <div id="postContent"><%= post.getContent() %></div>
            <a href="#" class="chat-button" onclick="chatWinOpen();">채팅하기</a>
        <%
        } else {
        %>
            <p>게시물 정보를 불러오는 데 실패했습니다.</p>
        <%
        }
        %>
    </div>
    <script>
 // Function to open chat window
    function chatWinOpen() {
        var id = '<%= session.getAttribute("userId") %>'; // Note the single quotes around the JSP expression
        if (id === "null" || id === '') {
            alert("로그인 후 채팅창을 열어주세요.");
            return;
        }
        // If id is available (user logged in), proceed to open the chat window
        window.open("/chat/ChatWindow.jsp?chatId=" + id +"&chatRoom="+"<%=post.getId()%>", "", "width=360,height=500");
    }
    // 서버로부터 받아온 mapState 정보를 JavaScript 객체로 파싱합니다.
    var mapState = JSON.parse('<%=post.getMapstate()%>');

    function initMap() {
        // 지도를 표시할 div와 지도 옵션 설정
        var mapContainer = document.getElementById('map'), 
            mapOption = {
                center: new kakao.maps.LatLng(mapState.center.Ma, mapState.center.La), // 지도의 중심좌표
                level: mapState.level // 지도의 확대 레벨
            };

        // 지도 생성
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 경로를 구성하는 좌표 배열 생성
        var linePath = mapState.pathData.map(function(point) {
            return new kakao.maps.LatLng(point.lat, point.lng);
        });

        // 지도에 경로를 표시하는 폴리라인 생성
        var polyline = new kakao.maps.Polyline({
            path: linePath, // 경로 좌표 배열
            strokeWeight: 5, // 선의 두께
            strokeColor: '#f50057', // 선의 색상
            strokeOpacity: 0.7, // 선의 불투명도
            strokeStyle: 'solid' // 선의 스타일
        });

        // 폴리라인 지도에 표시
        polyline.setMap(map);
       
     // 마커 이미지의 주소와 크기를 정의합니다
        var startImageUrl = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png';
        var endImageUrl = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png';
        var imageSize = new kakao.maps.Size(33, 33); // 마커 이미지의 크기

        // 출발지와 도착지 마커 이미지를 생성합니다
        var startMarkerImage = new kakao.maps.MarkerImage(startImageUrl, imageSize);
        var endMarkerImage = new kakao.maps.MarkerImage(endImageUrl, imageSize);
        
        var startMarker = new kakao.maps.Marker({
            position: new kakao.maps.LatLng(mapState.startPoint.lat, mapState.startPoint.lng), // 시작점 위치
            map: map, // 지도 객체
            image: startMarkerImage
        });

        var endMarker = new kakao.maps.Marker({
            position: new kakao.maps.LatLng(mapState.endPoint.lat, mapState.endPoint.lng), // 종료점 위치
            map: map, // 지도 객체
            image: endMarkerImage
        });
    }

    // 페이지 로드 완료 시 지도 초기화 함수 호출
    window.onload = initMap;
    </script>
</body>
</html>

