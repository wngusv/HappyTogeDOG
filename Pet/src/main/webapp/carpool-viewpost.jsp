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
	width: 100%;
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
// 주의: post.getMapState() 메서드의 반환값이 JSON 문자열 형태이어야 합니다.
var mapState = JSON.parse('<%=post.getMapstate()%>');

		function initMap() {
			var mapContainer = document.getElementById('map'), mapOption = {
				center : new kakao.maps.LatLng(mapState.center.lat,
						mapState.center.lng),
				level : mapState.level
			};

			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 경로 표시
			var linePath = mapState.pathData.map(function(point) {
				return new kakao.maps.LatLng(point.lat, point.lng);
			});

			var polyline = new kakao.maps.Polyline({
				path : linePath,
				strokeWeight : 5,
				strokeColor : '#FFAE00',
				strokeOpacity : 0.7,
				strokeStyle : 'solid'
			});

			polyline.setMap(map);

			// 마커 표시 (경로의 시작과 끝점)
			var startMarker = new kakao.maps.Marker({
				position : linePath[0],
				map : map
			});

			var endMarker = new kakao.maps.Marker({
				position : linePath[linePath.length - 1],
				map : map
			});
		}

		// 페이지 로드 완료 시 지도 초기화
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
