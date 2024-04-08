<%@page import="LocalSite.LocalGovernment"%>
<%@page import="LocalStrays.Animal"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/floating-banner.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet" href="styles.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지역 유기동물</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .card:hover {
            border: 2px solid #000;
        }

        .local-government-buttons {
            padding: 20px;
            text-align: center;
        }

        .local-government-buttons a {
            margin-right: 10px;
        }

        .local-government-buttons a:hover {
            color: aqua;
            text-decoration: none;
        }

        .local-government-button.highlight {
            border: 2px solid black;
        }

        .pages {
            text-align: center;
        }
    </style>
</head>

<body style="padding-top: 150px;">

    <header>
        <% request.setAttribute("pageTitle", "지역 유기동물"); %>
        <jsp:include page="/WEB-INF/headMenu.jsp"></jsp:include>
    </header>

    <main>
        <div class="container">
            <section class="strays-info">
                <h2>${requestScope.nowLocate}의 유기동물들</h2>
            </section>

            <div class="local-government-buttons">
                <a href="/AnimalServlet?orgName=all" class="btn btn-primary local-government-button">전체</a>
                <c:forEach var="government" items="${requestScope.localGovernmentList}">
                    <a id="${government.getOrgdownNm()}" class="btn btn-primary local-government-button"
                        href="/AnimalServlet?orgName=${government.getOrgdownNm()}">${government.getOrgdownNm()}</a>
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
                        <img src="<%=animal.getPopfile()%>" class="card-img-top" alt="동물 이미지">
                        <div class="card-body">
                            <p class="card-text"><strong>종류:</strong> <%=animal.getKindCd()%></p>
                            <p class="card-text"><strong>색상:</strong> <%=animal.getColorCd()%></p>
                            <p class="card-text"><strong>나이:</strong> <%=animal.getAge()%></p>
                            <p class="card-text"><strong>체중:</strong> <%=animal.getWeight()%></p>
                            <p class="card-text"><strong>성별:</strong> <%=animal.getSexCd()%></p>
                            <p class="card-text"><strong>중성화여부:</strong> <%=animal.getNeuterYn()%></p>
                            <p class="card-text"><strong>특징:</strong> <%=animal.getSpecialMark()%></p>
                            <p class="card-text"><strong>관리기관주소:</strong> <%=animal.getCareAddr()%></p>
                        </div>
                    </div>
                </div>
                <%
                    }
                }
                %>
            </div>

            <div class="pages">
                <c:forEach begin="1" end="${pages}" var="pageNumber">
                    <a href="/AnimalServlet?orgName=${nowLocate}&page=${pageNumber}" class="btn btn-primary">${pageNumber}</a>
                </c:forEach>
            </div>

        </div>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2024 Pet. 모든 권리 보유.</p>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        window.onload = function () {
            var nowLocate = "${requestScope.nowLocate}";

            var buttons = document.getElementsByClassName('local-government-button');
            for (var i = 0; i < buttons.length; i++) {
                var button = buttons[i];
                if (button.id.trim() === nowLocate.trim()) {
                    button.classList.add('highlight');
                }
            }

            // "우리 지역"일 경우 "전체" 버튼에 테두리 추가
            if (nowLocate.trim() === "우리 지역") {
                var allButton = document.querySelector('.local-government-buttons a[href="/AnimalServlet?orgName=all"]');
                if (allButton) {
                    allButton.classList.add('highlight');
                }
            }
        };
    </script>
</body>

</html>