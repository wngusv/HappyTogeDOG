<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>경로 따라 지도에 선 그리기</title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4948263d9bbfca4b09376e303d5e533&libraries=services"></script>
</head>
<body>
    <div id="map" style="width: 200px; height: 200px;"></div>
    <button onclick="getCarDirection()">경로 가져오기</button>
    <script>
        var mapContainer = document.getElementById('map'),
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667),
                level: 3
            };  

        var map = new kakao.maps.Map(mapContainer, mapOption);

        function getCarDirection() {
            var startPoint = {
                lat: 37.566610,
                lng: 126.978388
            };
            var endPoint = {
                lat: 37.570169,
                lng: 126.997940
            };

            // 시작점과 끝점에 마커를 표시
            var startMarker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(startPoint.lat, startPoint.lng),
                map: map
            });

            var endMarker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(endPoint.lat, endPoint.lng),
                map: map
            });

            var REST_API_KEY = '338d403a243e055727945750ef6920a1';
            var url = 'https://apis-navi.kakaomobility.com/v1/directions?origin=' + startPoint.lng + ',' + startPoint.lat + '&destination=' + endPoint.lng + ',' + endPoint.lat;

            fetch(url, {
                method: 'GET',
                headers: {
                    Authorization: 'KakaoAK ' + REST_API_KEY
                }
            })
            .then(response => response.json())
            .then(data => {
                var paths = [];
                data.routes[0].sections.forEach(section => {
                    section.roads.forEach(road => {
                        for (var i = 0; i < road.vertexes.length; i += 2) {
                            paths.push(new kakao.maps.LatLng(road.vertexes[i+1], road.vertexes[i]));
                        }
                    });
                });

                // 지도에 표시할 선을 생성합니다
                var polyline = new kakao.maps.Polyline({
                    path: paths,
                    strokeWeight: 5, // 선의 두께 입니다
                    strokeColor: '#f50057', // 선의 색깔입니다
                    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                    strokeStyle: 'solid' // 선의 스타일입니다
                });

                // 지도에 선을 표시합니다 
                polyline.setMap(map);
            })
            .catch(error => console.error('Error:', error));
        }
    </script>
</body>
</html>
