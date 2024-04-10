<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/floating-banner.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>지역 유기견 보호센터</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
.container {
	max-width: 90%;
}
/* 페이징 버튼의 배경색과 텍스트 색상 변경 */
.page-link {
	background-color: #ffffff; /* 배경색 변경 */
	color: rgb(111, 94, 66); /* 텍스트 색상 변경 */
	border-color: rgb(222, 226, 230);
}

/* 활성화된 페이징 버튼의 배경색과 텍스트 색상 변경 */
.page-item.active .page-link {
	background-color: #ffffff; /* 활성화된 버튼의 배경색 변경 */
	color: rgb(111, 94, 66); /* 활성화된 버튼의 텍스트 색상 변경 */
	border-color: rgb(222, 226, 230);
}

/*지역 유기견 보호센터 테두리*/
.rounded-border {
	background-color: white;
	width: 40vw;
	border-radius: 10px;
	border: 2px solid rgb(111, 94, 75);
	margin-right: 0 auto;
}

/*지도*/
#map {
	position: fixed;
	border: 2px solid rgb(111, 94, 75);
	border-radius: 10px;
	top: 50%;
	right: 250px; /* 우측 여백 설정 */
	transform: translateY(-50%);
	width: 80vw; /* 가로 너비 조절 */
	height: 400px; /* 높이 설정 */
}

.map-border {
	border-radius: 10px; /* 테두리의 둥근 정도를 설정합니다. */
	border: 1px solid rgb(111, 94, 75); /* 테두리의 선 스타일과 색상을 설정합니다. */
	overflow: hidden; /* 내용이 넘치는 경우를 방지하기 위해 오버플로 속성을 숨깁니다. */
}

.region-link {
	background-color: rgb(205, 173, 129);
	font-size: 15px;
	border-radius: 10px; /* Rounded border */
	border: none; /* Remove default border */
	padding: 5px 11px; /* Padding for button */
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	/* Change font */
	cursor: pointer; /* Change cursor to pointer on hover */
	margin: 5px; /* Add margin between buttons */
	color: rgb(59, 38, 14);
	display: inline-block;
	font-weight: bold; /* Make font bold */
	/* Hover effect for background color */
	transition: background-color 0.3s ease;
	/* Hover effect for transform */
	transition: transform 0.3s ease;
}

.region-link:hover {
	background-color: rgb(255, 144, 61);
	/* Change background color on hover */
	text-decoration: none;
	color: rgb(59, 38, 14);
	font-size: 18px;
	transform: scale(1.1);
}

#region-list {
	margin-bottom: 20px;
	width: 100%; /* 또는 충분한 고정 너비 */
	overflow: auto;
}

.rounded-border {
	margin-bottom: 10px; /* 푸터와의 간격 설정 */
	width: 60%;
}

.shelter-name {
	color: gray;
}

.weekday-hours {
	padding: 0.25rem 0.5rem; /* px-2 py-1 */
	border-radius: 0.375rem; /* rounded */
	color: white; /* text-white */
	background-color: #60a5fa; /* bg-sky-500, 하늘색 */
	font-weight: 600; /* font-semibold */
	font-size: 0.75rem; /* text-xs */
	display: flex;
	align-items: center;
	width: max-content;
	transition: background-color 0.3s ease;
	/* transition duration-300 ease */
}

.weekday-hours:active {
	background-color: #d1d5db; /* active:bg-gray-300 */
}

.weekend-hours {
	padding: 0.25rem 0.5rem; /* 동일 */
	border-radius: 0.375rem; /* 동일 */
	color: white; /* 동일 */
	background-color: #f87171; /* bg-red-500, 붉은색 */
	font-weight: 600; /* 동일 */
	font-size: 0.75rem; /* 동일 */
	display: flex;
	align-items: center;
	width: max-content;
	transition: background-color 0.3s ease; /* 동일 */
}

.weekend-hours:active {
	background-color: #d1d5db; /* 동일 */
}

.close-day {
	padding: 0.25rem 0.5rem;
	border-radius: 0.375rem;
	color: white;
	background-color: #9ae6b4; /* 연두색 배경 */
	font-weight: 600;
	font-size: 0.75rem;
	display: flex;
	align-items: center;
	width: max-content;
	transition: background-color 0.3s ease;
}

.close-day:active {
	background-color: #d1d5db;
}

.org-name {
	padding: 0.25rem 0.5rem;
	border-radius: 0.375rem;
	color: white;
	background-color: #6b7280; /* 살짝 검은 회색 배경 */
	font-weight: 600;
	font-size: 0.75rem;
	display: flex;
	align-items: center;
	width: max-content;
	transition: background-color 0.3s ease;
}

.org-name:active {
	background-color: #d1d5db;
}

