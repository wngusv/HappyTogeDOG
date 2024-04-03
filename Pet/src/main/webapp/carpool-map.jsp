<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
    <title>��� ���� ������ �� �׸���</title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4948263d9bbfca4b09376e303d5e533"></script>
</head>
<body>
    <div id="map" style="width: 800px; height: 800px;"></div>
    <button onclick="getCarDirection()">��� ��������</button>
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
            // ȣ������ URL�� �Է��մϴ�.
            const url = 'https://apis-navi.kakaomobility.com/v1/directions';

           // �����(origin), ������(destination)�� ��ǥ�� ���ڿ��� ��ȯ�մϴ�.
            const origin = `${pointObj.startPoint.lng},${pointObj.startPoint.lat}`; 
            const destination = `${pointObj.endPoint.lng},${pointObj.endPoint.lat}`;
            
            // ��û ����� �߰��մϴ�.
            const headers = {
              Authorization: `KakaoAK ${REST_API_KEY}`,
              'Content-Type': 'application/json'
            };
          
            // ǥ3�� ��û �Ķ���Ϳ� �ʼ����� �����ݴϴ�.
            const queryParams = new URLSearchParams({
              origin: origin,
              destination: destination
            });
            
            const requestUrl = `${url}?${queryParams}`; // �Ķ���ͱ��� ���Ե� ��ü URL

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
