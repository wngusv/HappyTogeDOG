<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/floating-banner.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카풀 메인</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
.row {
   margin-top: 50px;
}

.rounded-border {
   width: 50vw;
   border-radius: 10px;
   border: 1px solid #ccc;
   cursor: pointer;
   margin: 0 auto;
   border-radius: 10px;
   border: 2px solid rgb(111, 94, 75);
}

.centered-message {
   display: flex;
   justify-content: center;
   align-items: center;
   height: 100px; /* 높이를 조정하여 중앙 정렬을 더 잘 보여줄 수 있습니다 */
   margin-bottom: 10px;
   padding: 10px;
}

.card-body {
   cursor: pointer; /* 마우스 오버 시 커서를 포인터 모양으로 변경 */
}

.region-link {
   background-color: rgb(205, 173, 129);
   font-size: 15px;
   border-radius: 10px; /* Rounded border */
   border: none; /* Remove default border */
   padding: 5px 9px; /* Padding for button */
   font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
   /* Change font */
   cursor: pointer; /* Change cursor to pointer on hover */
   margin: 5.3px; /* Add margin between buttons */
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

.sub-region-link {
    /* 여기에 원하는 스타일 속성 추가 */
    background-color:  rgb(135, 206, 235);
    color: #333;
    padding: 5px 10px;
    margin: 5px;
    border-radius: 10px;
    text-decoration: none;
    display: inline-block; /* 인라인 블록으로 표시 */
    /* 기타 필요한 스타일 */
}
.sub-region-link:hover {
   background-color:  rgb(152, 255, 152);
   /* Change background color on hover */
   text-decoration: none;
   color: rgb(59, 38, 14);
   font-size: 18px;
   transform: scale(1.1);
}
.highlight {
    background-color: rgb(255, 144, 61);
    text-decoration: bold;
    color: rgb(59, 38, 14);
    font-size: 15px;
}
.dynamic-highlight {
    background-color: rgb(152, 255, 152);
    color: black; /* 글씨색은 흰색으로 합니다 */
    font-weight: bold; /* 글씨를 굵게 합니다 */
    /* 기타 원하는 스타일 속성을 추가할 수 있습니다 */
}

</style>
<script>
function checklogin() {
   var login = '<%=session.getAttribute("userId")%>';
   var requestedRegion = '<%=session.getAttribute("locate")%>';
if (login == "null" || login == "") {
   alert("로그인이 필요합니다.")
   window.location.href = 'login.jsp';
   return;
}
window.location.href = 'carpool-map.jsp';
}

function showSubRegions(event, region) {
    event.preventDefault(); // 기본 앵커 이벤트 방지

    var regionsData = {
       '전체': [],   
        '서울': ['종로구', '중구', '용산구','성동구','광진구','동대문구','중랑구','성북구','강북구','도봉구','노원구','은평구','서대문구','마포구','양천구','강서구','구로구','금천구','영등포구','동작구','관악구','서초구','강남구','송파구','강동구'],
        '부산': ['중구', '서구', '동구','영도구','부산진구','동래구','남구','북구','해운대구','사하구','금정구','강서구','연제구','수영구','사상구','기장군'],
        '대구': ['중구', '동구', '서구','남구','북구','수성구','달서구','달성군','군위군'],
        '인천': ['중구', '동구', '미추홀구','연수구','남동구','부평구','계양구','서구','강화군','옹진군'],
        '광주': ['동구', '서구', '남구','북구','광산구'],
          '대전': ['동구','중구','서구','유성구','대덕구'],
       '울산': ['중구','남구','동구','북구','울주군'],
       '세종특별자치시': [],
          '경기': ['수원시','성남시','의정부시','안양시','부천시','광명시','평택시','동두천시','안산시','고양시','과천시','구리시','남양주시','오산시','시흥시','군포시','의왕시','하남시','용인시','파주시','이천시','안성시','김포시','화성시','광주시','양주시','포천시','여주시','연천군','가평군','양평군'],
       '경남': ['창원시','진주시','통영시','사천시','김해시','밀양시','거제시','양산시','의령군','함안군','창녕군','고성군','남해군','하동군','산청군','함양군','거창군','합천군'],
        '경북': ['포항시','경주시','김천시','안동시','구미시','영주시','영천시','상주시','문경시','경산시','의성군','청송군','영양군','영덕군','청도군','고령군','성주군','칠곡군','예천군','봉화군','울진군','울릉군'],
       '충남': ['천안시','공주시','보령시','아산시','서산시','논산시','계룡시','당진시','금산군','부여군','서천군','청양군','홍성군','예산군','태안군'],
       '충북': ['청주시','충주시','제천시','보은군','옥천군','영동군','증평군','진천군','괴산군','음성군','단양군'],
       '전남': ['목포시','여수시','순천시','나주시','광양시','담양군','곡성군','구례군','고흥군','보성군','화순군','장흥군','강진군','해남군','영암군','무안군','함평군','영광군','장성군','완도군','진도군','신안군'],
       '전북': ['전주시','군산시','익산시','정읍시','남원시','김제시','완주군','진안군','무주군','장수군','임실군','순창군','고창군','부안군'],
       '강원특별자치도': ['춘천시','원주시','강릉시','동해시','태백시','속초시','삼척시','홍천군','횡성군','영월군','평창군','정선군','철원군','화천군','양구군','인제군','고성군','양양군'],
       '제주': ['제주시','서귀포시']
    };

    var subRegionsContainer = document.getElementById('sub-regions');
    subRegionsContainer.innerHTML = ''; // 기존 내용 지우기

    var subRegions = regionsData[region];
    if (subRegions) {
        subRegions.forEach(function(subRegion) {
            var subRegionLink = document.createElement('a');
            subRegionLink.href = '#';
            subRegionLink.className = 'region-link sub-region-link';
            subRegionLink.textContent = subRegion;

            // 클릭 이벤트 리스너 추가
            subRegionLink.addEventListener('click', function() {
                // 모든 sub-region-link에서 dynamic-highlight 클래스 제거
                document.querySelectorAll('.sub-region-link').forEach(function(link) {
                    link.classList.remove('dynamic-highlight');
                });

                // 현재 클릭된 버튼에만 dynamic-highlight 클래스 추가
                this.classList.add('dynamic-highlight');

                // 선택된 지역과 하위 지역의 조합에 해당하는 게시물만 표시
                filterPostsByRegion(region + ' ' + subRegion);
            });

            // subRegionLink에 대한 onclick 이벤트 추가 가능
            subRegionsContainer.appendChild(subRegionLink);
        });
    }
}

document.addEventListener('DOMContentLoaded', function() {
    // 모든 지역 링크에 클릭 이벤트 리스너를 추가합니다.
    document.querySelectorAll('.region-link').forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 앵커 동작 방지
            var selectedRegion = this.getAttribute('data-region'); // 클릭된 지역의 이름을 가져옵니다.
            filterPostsByRegion(selectedRegion); // 필터링 함수 호출
        });
    });
});

