<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>경로 따라 지도에 선 그리기</title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4948263d9bbfca4b09376e303d5e533"></script>
</head>
<body>
    <div id="map" style="width: 800px; height: 800px;"></div>
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
            const REST_API_KEY = '34e2bb850a0e53f95ba5999f444deded';
            const url = 'https://apis-navi.kakaomobility.com/v1/directions';
            const origin = `${pointObj.startPoint.lng},${pointObj.startPoint.lat}`; 
            const destination = `${pointObj.endPoint.lng},${pointObj.endPoint.lat}`;
            
            const headers = {
              Authorization: `KakaoAK ${REST_API_KEY}`,
              'Content-Type': 'application/json'
            };
            const queryParams = new URLSearchParams({
              origin: origin,
              destination: destination
            });
            const requestUrl = `${url}?${queryParams}`;
            let data;

            try {
              const response = await fetch(requestUrl, { method: 'GET', headers: headers });
              if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`);
              data = await response.json();
            } catch (error) {
              console.error('Error:', error);
              return; // Early exit on error
            }

            // Using the received data to draw a polyline
            const linePath = data.routes[0].sections.map(section => 
                section.vertexes.filter((_, index) => index % 2 === 0)
                .map((vertex, index, arr) => new kakao.maps.LatLng(arr[index + 1], vertex))
            ).flat();

            var polyline = new kakao.maps.Polyline({
              path: linePath,
              strokeWeight: 5,
              strokeColor: '#000000',
              strokeOpacity: 0.7,
              strokeStyle: 'solid'
            }); 
            polyline.setMap(map);
        }

        getCarDirection();
    </script>
</body>
</html>
