<%@page import="LocalStrays.Animal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Animal Details</title>
<style>
/* 스타일링을 추가해도 됩니다. */
.animal-details {
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 20px;
	margin: 10px;
	text-align: center; /* 가운데 정렬 */
	margin: 0 auto; /* 수평 가운데 정렬 */
	width: 50%; /* 내용의 너비를 설정합니다. */
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4948263d9bbfca4b09376e303d5e533"></script>
</head>
<body>
	<div class="animal-details">
		<h2>동물 상세 정보</h2>
		<%
		Animal animal = (Animal) request.getAttribute("animal");
		%>
		<img src="<%=animal.getPopfile()%>" alt="동물 이미지">
		<p>
			<strong>Desertion No:</strong>
			<%=animal.getDesertionNo()%></p>
		<p>
			<strong>Happen Date:</strong>
			<%=animal.getHappenDt()%></p>
		<p>
			<strong>Happen Place:</strong>
			<%=animal.getHappenPlace()%></p>
		<p>
			<strong>Kind Code:</strong>
			<%=animal.getKindCd()%></p>
		<p>
			<strong>Color Code:</strong>
			<%=animal.getColorCd()%></p>
		<p>
			<strong>Age:</strong>
			<%=animal.getAge()%></p>
		<p>
			<strong>Weight:</strong>
			<%=animal.getWeight()%></p>
		<p>
			<strong>Notice No:</strong>
			<%=animal.getNoticeNo()%></p>
		<p>
			<strong>Notice Start Date:</strong>
			<%=animal.getNoticeSdt()%></p>
		<p>
			<strong>Notice End Date:</strong>
			<%=animal.getNoticeEdt()%></p>
		<p>
			<strong>Process State:</strong>
			<%=animal.getProcessState()%></p>
		<p>
			<strong>Sex Code:</strong>
			<%=animal.getSexCd()%></p>
		<p>
			<strong>Neuter YN:</strong>
			<%=animal.getNeuterYn()%></p>
		<p>
			<strong>Special Mark:</strong>
			<%=animal.getSpecialMark()%></p>
		<p>
			<strong>Care Name:</strong>
			<%=animal.getCareNm()%></p>
		<p>
			<strong>Care Tel:</strong>
			<%=animal.getCareTel()%></p>
		<div id="map" style="width: 500px; height: 400px;"></div>
		<p id="careAddress"><%=animal.getCareAddr()%>
			<%=animal.getCareAddr().replaceAll("\\([^)]*\\)", "")%>
		</p>

		<!-- 주소를 감추고 JavaScript에서 사용하기 위해 추가 -->
		<p>
		<p>
			<strong>Org Name:</strong>
			<%=animal.getOrgNm()%></p>
		<p>
			<strong>Charge Name:</strong>
			<%=animal.getChargeNm()%></p>
		<p>
			<strong>Office Tel:</strong>
			<%=animal.getOfficetel()%></p>
	</div>
	<%-- 	<%=animal.getCareAddr()%> --%>
	<script>
    var mapContainer = document.getElementById('map');
    var address = '<%=animal.getCareAddr().replaceAll("\\([^)]*\\)", "").trim().replace("'", "\\'")%>
		';

		// 주소를 좌표로 변환하는 함수
		var geocoder = new kakao.maps.services.Geocoder();
		geocoder.addressSearch(address, function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				// 지도 초기화
				var map = new kakao.maps.Map(mapContainer, {
					center : coords,
					level : 3
				});

				// 마커 생성 및 추가
				var marker = new kakao.maps.Marker({
					position : coords
				});
				marker.setMap(map);
			}
		});
	</script>
</body>

</html>
