<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=5dukvke42l"></script>
</head>
<body>
	<div id="map" style="width: 100%; height: 300px;"></div>


    <script>
        var mapOptions = {
            center : new naver.maps.LatLng(37.5666102, 126.9783881), // 기본 지도 중심 좌표 (서울시청)
            zoom : 10
        };

        var map = new naver.maps.Map('map', mapOptions);

        // 출발지와 목적지 좌표 설정
        var startLatLng = new naver.maps.LatLng(37.5666102, 126.9783881); // 서울시청
        var endLatLng = new naver.maps.LatLng(37.5666102, 127.027625); // 강남역

        // 출발지, 목적지 마커 생성
        var startMarker = new naver.maps.Marker({
            position: startLatLng,
            map: map
        });

        var endMarker = new naver.maps.Marker({
            position: endLatLng,
            map: map
        });

        // 도로 경로 검색 서비스 객체 생성
        var service = new naver.maps.Service();

        // 출발지에서 목적지까지 도로 경로 검색 요청
        service.route({
            start: startLatLng,
            goal: endLatLng,
            useCar: true // 자동차 경로 검색
        }, function(response, status) {
            if (status === naver.maps.Service.Status.SUCCESS) {
                // 경로 데이터를 받아와서 지도에 표시
                var path = response.result.path;
                var routePath = [];
                for (var i = 0; i < path.length; i++) {
                    routePath.push(new naver.maps.LatLng(path[i].y, path[i].x));
                }
                var routePolyline = new naver.maps.Polyline({
                    map: map,
                    path: routePath,
                    strokeColor: '#FF0000',
                    strokeWeight: 3
                });
            } else {
                alert('도로 경로를 찾을 수 없습니다.');
            }
        });
    </script>



</body>
</html>