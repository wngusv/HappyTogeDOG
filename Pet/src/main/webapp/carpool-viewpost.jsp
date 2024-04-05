<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="carpool.Post"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카풀 게시글</title>
<script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4948263d9bbfca4b09376e303d5e533&libraries=services"></script>
<style>
#map {
    width: 30%;
    height: 400px;
}
</style>
</head>
<body>

    <%
    Post post = (Post) request.getAttribute("selectedPost");
    %>
    <%
    if (post != null) {
    %>
    <!-- 게시물의 내용을 표시합니다. -->
    <div id="postContent"><%=post.getContent()%></div>
    
    <div id="map"></div>

<script>
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

    // 시작점 마커 생성 및 지도에 표시
    var startMarker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(mapState.startPoint.lat, mapState.startPoint.lng), // 시작점 위치
        map: map // 지도 객체
    });

    // 종료점 마커 생성 및 지도에 표시
    var endMarker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(mapState.endPoint.lat, mapState.endPoint.lng), // 종료점 위치
        map: map // 지도 객체
    });
}

// 페이지 로드 완료 시 지도 초기화 함수 호출
window.onload = initMap;
</script>

    <%
    } else {
    %>
    <p>게시물 정보를 불러오는 데 실패했습니다.</p>
    <%
    }
    %>

</body>
</html>
