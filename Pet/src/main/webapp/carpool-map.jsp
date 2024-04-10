<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/floating-banner.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>경로 따라 지도에 선 그리기 및 장소 검색</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
#postForm {
	margin: 20px auto; /* 수평 가운데 정렬 */
	width: 60%; /* 폼 너비 설정 */
	padding: 20px;
	border: 1px solid #ccc;
	border: 2px solid rgb(111, 94, 75);
	border-radius: 10px;
}

#postForm input[type="text"], #postForm textarea {
	width: calc(100% - 10px); /* 입력 필드 너비 설정 */
	margin-bottom: 10px; /* 입력 필드 아래 여백 설정 */
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box; /* 입력 내용에 패딩과 테두리를 포함시킵니다. */
}

#postForm button {
	margin-top: 20px;
	padding: 10px 20px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right; /* 버튼을 오른쪽으로 정렬 */
}

#postForm button:hover {
	background-color: #45a049;
}

#map-container {
	width: 100%; /* 가로 중앙 정렬을 위해 전체 너비를 사용합니다. */
	display: flex;
	justify-content: center; /* 가로 중앙 정렬 */
}

#map {
	width: 60%;
	height: 400px;
	border: 2px solid rgb(111, 94, 75);
	border-radius: 10px;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;;
	bottom: 0;
	width: 250px;
	margin: 150px 0 30px 10px;
	margin-left: 50px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 1);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
	height: 500px;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList {
	padding-left: 0;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4948263d9bbfca4b09376e303d5e533&libraries=services"></script>
</head>

<body style="padding-top: 150px;">
	<header>
		<%
		request.setAttribute("pageTitle", "카풀 등록");
		%>
		<jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
	</header>
	<div id="map-container">
		<div id="map"></div>
	</div>
	<div id="postForm">
		<input type="text" id="title" placeholder="제목" /><br>
		<textarea id="content" placeholder="내용"></textarea>
		<button onclick="submitPost()">등록</button>
	</div>

	<div id="menu_wrap" class="bg_white">
		<div class="option">
			<div>
				출발지 : <input type="text" id="startInput" size="15">
				<button onclick="searchPlaces('start')">검색</button>
			</div>
			<div>
				도착지 : <input type="text" id="endInput" size="15">
				<button onclick="searchPlaces('end')">검색</button>
				<button onclick="getCarDirection()">경로 찾기</button>
				<button onclick="resetMap()">초기화</button>
			</div>
		</div>
		<hr>
		<ul id="placesList"></ul>
		<div id="pagination"></div>
	</div>

	<div id="search"></div>

	<script>
			function createMarkerImage(src, size) {
				return new kakao.maps.MarkerImage(src, size);
			}

			// 출발지 마커 이미지 설정
			var startMarkerImage = createMarkerImage('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', new kakao.maps.Size(33, 33));

			// 도착지 마커 이미지 설정
			var endMarkerImage = createMarkerImage('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', new kakao.maps.Size(33, 33));

			var mapContainer = document.getElementById('map'),
				mapOption = {
					center: new kakao.maps.LatLng(37.566826, 126.9786567),
					level: 3
				};
			var map = new kakao.maps.Map(mapContainer, mapOption);
			var markers = [];
			var ps = new kakao.maps.services.Places();
			var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });
			var startPoint = {}, endPoint = {};
			var startMarker, endMarker, polyline;
			var pathData = [];
			var startAddress = "";
			var endAddress = "";

			function searchPlaces(type) {
				var inputId = type === 'start' ? 'startInput' : 'endInput';
				currentSearchType = type; // 현재 검색 유형 업데이트
				var inputElement = document.getElementById(inputId);
				if (inputElement && inputElement.value.trim() !== '') {
					var keyword = inputElement.value;
					// 검색 로직을 여기에 구현
					removeMarker();

					ps.keywordSearch(keyword, placesSearchCB);
				} else {
					alert('키워드를 입력해주세요!');
				}
			}

			function placesSearchCB(data, status, pagination) {
				if (status === kakao.maps.services.Status.OK) {
					displayPlaces(data);
					displayPagination(pagination);
				} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
					alert('검색 결과가 존재하지 않습니다.');
					return;
				} else if (status === kakao.maps.services.Status.ERROR) {
					alert('검색 결과 중 오류가 발생했습니다.');
					return;
				}
			}
			// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
			function displayPagination(pagination) {
				var paginationEl = document.getElementById('pagination'),
					fragment = document.createDocumentFragment(),
					i;

				// 기존에 추가된 페이지번호를 삭제합니다
				while (paginationEl.hasChildNodes()) {
					paginationEl.removeChild(paginationEl.lastChild);
				}

				for (i = 1; i <= pagination.last; i++) {
					var el = document.createElement('a');
					el.href = "#";
					el.innerHTML = i;

					if (i === pagination.current) {
						el.className = 'on';
					} else {
						el.onclick = (function (i) {
							return function () {
								pagination.gotoPage(i);
							}
						})(i);
					}

					fragment.appendChild(el);
				}
				paginationEl.appendChild(fragment);
			}

			function displayPlaces(places) {
				var listEl = document.getElementById('placesList'),
					menuEl = document.getElementById('menu_wrap'),
					fragment = document.createDocumentFragment(),
					bounds = new kakao.maps.LatLngBounds();

				removeAllChildNods(listEl);
				removeMarker();

				for (var i = 0; i < places.length; i++) {
					var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
						marker = addMarker(placePosition, i),
						itemEl = getListItem(i, places[i]);

					bounds.extend(placePosition);

					(function (marker, title, position) {
						kakao.maps.event.addListener(marker, 'click', function () {
							selectPlace(position, title, currentSearchType); // 'currentSearchType' 사용
						});

						itemEl.onclick = function () {
							selectPlace(position, title, currentSearchType); // 'currentSearchType' 사용
						};
					})(marker, places[i].place_name, placePosition);

					fragment.appendChild(itemEl);
				}

				listEl.appendChild(fragment);
				menuEl.scrollTop = 0;
				map.setBounds(bounds);
			}

			function selectPlace(position, title, type) {
			    var inputId = type === 'start' ? 'startInput' : 'endInput';
			    document.getElementById(inputId).value = title; // 입력란에 타이틀 표시

			    // 이미 정의된 마커 이미지를 바탕으로 적절한 이미지 선택
			    var markerImage = type === 'start' ? startMarkerImage : endMarkerImage;

			    // 출발지와 도착지에 따라 주소 정보 가져오기
			    var addressInfo = {};
			    var geocoder = new kakao.maps.services.Geocoder();
			    geocoder.coord2Address(position.getLng(), position.getLat(), function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			            var address = result[0].road_address.address_name; // 도로명 주소 가져오기
			            addressInfo = { lat: position.getLat(), lng: position.getLng(), address: address };
			        }
			        
			        // 기존 마커가 있으면 지도에서 제거
			        if (type === 'start' && startMarker) startMarker.setMap(null);
			        if (type === 'end' && endMarker) endMarker.setMap(null);

			        // 새 마커 생성
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: position,
			            image: markerImage // 마커 이미지 설정
			        });

			        // 전역 변수에 마커와 위치 정보 저장
			        if (type === 'start') {
			            startMarker = marker;
			            startPoint = { lat: position.getLat(), lng: position.getLng() };
			            startAddress = addressInfo.address; // 출발지의 주소 정보 저장
			            console.log(startAddress);
			        } else {
			            endMarker = marker;
			            endPoint = { lat: position.getLat(), lng: position.getLng() };
			            endAddress = addressInfo.address; // 도착지의 주소 정보 저장
			            console.log(endAddress);
			        }
			    });
			}


			function getListItem(index, places) {

				var el = document.createElement('li'),
					itemStr = '<span class="markerbg marker_' + (index + 1) + '"></span>' +
						'<div class="info">' +
						'   <h5>' + places.place_name + '</h5>';

				if (places.road_address_name) {
					itemStr += '    <span>' + places.road_address_name + '</span>' +
						'   <span class="jibun gray">' + places.address_name + '</span>';
				} else {
					itemStr += '    <span>' + places.address_name + '</span>';
				}

				itemStr += '  <span class="tel">' + places.phone + '</span>' +
					'</div>';

				el.innerHTML = itemStr;
				el.className = 'item';

				return el;
			}

			function addMarker(position, idx, title) {
				var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
					imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
					imgOptions = {
						spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
						spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
						offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
					},
					markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
					marker = new kakao.maps.Marker({
						position: position, // 마커의 위치
						image: markerImage
					});

				marker.setMap(map); // 지도 위에 마커를 표출합니다
				markers.push(marker);  // 배열에 생성된 마커를 추가합니다

				return marker;
			}
			function resetMap() {
			    // 마커 제거
			    if (startMarker) {
			        startMarker.setMap(null);
			        startMarker = null;
			    }
			    if (endMarker) {
			        endMarker.setMap(null);
			        endMarker = null;
			    }

			    // 폴리라인 제거
			    if (polyline) {
			        polyline.setMap(null);
			        polyline = null;
			    }

			    // 지도 중심을 초기 위치로 설정하고 줌 레벨을 재설정
			    var initialCenter = new kakao.maps.LatLng(37.566826, 126.9786567);
			    map.setCenter(initialCenter);
			    map.setLevel(3);

			    // 검색 결과와 페이지네이션 클리어
			    document.getElementById('placesList').innerHTML = '';
			    document.getElementById('pagination').innerHTML = '';
			    
			    // 검색 입력 필드 초기화
			    document.getElementById('startInput').value = '';
			    document.getElementById('endInput').value = '';

			    // 경로 데이터 초기화
			    pathData = [];
			}


			function removeAllChildNods(el) {
				while (el.hasChildNodes()) {
					el.removeChild(el.lastChild);
				}
			}

			function removeMarker() {
				for (var i = 0; i < markers.length; i++) {
					markers[i].setMap(null);
				}
				markers = [];
			}


			function getCarDirection() {
			    if (!startMarker) {
			        alert("출발점을 지정해주세요.");
			        return; 
			    }
			    if (!endMarker) {
			        alert("도착점을 지정해주세요.");
			        return; 
			    }
				
				if (polyline) polyline.setMap(null); // 이전에 그려진 선이 있다면 지웁니다.

				// 사용자가 선택한 출발지와 도착지의 좌표를 사용합니다.
				var startLat = startPoint.lat,
					startLng = startPoint.lng,
					endLat = endPoint.lat,
					endLng = endPoint.lng;

				markers.forEach(function (marker) {
					if (marker !== startMarker && marker !== endMarker) {
						marker.setMap(null);
					}
				});

				// 시작점과 끝점에 마커를 표시합니다. (필요하다면 이전 마커는 지웁니다)
				if (startMarker) startMarker.setMap(null);
				if (endMarker) endMarker.setMap(null);

				startMarker = new kakao.maps.Marker({
					position: new kakao.maps.LatLng(startLat, startLng),
					image: startMarkerImage,
					map: map
				});

				endMarker = new kakao.maps.Marker({
					position: new kakao.maps.LatLng(endLat, endLng),
					image: endMarkerImage,
					map: map
				});

				var REST_API_KEY = '338d403a243e055727945750ef6920a1';
				var url = 'https://apis-navi.kakaomobility.com/v1/directions?origin=' + startLng + ',' + startLat + '&destination=' + endLng + ',' + endLat;


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
									var latLng = new kakao.maps.LatLng(road.vertexes[i + 1], road.vertexes[i]);
									paths.push(latLng);
									// 경로 데이터를 전역 변수에 추가
									pathData.push({ lat: latLng.getLat(), lng: latLng.getLng() });
								}
							});
						});

						// 지도에 표시할 선을 생성합니다.
						polyline = new kakao.maps.Polyline({
							path: paths,
							strokeWeight: 5, // 선의 두께
							strokeColor: '#f50057', // 선의 색깔
							strokeOpacity: 0.7, // 선의 불투명도
							strokeStyle: 'solid' // 선의 스타일
						});

						// 지도에 선을 표시합니다.
						polyline.setMap(map);

						// 지도 범위를 재조정합니다.
						var bounds = new kakao.maps.LatLngBounds();
						bounds.extend(new kakao.maps.LatLng(startLat, startLng));
						bounds.extend(new kakao.maps.LatLng(endLat, endLng));
						map.setBounds(bounds);
					})
					.catch(error => console.error('Error:', error));
			}

			// 맵저장
			function getMapState() {
				return JSON.stringify({
					center: map.getCenter(),
					level: map.getLevel(),
					startPoint: startPoint,
					endPoint: endPoint,
					pathData: pathData // 경로 데이터 추가
				});
			}

			function submitPost() {
			    var title = document.getElementById('title').value;
			    var content = document.getElementById('content').value;
			    var mapState = getMapState(); // 지도 상태 수집
			    var userId = "<%=session.getAttribute("userId")%>";

			    fetch('/submit-post', {
			        method: 'POST',
			        headers: {
			            'Content-Type': 'application/json'
			        },
			        body: JSON.stringify({
			            title: title,
			            content: content,
			            mapstate: mapState,
			            userId: userId,
			            startAddress: startAddress, // 출발지 주소 정보 추가
			            endAddress: endAddress // 도착지 주소 정보 추가
			        })
			    })
			    .then(response => response.json())
			    .then(data => {
			        console.log('Success:', data);
			        alert("등록되었습니다.");
			        window.close();
			        window.location.href = "carpool-main.jsp";
			    })
			    .catch((error) => {
			        console.error('Error:', error);
			    });
			}

		</script>
</body>
</html>