.highlight {
	background-color: rgb(255, 144, 61);
	text-decoration: bold;
	color: rgb(59, 38, 14);
	font-size: 15px;
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
<body style="background-color: rgb(254, 247, 222);">
	<main style="margin-bottom: 150px;">
		<div class="container" style="padding-top: 150px;">
			<section class="strays-info" style="width: 1200px;">
				<div id="map-container">
					<div id="map" style="width: 700px; height: 500px;"></div>
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
				<div id="pagination"></div>

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
   // 페이지당 보호소 수를 설정합니다.
      const sheltersPerPage = 5;

      function displayShelterInfo(shelters, pageNumber = 1) {
    	    var startIndex = (pageNumber - 1) * sheltersPerPage;
    	    var endIndex = startIndex + sheltersPerPage;
    	    var paginatedShelters = shelters.slice(startIndex, endIndex);

    	    var shelterInfoDiv = document.getElementById('shelter-info');
    	    shelterInfoDiv.innerHTML = ''; // 이전 내용 초기화

    	    // 페이지 네이션을 위한 코드 추가
    	    var paginationDiv = document.getElementById('pagination');
    	    paginationDiv.innerHTML = ''; // 이전 페이지네이션 초기화

    	    var totalPages = Math.ceil(shelters.length / sheltersPerPage);
    	    for (let i = 1; i <= totalPages; i++) {
    	        var pageLink = document.createElement('a');
    	        pageLink.href = '#';
    	        pageLink.innerHTML = i;
    	        pageLink.addEventListener('click', function(e) {
    	            e.preventDefault();
    	            displayShelterInfo(shelters, i);
    	        });

    	        paginationDiv.appendChild(pageLink);

    	        // 페이지 간 구분을 위해 공백 추가
    	        if (i < totalPages) {
    	            paginationDiv.appendChild(document.createTextNode(' '));
    	        }
    	    }
    	    
    	    // 페이지네이션 HTML 구조를 Bootstrap과 호환되게 수정
    	     var paginationDiv = document.getElementById('pagination');
    paginationDiv.innerHTML = ''; // 페이지네이션 초기화
    var ul = document.createElement('ul');
    ul.className = 'pagination justify-content-center';

    // "이전" 페이지 그룹 이동 버튼
    var startPage = Math.floor((pageNumber - 1) / 5) * 5 + 1;
    var prevGroupLi = document.createElement('li');
    prevGroupLi.className = 'page-item';
    if (pageNumber <= 5) prevGroupLi.classList.add('disabled'); // 첫 번째 페이지 그룹인 경우 비활성화
    var prevGroupLink = document.createElement('a');
    prevGroupLink.className = 'page-link';
    prevGroupLink.href = '#';
    prevGroupLink.innerHTML = '&laquo;';
    prevGroupLink.addEventListener('click', function(e) {
        e.preventDefault();
        displayShelterInfo(shelters, startPage - 5);
    });
    prevGroupLi.appendChild(prevGroupLink);
    ul.appendChild(prevGroupLi);

    // 현재 페이지 그룹의 페이지 번호들
    var endPage = Math.min(startPage + 4, totalPages);
    for (let i = startPage; i <= endPage; i++) {
        var li = document.createElement('li');
        li.className = `page-item ${i == pageNumber ? 'active' : ''}`;
        var link = document.createElement('a');
        link.className = 'page-link';
        link.href = '#';
        link.innerText = i;
        link.addEventListener('click', function(e) {
            e.preventDefault();
            displayShelterInfo(shelters, i);
        });
        li.appendChild(link);
        ul.appendChild(li);
    }

    // "다음" 페이지 그룹 이동 버튼
    var nextGroupLi = document.createElement('li');
    nextGroupLi.className = 'page-item';
    if (endPage == totalPages) nextGroupLi.classList.add('disabled'); // 마지막 페이지 그룹인 경우 비활성화
    var nextGroupLink = document.createElement('a');
    nextGroupLink.className = 'page-link';
    nextGroupLink.href = '#';
    nextGroupLink.innerHTML = '&raquo;';
    nextGroupLink.addEventListener('click', function(e) {
        e.preventDefault();
        displayShelterInfo(shelters, startPage + 5);
    });
    nextGroupLi.appendChild(nextGroupLink);
    ul.appendChild(nextGroupLi);

    paginationDiv.appendChild(ul);

    	    // 이전에 추가된 모든 마커를 지도에서 제거합니다.
    	    markers.forEach(function(marker) {
    	        marker.setMap(null);
    	    });
    	    // markers 배열을 비워줍니다.
    	    markers = [];

    	    // paginatedShelters 배열에 있는 각 보호소 정보를 페이지에 표시합니다.
    	    paginatedShelters.forEach(function(shelter) {
    	        var shelterElement = document.createElement('div');
    	        shelterElement.classList.add('rounded-border');
    	        
    	        shelterElement.innerHTML = '<p style="margin-left: 40px;margin-top: 10px;margin-bottom: 10px;"><img src="images/보호소.png" alt="아이콘" /> 보호소 : ' + shelter.careNm + '</p>' 
    	        + '<p style="margin-left: 40px;margin-top: 10px;margin-bottom: 10px;"><img src="images/주소.png" alt="아이콘" /> 주소 : ' + shelter.careAddr + '</p>'
    	        + '<p style="margin-left: 40px;margin-top: 10px;margin-bottom: 10px;"><img src="images/전화.png" alt="아이콘" /> 전화 : ' + shelter.careTel + '</p>';
				

    	        var additionalInfoDiv = document.createElement('div');
    	        additionalInfoDiv.className = 'additional-info';
    	        additionalInfoDiv.style.display = 'flex'; // Flexbox를 사용하여 내부 요소를 가로로 배열
    	        additionalInfoDiv.style.flexWrap = 'wrap'; // 내용이 너무 많으면 다음 줄로 넘김
    	        additionalInfoDiv.style.alignItems = 'center'; // 내부 요소를 세로 중앙에 정렬
    	        additionalInfoDiv.style.justifyContent = 'center'; // 내부 요소를 가로 중앙에 정렬
    	        additionalInfoDiv.style.gap = '10px';
    	        additionalInfoDiv.innerHTML = '<p class="org-name">관리기관명: ' + shelter.orgNm + '</p>' +
                '<p class="weekday-hours">평일 운영시간: ' + shelter.weekOprStime + '~' + shelter.weekOprEtime + '</p>';
                if (shelter.weekendOprStime && shelter.weekendOprEtime) {
                	additionalInfoDiv.innerHTML += '<p class="weekend-hours">주말 운영시간: ' + shelter.weekendOprStime + '~' + shelter.weekendOprEtime + '</p>';
                } else {
                	additionalInfoDiv.innerHTML += '<p class="weekend-hours">주말 운영시간: 미운영</p>';
                }

                if (shelter.closeDay === 0) {
                	additionalInfoDiv.innerHTML += '<p class="close-day">휴무일: ' + (shelter.closeDay === 0 ? "없음" : shelter.closeDay) + '</p>';
                } else {
                	additionalInfoDiv.innerHTML += '<p class="close-day">휴무일: 없음</p>';
                }
    	        
                var separator = document.createElement('div'); // 구분선을 위한 div 생성
    	        separator.style.borderTop = "2px solid  rgb(111, 94, 75)"; // 구분선 스타일 적용, 색상과 두께는 조절 가능
    	        separator.style.margin = "10px 0"; // 위아래 마진 추가하여 내용과의 간격 조절
    	        							
                shelterElement.appendChild(separator); // 이제 separator는 올바르게 추가될 수 있습니다.
                shelterElement.appendChild(additionalInfoDiv); // additionalInfoDiv 추가
                shelterInfoDiv.appendChild(shelterElement);

    	        // 보호소의 위도와 경도 정보가 유효할 경우에만 마커를 생성하여 지도에 표시합니다.
    	        if(shelter.lat && shelter.lng) {
    	            var lat = parseFloat(shelter.lat);
    	            var lng = parseFloat(shelter.lng);
    	            var markerPosition = new kakao.maps.LatLng(lat, lng);
    	            var marker = new kakao.maps.Marker({position: markerPosition});
    	            kakao.maps.event.addListener(marker, 'click', function() {
    	                var infoWindow = new kakao.maps.InfoWindow({
    	                    content: '<div style="padding:8px;">보호소 이름: ' + shelter.careNm + '<br>주소: ' + shelter.careAddr + '</div>'
    	                });
    	                infoWindow.open(map, marker);
    	            });

    	            marker.setMap(map);
    	            markers.push(marker);
    	        }
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

      window.onload = function() {
    	    // 모든 지역 링크에 대한 참조를 가져옵니다.
    	    var regionLinks = document.querySelectorAll('.region-link');
    	    
    	    // 각 링크에 대해 클릭 이벤트 리스너를 설정합니다.
    	    regionLinks.forEach(function(link) {
    	        link.addEventListener('click', function(event) {
    	            event.preventDefault(); // 기본 동작을 방지합니다.

    	            // 모든 링크에서 'highlight' 클래스를 제거합니다.
    	            regionLinks.forEach(function(otherLink) {
    	                otherLink.classList.remove('highlight');
    	            });

    	            // 현재 클릭된 링크에 'highlight' 클래스를 추가합니다.
    	            this.classList.add('highlight');
    	        });
    	    });
    	};
   </script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>