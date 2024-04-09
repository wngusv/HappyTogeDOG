<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/floating-banner.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styles.css">
<body style="padding-top: 150px; background-color: rgb(254, 247, 222);">
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
	height: 600px;
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

.customoverlay {
	position: relative;
	bottom: 50px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
}

.customoverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.customoverlay a {
	display: block;
	text-decoration: none;
	color: #000;
	text-align: center;
	border-radius: 6px;
	font-size: 14px;
	font-weight: bold;
	overflow: hidden;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.customoverlay .title {
	display: block;
	text-align: center;
	background: #fff;
	margin-right: 35px;
	padding: 10px 15px;
	font-size: 14px;
	font-weight: bold;
}

.customoverlay:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

 .space {
        height: 50px; /* 원하는 높이로 조절하세요 */
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
<div class="space"></div>
	<main>
		<div class="container">
			<section class="strays-info">
			</section>
		</div>
		<div class="container">
			<!-- Bootstrap 그리드 시스템 사용 -->
			<div class="row justify-content-center">
				<!-- 가운데 정렬 -->
				<div class="col-lg-10">
					<div class="map_wrap">
						<div id="map"
							style="width: 100%; height: 500px; position: relative; overflow: hidden;"></div>
						<!-- 수정된 높이 -->
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

		            // 마커를 생성합니다 (이전에는 여기에 마커 이미지 설정이 있었습니다)
		            var marker = new kakao.maps.Marker({
		                position: placePosition
		            });
		            marker.setMap(map);
		            markers.push(marker);

		            // 커스텀 오버레이의 내용을 장소 이름과 URL을 포함하도록 설정합니다
		            var content = '<div class="customoverlay">' +
		                          '  <a href="' + place.place_url + '" target="_blank">' +
		                          '    <span class="title">' + place.place_name + '</span>' +
		                          '  </a>' +
		                          '</div>';

		            // 커스텀 오버레이를 생성합니다
		            var overlay = new kakao.maps.CustomOverlay({
		                content: content,
		                map: map,
		                position: marker.getPosition(),
		                yAnchor: 1
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
									var locPosition = new kakao.maps.LatLng(
											33.450701, 126.570667);
									displayMarker(locPosition,
											'geolocation을 사용할수 없어요..');
								});
			} else {
				alert("This browser doesn't support geolocation.");
				var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);
				displayMarker(locPosition, 'geolocation을 사용할수 없어요..');
			}
		}

		function displayMarker(locPosition, message) {
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});

			var iwContent = message, iwRemoveable = true;

			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// 인포윈도우의 가로 길이를 조절합니다.
			infowindow.setContent('<div style="padding:5px; width:150px;">'
					+ iwContent + '</div>');

			infowindow.open(map, marker);
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
