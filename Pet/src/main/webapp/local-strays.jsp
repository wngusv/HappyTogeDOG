<%@page import="LocalSite.LocalGovernment"%>
<%@page import="LocalStrays.Animal"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>
<body style="padding-top: 150px;">
	<header>
		<nav>
			<ul>
				<li><a href="index.jsp">홈으로</a></li>
				<li><a href="signupform.jsp">회원가입</a></li>
				<li><a id="login-button" href="login.jsp">로그인</a></li>
			</ul>
		</nav>
		<section class="menu">
			<div class="container">
				<ul>
					<li><a href="walk-jobs.jsp">산책 아르바이트</a></li>
					<li><a href="pet-facilities.jsp">반려동물 시설</a></li>
					<li><a href="/AnimalServlet">지역 유기동물</a></li>
					<li><a href="local-shelters.jsp">지역 유기견 보호센터</a></li>
					<li><a href="donations.jsp">기부</a></li>
					<li><a href="board.jsp">게시판</a></li>
				</ul>
			</div>
		</section>
	</header>
	<main>
		<div class="container">
			<section class="strays-info">
				<h2>우리 지역의 유기동물들</h2>
			</section>

			<div class="local-government-buttons">
				<a href="/AnimalServlet?orgName=all">전체</a>
				<%
				List<LocalGovernment> localGovernmentList = (List<LocalGovernment>) request.getAttribute("localGovernmentList");
				for (LocalGovernment government : localGovernmentList) {
				%>
				<a href="/AnimalServlet?orgName=<%=government.getOrgdownNm()%>"><%=government.getOrgdownNm()%></a>
				<%
				}
				%>
			</div>
<!-- 			<form id="stateForm"> -->
<!-- 				<input type="radio" id="all" name="state" value="all"> <label -->
<!-- 					for="all">전체</label> <input type="radio" id="notice" name="state" -->
<!-- 					value="notice"> <label for="notice">공고</label> <input -->
<!-- 					type="radio" id="protect" name="state" value="protect"> <label -->
<!-- 					for="protect">보호</label> -->
<!-- 			</form> -->

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
							<p>
								<strong>Care Addr:</strong>
								<%=animal.getCareAddr()%></p>
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

</html>
