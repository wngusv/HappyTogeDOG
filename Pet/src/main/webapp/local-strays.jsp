<%@page import="LocalStrays.Animal"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>지역 유기동물</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }

        .card {
            border: 1px solid #ccc;
            border-radius: 5px;
            overflow: hidden;
        }

        .card-image img {
            width: 100%;
            height: auto;
            display: block;
        }

        .card-details {
            padding: 20px;
        }
    </style>
</head>
<body>
<header>
    <div class="container">
        <h1>지역 유기동물 정보</h1>
        <nav>
            <ul>
                <li><a href="index.html">홈으로</a></li>
                <li><a href="signupform.jsp">회원가입</a></li>
                <li><a id="login-button" href="login.html">로그인</a></li>
            </ul>
        </nav>
    </div>
</header>

<main>
    <div class="container">
        <section class="strays-info">
            <h2>우리 지역의 유기동물들</h2>
        </section>
        <div class="card-container">
            <%
            List<Animal> animalList = (List<Animal>) request.getAttribute("animalList");
            if (animalList != null) {
                for (Animal animal : animalList) {
            %>
            <div class="card">
                <div class="card-image">
                    <img src="<%=animal.getPopfile()%>" alt="동물 이미지">
                </div>
                <div class="card-details">
                    <p><strong>Desertion No:</strong> <%=animal.getDesertionNo()%></p>
                    <p><strong>Filename:</strong> <%=animal.getFilename()%></p>
                    <p><strong>Happen Date:</strong> <%=animal.getHappenDt()%></p>
                    <p><strong>Happen Place:</strong> <%=animal.getHappenPlace()%></p>
                    <p><strong>Kind Code:</strong> <%=animal.getKindCd()%></p>
                    <p><strong>Color Code:</strong> <%=animal.getColorCd()%></p>
                    <p><strong>Age:</strong> <%=animal.getAge()%></p>
                    <p><strong>Weight:</strong> <%=animal.getWeight()%></p>
                    <p><strong>Notice No:</strong> <%=animal.getNoticeNo()%></p>
                    <p><strong>Notice Start Date:</strong> <%=animal.getNoticeSdt()%></p>
                    <p><strong>Notice End Date:</strong> <%=animal.getNoticeEdt()%></p>
                    <p><strong>Process State:</strong> <%=animal.getProcessState()%></p>
                    <p><strong>Sex Code:</strong> <%=animal.getSexCd()%></p>
                    <p><strong>Neuter YN:</strong> <%=animal.getNeuterYn()%></p>
                    <p><strong>Special Mark:</strong> <%=animal.getSpecialMark()%></p>
                    <p><strong>Care Name:</strong> <%=animal.getCareNm()%></p>
                    <p><strong>Care Tel:</strong> <%=animal.getCareTel()%></p>
                    <p><strong>Care Addr:</strong> <%=animal.getCareAddr()%></p>
                    <p><strong>Org Name:</strong> <%=animal.getOrgNm()%></p>
                    <p><strong>Charge Name:</strong> <%=animal.getChargeNm()%></p>
                    <p><strong>Office Tel:</strong> <%=animal.getOfficetel()%></p>
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
