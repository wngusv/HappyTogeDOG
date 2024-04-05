<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역 반려동물 시설</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 600px; /* 수정된 높이 */
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: auto;
	padding: 6px 10px;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

.wrap {
	position: relative;
	border-radius: 5px;
	border: 1px solid #ccc;
	background-color: #fff;
	padding: 10px;
	box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.1);
}

.info {
	padding: 10px;
}

.title {
	margin-bottom: 5px;
	font-size: 18px;
	font-weight: bold;
}

.close {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	padding: 2px 5px;
	border: 1px solid #aaa;
	border-radius: 3px;
	background-color: #fff;
}

.body {
	font-size: 14px;
}

.desc {
	margin-top: 10px;
}

.ellipsis {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.link {
	color: #007bff;
	text-decoration: none;
}
</style>
</head>
<body style="padding-top: 150px;">
	<header>
		<%
		request.setAttribute("pageTitle", "반려동물 시설");
		%>
		<jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>

	</header>

	<main>
		<div class="container">
			<section class="strays-info">
				<h2>지역 반려동물 시설</h2>
			</section>
		</div>
		<div class="container"> <!-- Bootstrap 그리드 시스템 사용 -->
			<div class="row justify-content-center"> <!-- 가운데 정렬 -->
				<div class="col-lg-8"> <!-- 큰 화면에서 너비를 8만큼 설정 -->
					<div class="map_wrap">
						<div id="map" style="width: 100%; height: 500px; position: relative; overflow: hidden;"></div> <!-- 수정된 높이 -->
						<ul id="category">
							<li id="동물병원">동물병원</li>
							<li id="애견용품">애견용품</li>
							<li id="애견유치원">애견유치원</li>
							<li id="애견카페">애견카페</li>
							<li id="애견장례식장">애견장례식장</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</main>

	<footer>
		<div class="container">
			<p>&copy; 2024 Pet. 모든 권리 보유.</p>
		</div>
	</footer>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4948263d9bbfca4b09376e303d5e533&libraries=services"></script>
	<script>
		var map;
		var ps = new kakao.maps.services.Places();
		var markers = [];

		function addCategoryClickEvent() {
			var category = document.getElementById('category');
			var children = category.children;
			for (var i = 0; i < children.length; i++) {
				children[i].onclick = onClickCategory;
			}
		}

		function onClickCategory() {
			var id = this.id;
			searchPlaces(id);
		}

		function searchPlaces(category) {
			var center = map.getCenter();
			ps.keywordSearch(category, placesSearchCB, {
				location : new kakao.maps.LatLng(center.getLat(), center
						.getLng())
			});
		}

		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {
				displayPlaces(data);
			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
				alert('검색 결과가 존재하지 않습니다.');
			} else if (status === kakao.maps.services.Status.ERROR) {
				alert('검색 결과 중 오류가 발생했습니다.');
			}
		}

		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay(overlay) {
			overlay.setMap(null);
		}

		function displayPlaces(places) {
			var bounds = new kakao.maps.LatLngBounds();
			removeAllMarkers();
			for (var i = 0; i < places.length; i++) {
				(function(place) {
					var placePosition = new kakao.maps.LatLng(place.y, place.x);
					var marker = addMarker(placePosition);

					var content = '<div class="wrap">'
							+ '    <div class="info">'
							+ '        <div class="title">'
							+ '            '
							+ place.place_name
							+ '            <div class="close" onclick="closeOverlay(overlay)" title="닫기">X</div>'
							+ '        </div>'
							+ '        <div class="body">'
							+ '            <div class="desc">'
							+ '                <div class="ellipsis">'
							+ place.address_name
							+ '</div>'
							+ '                <div><a href="' + place.place_url + '" target="_blank" class="link">더보기</a></div>'
							+ '            </div>' + '        </div>'
							+ '    </div>' + '</div>';

					var overlay = new kakao.maps.CustomOverlay({
						content : content,
						map : null,
						position : marker.getPosition()
					});

					// 닫기 버튼의 onclick 이벤트에서 overlay를 인자로 전달합니다.
					content = content.replace('closeOverlay(overlay)',
							'closeOverlay(overlay' + i + ')');
					overlay.setContent(content);

					window['overlay' + i] = overlay;

					kakao.maps.event.addListener(marker, 'click', function() {
						overlay.setMap(map);
					});

					bounds.extend(placePosition);
				})(places[i]);
			}
			map.setBounds(bounds);
		}

		function addMarker(position) {
			var marker = new kakao.maps.Marker({
				position : position
			});
			marker.setMap(map);
			markers.push(marker);
			return marker;
		}

		function removeAllMarkers() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		function setCurrentLocation() {
			if (navigator.geolocation) {
				navigator.geolocation
						.getCurrentPosition(
								function(position) {
									var lat = position.coords.latitude, lon = position.coords.longitude;
									var locPosition = new kakao.maps.LatLng(
											lat, lon);
									map.setCenter(locPosition);
									addMarker(locPosition);
								},
								function(error) {
									console
											.error("Geolocation access is denied.");
								});
			} else {
				alert("This browser doesn't support geolocation.");
			}
		}

		function initMap() {
			var mapContainer = document.getElementById('map'), mapOption = {
				center : new kakao.maps.LatLng(37.566826, 126.9786567),
				level : 5
			};
			map = new kakao.maps.Map(mapContainer, mapOption);
			setCurrentLocation();
			addCategoryClickEvent();
		}

		initMap();
	</script>
</body>
</html>