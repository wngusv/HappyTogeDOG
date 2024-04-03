<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
    <title>경로 따라 지도에 선 그리기</title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4948263d9bbfca4b09376e303d5e533"></script>
</head>
<body>
    <div id="map" style="width: 800px; height: 800px;"></div>
    <button onclick="getCarDirection()">경로 가져오기</button>
    <script>
        var mapContainer = document.getElementById('map'),
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667),
            level: 3
        };
        var map = new kakao.maps.Map(mapContainer, mapOption);
        var pointObj = {
            startPoint: {lng: 126.978388, lat: 37.566610},
            endPoint: {lng: 126.997940, lat: 37.570169}
        };

        async function getCarDirection() {
            const REST_API_KEY = '338d403a243e055727945750ef6920a1';
            // 호출방식의 URL을 입력합니다.
            const url = 'https://apis-navi.kakaomobility.com/v1/directions';

           // 출발지(origin), 목적지(destination)의 좌표를 문자열로 변환합니다.
            const origin = `${pointObj.startPoint.lng},${pointObj.startPoint.lat}`; 
            const destination = `${pointObj.endPoint.lng},${pointObj.endPoint.lat}`;
            
            // 요청 헤더를 추가합니다.
            const headers = {
              Authorization: `KakaoAK ${REST_API_KEY}`,
              'Content-Type': 'application/json'
            };
          
            // 표3의 요청 파라미터에 필수값을 적어줍니다.
            const queryParams = new URLSearchParams({
              origin: origin,
              destination: destination
            });
            
            const requestUrl = `${url}?${queryParams}`; // 파라미터까지 포함된 전체 URL

            try {
              const response = await fetch(requestUrl, {
                method: 'GET',
                headers: headers
              });

              if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
              }

              const data = await response.json();
              
              console.log(data)
            } catch (error) {
              console.error('Error:', error);
            }
          }
    </script>
</body>
</html>

</body>
</html>
