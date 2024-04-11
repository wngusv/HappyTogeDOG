<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
    /* Floating Banner CSS */
    #floating-banner {
        position: fixed; /* Fixed position to float on the screen */
        top: 170px; /* Distance from the bottom */
        right: 20px; /* Distance from the right */
        background-color: transparent; /* Banner background color */
        color: white; /* Text color */
        padding: 0px; /* Padding inside the banner */
        z-index: 1000; /* Ensure it stays on top of other content */
        cursor: pointer; /* Change mouse cursor on hover */
        border-radius: 0px; /* Rounded corners for aesthetic */
    }

    /* Second Floating Banner CSS */
    #floating-banner2 {
        position: fixed; /* Fixed position to float on the screen */
        top: 510px; /* Distance from the bottom, adjusted to be below the first banner */
        right: 20px; /* Distance from the right */
        background-color: transparent; /* Banner background color */
        color: white; /* Text color */
        padding: 0px; /* Padding inside the banner */
        z-index: 1000; /* Ensure it stays on top of other content */
        cursor: pointer; /* Change mouse cursor on hover */
        border-radius: 0px; /* Rounded corners for aesthetic */
    }
</style>
</head>
<body>

<!-- First Floating Banner HTML -->
<div id="floating-banner">
    <a href="donations.jsp">
        <img src="/images/플로팅배너.png" alt="기부하기">
    </a>
</div>

<!-- Second Floating Banner HTML -->
<div id="floating-banner2">
       <a href="https://www.animal.go.kr/front/community/show.do?boardId=contents&seq=53&menuNo=1000000058" target="_blank">
        <img src="/images/입양3.png" alt="입양하기">
    </a>
</div>

</body>
</html>
