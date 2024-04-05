<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>지역 유기견 보호센터</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
/*지역 유기견 보호센터 테두리*/
.rounded-border {
   width: 40vw;
   border-radius: 10px;
   border: 1px solid #ccc;
   cursor: pointer;
   margin-right: 0 auto;
}
.rounded-border:hover {
	border-color: #007bff; /* 호버 시 테두리 색상 변경 */
}
/*지도*/

#map {

   position: fixed;
   border: 2px solid #ccc; 
   border-radius: 10px; 
   top: 50%;
   right: 230px; /* 우측 여백 설정 */
   transform: translateY(-50%);
   width: 50vw; /* 가로 너비 조절 */
   height: 400px; /* 높이 설정 */
}
.map-border {
    border-radius: 10px; /* 테두리의 둥근 정도를 설정합니다. */
    border: 1px solid #ccc; /* 테두리의 선 스타일과 색상을 설정합니다. */
    overflow: hidden; /* 내용이 넘치는 경우를 방지하기 위해 오버플로 속성을 숨깁니다. */
}
.region-link {
        display: inline-block; /* 인라인 블록 요소로 설정하여 수평 정렬 */
        margin-right: 10px; /* 링크 간격 설정 */
        text-decoration: none; /* 밑줄 제거 */
        color: #333; /* 링크 색상 설정 */
    }

    .region-link:hover {
        color: #007bff; /* 호버시 색상 변경 */
    }
	#region-list {
		margin-bottom: 20px;
	}
    .rounded-border {
   margin-bottom: 10px; /* 푸터와의 간격 설정 */
}

