<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>경로 따라 지도에 선 그리기 및 장소 검색</title>
<style>
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
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
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
<body>
	<div class="map_wrap">
		<div id="map" style="width: 100%; height: 400px;"></div>

		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15">
						<button type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>

	<div id="search">
		출발지: <span id="startPoint"></span><br> 도착지: <span id="endPoint"></span><br>
		<button onclick="getCarDirection()">경로 찾기</button>
	</div>

	<script>
        var mapContainer = document.getElementById('map'), 
            mapOption = {
                center: new kakao.maps.LatLng(37.566826, 126.9786567), 
                level: 3 
            };  
        var map = new kakao.maps.Map(mapContainer, mapOption); 
        var markers = [];
        var ps = new kakao.maps.services.Places();  
        var infowindow = new kakao.maps.InfoWindow({zIndex:1});
        var startPoint = {}, endPoint = {};
        var startMarker, endMarker, polyline;

        function searchPlaces() {
            var keyword = document.getElementById('keyword').value;
            if (!keyword.replace(/^\s+|\s+$/g, '')) {
                alert('키워드를 입력해주세요!');
                return false;
            }
            // 검색 전에 기존 검색 결과 및 마커 초기화
           // removeAllChildNodes(document.getElementById('placesList'));
            removeMarker();

            ps.keywordSearch(keyword, placesSearchCB); 
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
                paginationEl.removeChild (paginationEl.lastChild);
            }

            for (i=1; i<=pagination.last; i++) {
                var el = document.createElement('a');
                el.href = "#";
                el.innerHTML = i;

                if (i===pagination.current) {
                    el.className = 'on';
                } else {
                    el.onclick = (function(i) {
                        return function() {
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
            
            for (var i=0; i<places.length; i++) {
                var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                    marker = addMarker(placePosition, i), 
                    itemEl = getListItem(i, places[i]); 

                bounds.extend(placePosition);

                (function(marker, title, position) {
                    kakao.maps.event.addListener(marker, 'click', function() {
                        selectPlace(position, title);
                    });

                    itemEl.onclick = function () {
                        selectPlace(position, title);
                    };
                })(marker, places[i].place_name, placePosition);

                fragment.appendChild(itemEl);
            }

            listEl.appendChild(fragment);
            menuEl.scrollTop = 0;
            map.setBounds(bounds);
        }

        // 장소 선택 로직을 개선
        function selectPlace(position, title) {
            if (!startPoint.lat) { // 출발지 설정
                setStartPoint(position, title);
            } else if (!endPoint.lat) { // 도착지 설정
                setEndPoint(position, title);
            }
        }
        
        // 출발지 설정
        function setStartPoint(position, title) {
            if(startMarker) startMarker.setMap(null);
            startPoint = {lat: position.getLat(), lng: position.getLng()};
            document.getElementById('startPoint').innerText = title;
            startMarker = new kakao.maps.Marker({
                map: map,
                position: position
            });

            // 출발지 설정 후 검색 결과 초기화
            clearSearchResults();
        }

        // 도착지 설정
        function setEndPoint(position, title) {
            if(endMarker) endMarker.setMap(null);
            endPoint = {lat: position.getLat(), lng: position.getLng()};
            document.getElementById('endPoint').innerText = title;
            endMarker = new kakao.maps.Marker({
                map: map,
                position: position
            });

            getCarDirection(); // 경로 탐색
        }

        // 검색 결과 및 마커 초기화 함수
        function clearSearchResults() {
            removeAllChildNodes(document.getElementById('placesList'));
            removeMarker();
            document.getElementById('keyword').value = ''; // 키워드 입력 필드도 초기화
        }
        
        function getListItem(index, places) {

            var el = document.createElement('li'),
            itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                        '<div class="info">' +
                        '   <h5>' + places.place_name + '</h5>';

            if (places.road_address_name) {
                itemStr += '    <span>' + places.road_address_name + '</span>' +
                            '   <span class="jibun gray">' +  places.address_name  + '</span>';
            } else {
                itemStr += '    <span>' +  places.address_name  + '</span>'; 
            }
                         
              itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                        '</div>';           

            el.innerHTML = itemStr;
            el.className = 'item';

            return el;
        }
        
        function addMarker(position, idx, title) {
            var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                imgOptions =  {
                    spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                    spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
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

        
        function removeAllChildNods(el) {   
            while (el.hasChildNodes()) {
                el.removeChild (el.lastChild);
            }
        }
        
        function removeMarker() {
            for ( var i = 0; i < markers.length; i++ ) {
                markers[i].setMap(null);
            }   
            markers = [];
        }

        function getCarDirection() {
            if (polyline) polyline.setMap(null); // 이전에 그려진 선이 있다면 지웁니다.

            // 사용자가 선택한 출발지와 도착지의 좌표를 사용합니다.
            var startLat = startPoint.lat,
                startLng = startPoint.lng,
                endLat = endPoint.lat,
                endLng = endPoint.lng;

            // 시작점과 끝점에 마커를 표시합니다. (필요하다면 이전 마커는 지웁니다)
            if(startMarker) startMarker.setMap(null);
            if(endMarker) endMarker.setMap(null);

            startMarker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(startLat, startLng),
                map: map
            });

            endMarker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(endLat, endLng),
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
                            paths.push(new kakao.maps.LatLng(road.vertexes[i+1], road.vertexes[i]));
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

        
    </script>


</body>
</html>
