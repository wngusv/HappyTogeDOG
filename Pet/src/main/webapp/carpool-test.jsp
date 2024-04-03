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
            center : new naver.maps.LatLng(37.5666102, 126.9783881), // �⺻ ���� �߽� ��ǥ (�����û)
            zoom : 10
        };

        var map = new naver.maps.Map('map', mapOptions);

        // ������� ������ ��ǥ ����
        var startLatLng = new naver.maps.LatLng(37.5666102, 126.9783881); // �����û
        var endLatLng = new naver.maps.LatLng(37.5666102, 127.027625); // ������

        // �����, ������ ��Ŀ ����
        var startMarker = new naver.maps.Marker({
            position: startLatLng,
            map: map
        });

        var endMarker = new naver.maps.Marker({
            position: endLatLng,
            map: map
        });

        // ���� ��� �˻� ���� ��ü ����
        var service = new naver.maps.Service();

        // ��������� ���������� ���� ��� �˻� ��û
        service.route({
            start: startLatLng,
            goal: endLatLng,
            useCar: true // �ڵ��� ��� �˻�
        }, function(response, status) {
            if (status === naver.maps.Service.Status.SUCCESS) {
                // ��� �����͸� �޾ƿͼ� ������ ǥ��
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
                alert('���� ��θ� ã�� �� �����ϴ�.');
            }
        });
    </script>



</body>
</html>