function filterPostsByRegion(region) {
    // 모든 게시물을 숨깁니다.
    var posts = document.querySelectorAll('.card');
    posts.forEach(function(post) {
        post.style.display = 'none'; // 일단 모든 게시물을 숨깁니다.
    });

    // 선택된 지역 이름을 포함하는 게시물만 표시합니다.
    posts.forEach(function(post) {
        // 여기서는 출발지가 게시물에 텍스트로 포함되어 있다고 가정합니다.
        var postStart = post.querySelector('.card-text.text-primary').textContent;
        if (region === '전체' || postStart.includes(region)) {
            post.style.display = ''; // 해당 지역 이름을 포함하는 게시물만 다시 표시합니다.
        }
    });
}

window.onload = function() {
	  var requestedRegion = '<%=session.getAttribute("locate")%>';
	    
	    // requestedRegion을 빈칸을 기준으로 앞과 뒤로 분리합니다.
	    var regionParts = requestedRegion.split(' ');
	    var city = regionParts[0]; // 앞의 값은 시를 나타냅니다.
	    var district = regionParts[1]; // 뒤의 값은 시군구를 나타냅니다.
	    
	    // "시" 버튼을 찾아 클릭합니다.
	    var cityButton = document.querySelector('.region-link[data-region="' + city + '"]');
	    if (cityButton) {
	        cityButton.click();
	    }
	    
	    // 약간의 대기 시간을 두고 "시군구" 버튼을 클릭합니다.
	    setTimeout(function() {
	        // 모든 sub-region-link 요소를 찾습니다.
	        var subRegionLinks = document.querySelectorAll('.sub-region-link');

	        // foreach 루프를 통해 모든 sub-region-link 요소를 반복합니다.
	        subRegionLinks.forEach(function(link) {
	            // 각 요소의 텍스트 콘텐츠를 확인합니다.
	            var linkText = link.textContent;

	            // 만약 요소의 텍스트가 요청된 지역과 일치하면, 클릭 이벤트를 트리거합니다.
	            if (linkText === district) {
	                link.click();
	            }
	        });
	    }, 10);
};


   
</script>
</head>
<body style="padding-top: 50px; background-color: rgb(254, 247, 222);">
   <header>
      <%
      request.setAttribute("pageTitle", "반려견 카풀");
      %>
      <jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
   </header>
   <main style="margin-bottom: 55px;">
      <div class="container mt-5">
         <div class="row">
            <div id="region-list" style="text-align: center;">
               <a href="#"
                  class="region-link" data-region="전체"
                  onclick="showSubRegions(event, '전체')">전체</a><a href="#"
                  class="region-link" data-region="서울"
                  onclick="showSubRegions(event, '서울')">서울</a> <a href="#"
                  class="region-link" data-region="부산"
                  onclick="showSubRegions(event, '부산')">부산</a> <a href="#"
                  class="region-link" data-region="대구"
                  onclick="showSubRegions(event, '대구')">대구</a> <a href="#"
                  class="region-link" data-region="인천"
                  onclick="showSubRegions(event, '인천')">인천</a> <a href="#"
                  class="region-link" data-region="광주"
                  onclick="showSubRegions(event, '광주')">광주</a> <a href="#"
                  class="region-link" data-region="대전"
                  onclick="showSubRegions(event, '대전')">대전</a> <a href="#"
                  class="region-link" data-region="울산"
                  onclick="showSubRegions(event, '울산')">울산</a> <a href="#"
                  class="region-link" data-region="세종특별자치시"
                  onclick="showSubRegions(event, '세종특별자치시')">세종</a> <a href="#"
                  class="region-link" data-region="경기"
                  onclick="showSubRegions(event, '경기')">경기</a> <a href="#"
                  class="region-link" data-region="경남"
                  onclick="showSubRegions(event, '경남')">경남</a> <a href="#"
                  class="region-link" data-region="경북"
                  onclick="showSubRegions(event, '경북')">경북</a> <a href="#"
                  class="region-link" data-region="충남"
                  onclick="showSubRegions(event, '충남')">충남</a> <a href="#"
                  class="region-link" data-region="충북"
                  onclick="showSubRegions(event, '충북')">충북</a> <a href="#"
                  class="region-link" data-region="전남"
                  onclick="showSubRegions(event, '전남')">전남</a> <a href="#"
                  class="region-link" data-region="전북"
                  onclick="showSubRegions(event, '전북')">전북</a> <a href="#"
                  class="region-link" data-region="강원특별자치도"
                  onclick="showSubRegions(event, '강원특별자치도')">강원</a> <a href="#"
                  class="region-link" data-region="제주"
                  onclick="showSubRegions(event, '제주')">제주</a>


            </div>
            <div id="sub-regions" style="text-align: center;">
               <!-- 여기에 하위 지역 링크가 동적으로 추가됩니다 -->
            </div>
            <div class="col-12">
            <br>
               <button class="btn float-right mb-3" onclick="checklogin();"
                  style="background-color: rgb(115, 182, 119); border-color: rgb(115, 182, 119); color: white;">카풀
                  모집</button>

               <div class="mb-3">
               <br> <br>
               <c:if test="${empty posts}">
                  <div class="alert alert-info">등록된 글이 없습니다.</div>
               </c:if>
               <c:if test="${not empty posts}">
                  <c:forEach items="${posts}" var="post">
                     <div class="card mb-3">
                        <div class="card-body"
                           onclick="window.location.href='/viewPost?id=${post.id}';">
                           <h5 class="card-title">제목: ${post.title}</h5>
                           <p class="card-text text-primary">출발지: ${post.startInput}
                              (${post.startRoadInput})</p>
                           <p class="card-text text-primary">도착지: ${post.endInput}
                              (${post.endRoadInput})</p>
                           <p class="card-text">작성자: ${post.userId}</p>
                           <p class="card-text">등록 시간: ${post.createdAt}</p>
                        </div>
                     </div>
                  </c:forEach>
               </c:if>
               </div>
            </div>
         </div>
      </div>
   </main>
   <%@ include file="/WEB-INF/footer.jsp"%>
</body>
</html>