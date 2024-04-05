<%@page import="LocalSite.LocalGovernment"%>
<%@page import="LocalStrays.Animal"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역 유기동물</title>
<link rel="stylesheet" href="styles.css">
<style>
.card-container {
	display: grid;
	grid-template-columns: repeat(4, minmax(0, 1fr)); /* 4열로 설정 */
	gap: 20px;
}

.card {
	border: 1px solid #ccc;
	border-radius: 5px;
	overflow: hidden;
}

.card:hover {
	border: 2px solid #000; /* 마우스를 올렸을 때 테두리가 2px 두껍게 나타납니다. */
}

.card-image img {
	width: 100%;
	height: auto;
	display: block;
}

.card-details {
	padding: 20px;
}

.local-government-buttons {
	padding: 20px;
	text-align: center;
}

.local-government-buttons a {
	display: inline-block; /* 링크를 인라인 블록으로 설정하여 수평 정렬 */
	margin-right: 10px; /* 링크 사이의 간격 설정 */
	text-decoration: none; /* 링크의 밑줄 제거 */
	color: #333; /* 링크의 색상 설정 */
}

.local-government-buttons a:hover {
	color: aqua; /* 마우스 호버 시 링크 색상 변경 */
}

.local-government-button.highlight {
	border: 2px solid black;
}
</style>
<body style="padding-top: 150px;">
	<header>
		<%
		request.setAttribute("pageTitle", "지역 유기동물");
		%>
		<jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
	</header>
	<main>
		<div class="container">
			<section class="strays-info">
				<h2>${requestScope.nowLocate}의 유기동물들</h2>
			</section>

			<div class="local-government-buttons">
				<a href="/AnimalServlet?orgName=all" class="local-government-button">전체</a>
				<c:forEach var="government"
					items="${requestScope.localGovernmentList}">
					<c:set var="buttonId" value="${government.getOrgdownNm()}" />
					<a id="${buttonId}" class="local-government-button"
						href="/AnimalServlet?orgName=${government.getOrgdownNm()}">${government.getOrgdownNm()}</a>
				</c:forEach>
			</div>

			<div class="card-container">
				<%
				List<Animal> animalList = (List<Animal>) request.getAttribute("animalList");
				if (animalList != null) {
					for (Animal animal : animalList) {
				%>
				<div class="card">
					<div class="card-image">
						<!-- URL에 desertionNo를 파라미터로 포함하여 페이지 이동 -->
						<a
							href="/AnimalDetailServlet?desertionNo=<%=animal.getDesertionNo()%>&orgName=<%=animal.getOrgNm()%>">
							<img src="<%=animal.getPopfile()%>" alt="동물 이미지">
						</a>
						<div class="card-details">
							<p>
								<strong>유기번호:</strong>
								<%=animal.getDesertionNo()%></p>
							<p>
								<strong>발생일:</strong>
								<%=animal.getHappenDt()%></p>
							<p>
								<strong>발생장소:</strong>
								<%=animal.getHappenPlace()%></p>
							<p>
								<strong>종류:</strong>
								<%=animal.getKindCd()%></p>
							<p>
								<strong>색상:</strong>
								<%=animal.getColorCd()%></p>
							<p>
								<strong>나이:</strong>
								<%=animal.getAge()%></p>
							<p>
								<strong>체즁:</strong>
								<%=animal.getWeight()%></p>
							<p>
								<strong>공고번호:</strong>
								<%=animal.getNoticeNo()%></p>
							<p>
								<strong>공고시작일:</strong>
								<%=animal.getNoticeSdt()%></p>
							<p>
								<strong>공고종료일:</strong>
								<%=animal.getNoticeEdt()%></p>
							<p>
								<strong>처리상태:</strong>
								<%=animal.getProcessState()%></p>
							<p>
								<strong>성별:</strong>
								<%=animal.getSexCd()%></p>
							<p>
								<strong>중성화여부:</strong>
								<%=animal.getNeuterYn()%></p>
							<p>
								<strong>특징:</strong>
								<%=animal.getSpecialMark()%></p>
							<p>
								<strong>관리기관명:</strong>
								<%=animal.getCareNm()%></p>
							<p>
								<strong>관리기관전화번호:</strong>
								<%=animal.getCareTel()%></p>
							<p>
								<strong>관리기관주소:</strong>
								<%=animal.getCareAddr()%></p>
							<p>
								<strong>담당기관:</strong>
								<%=animal.getChargeNm()%></p>
							<p>
								<strong>담당자전화번호:</strong>
								<%=animal.getOfficetel()%></p>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>
		</div>
	</main>


	<footer>
		<div class="container">
			<p>&copy; 2024 Pet. 모든 권리 보유.</p>
		</div>
	</footer>


</body>
<script>
	window.onload = function() {
		var nowLocate = "${requestScope.nowLocate}";

		var buttons = document
				.getElementsByClassName('local-government-button');
		for (var i = 0; i < buttons.length; i++) {
			var button = buttons[i];
			if (button.id.trim() === nowLocate.trim()) {
				button.classList.add('highlight');
			}
		}

		// "우리 지역"일 경우 "전체" 버튼에 테두리 추가
		if (nowLocate.trim() === "우리 지역") {
			var allButton = document
					.querySelector('.local-government-buttons a[href="/AnimalServlet?orgName=all"]');
			if (allButton) {
				allButton.classList.add('highlight');
			}
		}
	};
</script>
</html>