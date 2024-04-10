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
@import	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
.custom-body {
	padding-top: 150px;
	background-color: rgb(254, 247, 222);
}

.local-government-button {
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
.government-button{
background-color: rgb(109, 95, 80);
	font-size: 15px;
	border-radius: 10px; /* Rounded border */
	border: none; /* Remove default border */
	padding: 5px 11px; /* Padding for button */
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	/* Change font */
	cursor: pointer; /* Change cursor to pointer on hover */
	margin: 5px; /* Add margin between buttons */
	color: white;
	display: inline-block;
	/* Hover effect */
	transition: background-color 0.3s ease;
	transition: transform 0.3s ease;
}
.government-button:hover {
	background-color: #ffcc00; /* Change background color on hover */
	text-decoration: none;
	color: black;
	font-size: 18px;
	transform: scale(1.1);
}

.row {
	margin: 120px;
}

.local-government-button:hover {
	background-color: rgb(255, 144, 61);
	/* Change background color on hover */
	text-decoration: none;
	color: rgb(59, 38, 14);
	font-size: 18px;
	transform: scale(1.1);
}

.custom-container {
	max-width: 75%; /* 또는 원하는 너비 */
	margin: 0 auto; /* 중앙 정렬을 위해 좌우 여백을 자동으로 조정합니다. */
}

.card:hover {
	border: 2px solid rgb(111, 94, 75);
}

.local-government-buttons {
	text-align: center;
	background-color: rgb(254, 247, 222);
	padding-top: 30px;
	padding-bottom: 50px;
	height: 0px;
}

.local-government-button.highlight {
	background-color: rgb(255, 144, 61);
	text-decoration: bold;
	color: rgb(59, 38, 14);
	font-size: 15px;
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
						class="government-button">${government.getOrgdownNm()}</a>
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

						</div>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>

<div class="pages">
    <a href="/AnimalServlet?cidoName=${requestScope.currentCido}&page=1" class="btn btn-primary" style="background-color: white; color: rgb(111, 94, 66); border-color: rgb(222, 226, 230);">&lt;&lt; First</a>
    <c:choose>
        <c:when test="${empty requestScope.nowLocate}">
            <c:set var="startPage" value="${currentPage - 5}" />
            <c:if test="${startPage lt 1}">
                <c:set var="startPage" value="1" />
            </c:if>
            <c:set var="endPage" value="${currentPage + 5}" />
            <c:if test="${endPage gt pages}">
                <c:set var="endPage" value="${pages}" />
            </c:if>
            <c:if test="${currentPage gt 1}">
                <a href="/AnimalServlet?cidoName=${requestScope.currentCido}&page=${currentPage - 1}" class="btn btn-primary" style="background-color: white; color: rgb(111, 94, 66); border-color: rgb(222, 226, 230);">&lt; Previous</a>
            </c:if>
            <c:forEach begin="${startPage}" end="${endPage}" var="pageNumber">
                <c:choose>
                    <c:when test="${currentPage eq pageNumber}">
                        <a href="/AnimalServlet?cidoName=${requestScope.currentCido}&page=${pageNumber}" class="btn btn-secondary active" style="background-color: rgb(111, 94, 66); color: white; border-color: rgb(222, 226, 230);">${pageNumber}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="/AnimalServlet?cidoName=${requestScope.currentCido}&page=${pageNumber}" class="btn btn-primary" style="background-color: white; color: rgb(111, 94, 66); border-color: rgb(222, 226, 230);">${pageNumber}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${currentPage lt pages}">
                <a href="/AnimalServlet?cidoName=${requestScope.currentCido}&page=${currentPage + 1}" class="btn btn-primary" style="background-color: white; color: rgb(111, 94, 66); border-color: rgb(222, 226, 230);">Next &gt;</a>
            </c:if>
        </c:when>
        <c:otherwise>
            <c:set var="startPage" value="${currentPage - 5}" />
            <c:if test="${startPage lt 1}">
                <c:set var="startPage" value="1" />
            </c:if>
            <c:set var="endPage" value="${currentPage + 5}" />
            <c:if test="${endPage gt pages}">
                <c:set var="endPage" value="${pages}" />
            </c:if>
            <c:if test="${currentPage gt 1}">
                <a href="/AnimalServlet?cidoName=${requestScope.currentCido}&orgName=${requestScope.nowLocate}&page=${currentPage - 1}" class="btn btn-primary">&lt; Previous</a>
            </c:if>
            <c:forEach begin="${startPage}" end="${endPage}" var="pageNumber">
                <c:choose>
                    <c:when test="${currentPage eq pageNumber}">
                        <a href="/AnimalServlet?cidoName=${requestScope.currentCido}&orgName=${requestScope.nowLocate}&page=${pageNumber}" class="btn btn-secondary active" style="background-color: rgb(111, 94, 66); color: white; border-color: rgb(222, 226, 230);">${pageNumber}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="/AnimalServlet?cidoName=${requestScope.currentCido}&orgName=${requestScope.nowLocate}&page=${pageNumber}" class="btn btn-primary" style="background-color: white; color: rgb(111, 94, 66); border-color: rgb(222, 226, 230);">${pageNumber}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${currentPage lt pages}">
                <a href="/AnimalServlet?cidoName=${requestScope.currentCido}&orgName=${requestScope.nowLocate}&page=${currentPage + 1}" class="btn btn-primary">Next &gt;</a>
            </c:if>
        </c:otherwise>
    </c:choose>
    <a href="/AnimalServlet?cidoName=${requestScope.currentCido}&page=${pages}" class="btn btn-primary" style="background-color: white; color: rgb(111, 94, 66); border-color: rgb(222, 226, 230);">Last &gt;&gt;</a>
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