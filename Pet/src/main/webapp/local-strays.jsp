<%@page import="LocalSite.LocalGovernment"%>
<%@page import="LocalSite.CidoCode"%>
<%@page import="LocalStrays.Animal"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/floating-banner.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="styles.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>지역 유기동물</title>
<style>
.custom-body {
	padding-top: 150px;
	background-color: beige;
}

.local-government-button {
	background-color: yellow;
	font-size: 15px;
	border-radius: 10px; /* Rounded border */
	border: none; /* Remove default border */
	padding: 5px 11px; /* Padding for button */
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	/* Change font */
	cursor: pointer; /* Change cursor to pointer on hover */
	margin: 5px; /* Add margin between buttons */
	color: black;
	display: inline-block;
	/* Hover effect */
	transition: background-color 0.3s ease;
	transition: transform 0.3s ease;
}

.row {
	margin: 120px;
}

.local-government-button:hover {
	background-color: #ffcc00; /* Change background color on hover */
	text-decoration: none;
	color: black;
	font-size: 18px;
	transform: scale(1.1);
}

.custom-container {
	max-width: 75%; /* 또는 원하는 너비 */
	margin: 0 auto; /* 중앙 정렬을 위해 좌우 여백을 자동으로 조정합니다. */
}

.card:hover {
	border: 2px solid #000;
}

.local-government-buttons {
	text-align: center;
	background-color: beige;
	padding-top: 30px;
	padding-bottom: 50px;
	height: 0px;
}

.local-government-button.highlight {
	border: 2px solid black;
	font-weight: bold;
}

.pages {
	text-align: center;
}
</style>
</head>

<body class="custom-body">

	<header>
		<%
		request.setAttribute("pageTitle", "지역 유기동물");
		%>
		<jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
	</header>

	<main>
		<div class="custom-container">
			<section class="strays-info">
				<h2>지역 유기동물</h2>
			</section>

			<div class="local-government-buttons">
				<a href="/AnimalServlet?cidoName=all"
					class="local-government-button">전체</a>
				<c:forEach var="Cido" items="${requestScope.Cido}">
					<a id="${Cido.getOrgCd()}" class="local-government-button"
						href="/AnimalServlet?cidoName=${Cido.getOrgdownNm()}">${Cido.getOrgdownNm()}</a>
				</c:forEach>
			</div>
			<div class="local-government-buttons" id="filteredGovernmentButtons">
				<c:forEach var="government" items="${requestScope.localGovernment}">
					<a
						href="/AnimalServlet?cidoName=${ requestScope.currentCido }&orgName=${government.getOrgdownNm()}"
						class="local-government-button">${government.getOrgdownNm()}</a>
				</c:forEach>
			</div>

			<div class="row">
				<%
				List<Animal> animalList = (List<Animal>) request.getAttribute("animalList");
				if (animalList != null) {
					for (Animal animal : animalList) {
				%>
				<div class="col-md-3 mb-4">
					<div class="card">
						<a
							href="/AnimalDetailServlet?desertionNo=<%=animal.getDesertionNo()%>&orgName=<%=animal.getOrgNm()%>">
							<!-- 이미지를 클릭하면 animal.getLink()의 링크로 이동 --> <img
							src="<%=animal.getPopfile()%>" class="card-img-top" alt="동물 이미지">
						</a>
						<div class="card-body">
							<h5 class="card-title">
								<strong>종류:</strong>
								<p class="card-text"><%=animal.getKindCd()%></p>
							</h5>

							<h5 class="card-title">
								<strong>색상:</strong>
								<p class="card-text"><%=animal.getColorCd()%></p>
							</h5>

							<h5 class="card-title">
								<strong>나이:</strong>
								<p class="card-text"><%=animal.getAge()%></p>
							</h5>

							<h5 class="card-title">
								<strong>체중:</strong>
								<p class="card-text"><%=animal.getWeight()%></p>
							</h5>

							<h5 class="card-title">
								<strong>성별:</strong>
								<p class="card-text"><%=animal.getSexCd()%></p>
							</h5>

							<h5 class="card-title">
								<strong>중성화여부:</strong>
								<p class="card-text"><%=animal.getNeuterYn()%></p>
							</h5>

							<h5 class="card-title">
								<strong>특징:</strong>
								<p class="card-text"><%=animal.getSpecialMark()%></p>
							</h5>

							<h5 class="card-title">
								<strong>관리기관주소:</strong>
								<p class="card-text"><%=animal.getCareAddr()%></p>
							</h5>

						</div>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>

			<div class="pages">
				<c:choose>
					<c:when test="${empty requestScope.nowLocate}">
						<c:forEach begin="1" end="${pages}" var="pageNumber">
							<a
								href="/AnimalServlet?cidoName=${requestScope.currentCido}&page=${pageNumber}"
								class="btn btn-primary">${pageNumber}</a>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach begin="1" end="${pages}" var="pageNumber">
							<a
								href="/AnimalServlet?cidoName=${requestScope.currentCido}&orgName=${requestScope.nowLocate}&page=${pageNumber}"
								class="btn btn-primary">${pageNumber}</a>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>

		</div>
	</main>

	<footer>
		<div class="container">
			<p>&copy; 2024 Pet. 모든 권리 보유.</p>
		</div>
	</footer>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>