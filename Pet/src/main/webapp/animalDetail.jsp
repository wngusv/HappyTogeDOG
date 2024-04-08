<%@page import="LocalStrays.Animal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
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
#img{
	width: 90%;
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4948263d9bbfca4b09376e303d5e533&libraries=services"></script>
</head>
<body>
	<div class="animal-details">
		<h2>동물 상세 정보</h2>
		<%
		Animal animal = (Animal) request.getAttribute("animal");
		%>
		<img id= "img" src="<%=animal.getPopfile()%>" alt="동물 이미지" />
				<p>
			<strong>유기번호:</strong>
			<%=animal.getDesertionNo()%>
		</p>
		<p>
			<strong>발견일:</strong>
			<%=animal.getHappenDt()%>
		</p>
		<p>
			<strong>발견장소:</strong>
			<%=animal.getHappenPlace()%>
		</p>
		<p>
			<strong>종류 코드:</strong>
			<%=animal.getKindCd()%>
		</p>
		<p>
			<strong>색상 코드:</strong>
			<%=animal.getColorCd()%>
		</p>
		<p>
			<strong>나이:</strong>
			<%=animal.getAge()%>
		</p>
		<p>
			<strong>무게:</strong>
			<%=animal.getWeight()%>
		</p>
		<p>
			<strong>공고번호:</strong>
			<%=animal.getNoticeNo()%>
		</p>
		<p>
			<strong>공고시작일:</strong>
			<%=animal.getNoticeSdt()%>
		</p>
		<p>
			<strong>공고종료일:</strong>
			<%=animal.getNoticeEdt()%>
		</p>
		<p>
			<strong>처리상태:</strong>
			<%=animal.getProcessState()%>
		</p>
		<p>
			<strong>성별 코드:</strong>
			<%=animal.getSexCd()%>
		</p>
		<p>
			<strong>중성화 여부:</strong>
			<%=animal.getNeuterYn()%>
		</p>
		<p>
			<strong>특이사항:</strong>
			<%=animal.getSpecialMark()%>
		</p>
		<p>
			<strong>보호소명:</strong>
			<%=animal.getCareNm()%>
		</p>
		<p>
			<strong>보호소 연락처:</strong>
			<%=animal.getCareTel()%>
			<%
			String careFacilityAddress = animal.getCareAddr().replaceAll("\\([^)]*\\)", "");
			%>
		</p>
		<p id="careAddress" hidden="true"><%=careFacilityAddress%></p>

		<div id="map" style="width: 100%; height: 350px"></div>

		<p>
			<strong>기관명:</strong>
			<%=animal.getOrgNm()%>
		</p>
		<p>
			<strong>담당자명:</strong>
			<%=animal.getChargeNm()%>
		</p>
		<p>
			<strong>사무실 연락처:</strong>
			<%=animal.getOfficetel()%>
		</p>
	</div>
	<!-- <%=animal.getCareAddr()%> -->
	<script>
		var address = document.getElementById("careAddress").innerText;
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		var mapContainer = document.getElementById("map"), // 지도를 표시할 div
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3, // 지도의 확대 레벨
		};

		// 지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 키워드로 장소를 검색합니다
		ps.keywordSearch(address, placesSearchCB);
			

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new kakao.maps.LatLngBounds();

				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]);
					bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				}

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
			// 마커를 생성하고 지도에 표시합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(place.y, place.x),
			});

			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, "click", function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow
						.setContent('<div style="padding:5px;font-size:12px;">'
								+ place.place_name + "</div>");
				infowindow.open(map, marker);
			});
		}
		 kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	            // 클릭한 위치의 좌표를 얻어옵니다

	            // 카카오지도에서 해당 좌표를 보여주는 링크
	            var kakaoMapUrl = 'https://map.kakao.com/link/search/' +address;

	            // 새 창을 열어 해당 링크로 이동
	            window.open(kakaoMapUrl);
	        });
	</script>
</body>
</html>