</style>
</head>
<body>
   	<header>
		<%
		request.setAttribute("pageTitle", "지역 유기견 보호센터");
		%>
		<jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
	</header>

   <main style="margin-bottom: 150px;">
      <div class="container" style="padding-top: 150px;">
         <section class="strays-info">
            <h2>지역 유기견 보호센터</h2>
              <div id="map-container">
            <div id="map" style="width: 500px; height: 400px;"></div>
            </div>
            <div id="shelters"></div>
            <div id="region-list">
               <a href="#" class="region-link" data-region="">전체</a> <a href="#"
                  class="region-link" data-region="서울특별시">서울</a> <a href="#"
                  class="region-link" data-region="부산광역시">부산</a> <a href="#"
                  class="region-link" data-region="대구광역시">대구</a> <a href="#"
                  class="region-link" data-region="인천광역시">인천</a> <a href="#"
                  class="region-link" data-region="광주광역시">광주</a> <a href="#"
                  class="region-link" data-region="대전광역시">대전</a> <a href="#"
                  class="region-link" data-region="울산광역시">울산</a> <a href="#"
                  class="region-link" data-region="세종">세종</a> <a href="#"
                  class="region-link" data-region="경기도">경기</a> <a href="#"
                  class="region-link" data-region="경상남도">경남</a> <a href="#"
                  class="region-link" data-region="경상북도">경북</a> <a href="#"
                  class="region-link" data-region="충청남도">충남</a> <a href="#"
                  class="region-link" data-region="충청북도">충북</a> <a href="#"
                  class="region-link" data-region="전라남도">전남</a> <a href="#"
                  class="region-link" data-region="전라북도">전북</a> <a href="#"
                  class="region-link" data-region="강원도">강원</a> <a href="#"
                  class="region-link" data-region="제주">제주</a>
            </div>
            <div id="shelter-info"></div>
         </section>
      </div>

   </main>

   <footer>
      <div class="container">
         <p>&copy; 2024 Pet. 모든 권리 보유.</p>
      </div>
   </footer>
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4948263d9bbfca4b09376e303d5e533"></script>
   <script>
      /*지도*/
      var container = document.getElementById('map');
      var options = {
         center : new kakao.maps.LatLng(33.450701, 126.570667),
         level : 10
      };

      var map = new kakao.maps.Map(container, options);
      /*지도*/
   </script>
   <script>
      var xhr = new XMLHttpRequest();
      var url = 'http://apis.data.go.kr/1543061/animalShelterSrvc/shelterInfo'; /* API URL */
      var serviceKey = '0tRr5MoRdNxPxSkeGUb2m4ShjZ026SsFQD%2FTbVpE8yeAMHJU1kZyfHaMiAsD5bpT62J9fluKxvzaTdH2R3%2FDEA%3D%3D'; /* 서비스 키 */
      var queryParams = '?' + encodeURIComponent('serviceKey') + '='
            + serviceKey; /* 서비스 키 */
      queryParams += '&' + encodeURIComponent('numOfRows') + '='
            + encodeURIComponent('1000'); /*표현할 개수*/
      queryParams += '&' + encodeURIComponent('pageNo') + '='
            + encodeURIComponent('1'); /*페이지 수*/
      queryParams += '&' + encodeURIComponent('_type') + '='
            + encodeURIComponent('json'); /**/

      xhr.open('GET', url + queryParams);
      xhr.onreadystatechange = function() {
         if (this.readyState == 4 && this.status == 200) {
            var responseData = JSON.parse(this.responseText);
            var shelters = responseData.response.body.items.item;
            displayShelterInfo(shelters);
         }
      };

      xhr.send('');

      var markers = []; // 마커를 담을 배열

      function displayShelterInfo(shelters) {
         var shelterInfoDiv = document.getElementById('shelter-info');
         shelterInfoDiv.innerHTML = ''; // 이전 내용 초기화

         // 이전에 추가된 모든 마커를 제거합니다.
         markers.forEach(function(marker) {
            marker.setMap(null);
         });
         // markers 배열을 비워줍니다.
         markers = [];

         // shelters 배열에 있는 각 보호소 정보를 표시하는 함수
         shelters.forEach(function(shelter) {
            // div 요소 생성
            var shelterElement = document.createElement('div');
            shelterElement.classList.add('rounded-border');
            shelterElement.innerHTML = '<p>보호소 이름: ' + shelter.careNm
                  + '</p>' + '<p>주소: ' + shelter.careAddr + '</p>'
                  + '<p>전화번호: ' + shelter.careTel + '</p>';

            // 추가 정보를 감싸는 div 요소 생성
            var additionalInfoDiv = document.createElement('div');
            additionalInfoDiv.className = 'additional-info';
            additionalInfoDiv.style.display = 'none'; // 초기에는 추가 정보를 감추도록 설정

            // 추가 정보를 추가
            additionalInfoDiv.innerHTML = '<p>관리기관명: ' + shelter.orgNm
                  + '</p>'; // 추가 정보 필드에 따라 수정 가능

            // 추가 정보를 표시하는 div 요소를 shelterElement에 추가
            shelterElement.appendChild(additionalInfoDiv);

            // shelterInfoDiv에 shelterElement 추가
            shelterInfoDiv.appendChild(shelterElement);

            // div 요소 클릭 시 추가 정보 펼쳐지도록 설정
            shelterElement.addEventListener('click', function() {
               // 추가 정보를 토글하여 보이거나 감추기
               if (additionalInfoDiv.style.display === 'none') {
                  additionalInfoDiv.style.display = 'block';
                  shelterElement.classList.add('expanded');
               } else {
                  additionalInfoDiv.style.display = 'none';
                  shelterElement.classList.remove('expanded');
               }
            });

            // 보호소의 위도와 경도 정보를 가져와서 지도에 마커로 표시
            var lat = parseFloat(shelter.lat); // 보호소의 위도 정보
            var lng = parseFloat(shelter.lng); // 보호소의 경도 정보

            // 마커 생성
            var markerPosition = new kakao.maps.LatLng(lat, lng);
            var marker = new kakao.maps.Marker({
               position : markerPosition
            });
            // 마커 클릭 이벤트 등록
            kakao.maps.event.addListener(marker, 'click', function() {
               var infoWindow = new kakao.maps.InfoWindow({
                  content : '<div style="padding:5px;">보호소 이름: '
                        + shelter.careNm + '<br>주소: '
                        + shelter.careAddr + '<br>전화번호: '
                        + shelter.careTel + '</div>'
               });
               infoWindow.open(map, marker);
            });

            // 마커를 지도에 표시
            marker.setMap(map);

            // 생성된 마커를 markers 배열에 추가합니다.
            markers.push(marker);
         });
      }

      // 특정 지역에 해당하는 보호소 정보를 추출하는 함수
      function filterSheltersByRegion(shelters, region) {
         // 특정 지역에 해당하는 보호소만 추출하여 반환합니다.
         return shelters.filter(function(shelter) {
            // 보호소 주소에 해당 지역이 포함되어 있는지 확인합니다.
            return shelter.careAddr.indexOf(region) !== -1;
         });
      }

      // 지역 링크에 클릭 이벤트 리스너 추가
      var regionLinks = document.querySelectorAll('.region-link');
      regionLinks.forEach(function(link) {
         link.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 동작(페이지 새로고침)을 방지합니다.
            var region = this.getAttribute('data-region');
            // 특정 지역에 해당하는 보호소 정보를 표시합니다.
            displaySheltersByRegion(region);
         });
      });

      function displaySheltersByRegion(region) {
         // 보호소 정보를 가져와서 필터링합니다.
         var xhr = new XMLHttpRequest();
         xhr.open('GET', url + queryParams);
         xhr.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
               var responseData = JSON.parse(this.responseText);
               var shelters = responseData.response.body.items.item;
               var regionShelters = filterSheltersByRegion(shelters,
                     region);
               // 추출된 보호소 정보를 표시합니다.
               displayShelterInfo(regionShelters);

               // 부산의 모든 보호소 위치를 고려하여 중심을 설정합니다.
               if (region === "부산광역시") {
                  var center = new kakao.maps.LatLng(
                        parseFloat(regionShelters[1].lat),
                        parseFloat(regionShelters[1].lng));
                  map.setCenter(center);
               } else if (regionShelters.length > 0) {
                  var center = new kakao.maps.LatLng(
                        parseFloat(regionShelters[0].lat),
                        parseFloat(regionShelters[0].lng));
                  map.setCenter(center);
               }
            }
         };
         xhr.send('');
      }
   </script>
</body>
</html>
