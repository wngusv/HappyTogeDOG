<%@page import="LocalStrays.Animal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Animal Details</title>
<style>
/* 스타일링을 추가해도 됩니다. */
.animal-details {
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 20px;
	margin: 10px;
}
</style>
</head>
<body>
	<div class="animal-details">
		<h2>동물 상세 정보</h2>
		<%
		Animal animal = (Animal) request.getAttribute("animal");
		%>
		<img src="<%=animal.getPopfile()%>" alt="동물 이미지">
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
</body>
</html>
