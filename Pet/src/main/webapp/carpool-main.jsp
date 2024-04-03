<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>īǮ ����</title>
<link rel="stylesheet" type="text/css" href="styles.css">

</head>
<body>

	<body style="padding-top: 150px;">
	<header>
		<nav>
			<ul>
				<c:choose>
					<c:when test="${sessionScope.userId != null}">
						<li id="username-container"><span id="username-greeting">
								�ȳ��ϼ���, ${sessionScope.userName}��! </span> <a id="logout-button"
							href="./api/logout">�α׾ƿ�</a></li>
					</c:when>
					<c:otherwise>
						<li><a id="login-button" href="login.jsp">�α���</a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="signupform.jsp">ȸ������</a></li>
			</ul>
		</nav>
		<section class="menu">
			<div class="container" style="padding-top: 8px;">
				<ul>
					<li><a href="walk-jobs.jsp">��å �Ƹ�����Ʈ</a></li>
					<li><a href="pet-facilities.jsp">�ݷ����� �ü�</a></li>
					<li><a href="/AnimalServlet">���� ���⵿��</a></li>
					<li><a href="local-shelters.jsp">���� ����� ��ȣ����</a></li>
					<li><a href="donations.jsp">���</a></li>
					<li><a href="board.jsp">�Խ���</a></li>
				</ul>
			</div>
		</section>
	</header>
	<main>
		<div class="container">
			<button onclick="openPopup()">īǮ ����</button>
		</div>
	</main>

	<footer>
		<div class="container">
			<p>&copy; 2024 Pet. ��� �Ǹ� ����.</p>
		</div>
	</footer>
	<script>
		function openPopup() {
			// �˾� â�� ���� ���� �ɼ� ����
			var popupOptions = "width=600,height=400,top=100,left=100";

			// JSP ������ ��ġ�� ���
			var jspUrl = "carpool-test.jsp";

			// �˾� â ����
			window.open(jspUrl, "_blank", popupOptions);
		}
	</script>
	
</body></html>