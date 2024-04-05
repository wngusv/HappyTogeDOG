<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
        // Function to open chat window
        function chatWinOpen() {
            var id = '<%= session.getAttribute("userId") %>'; // Note the single quotes around the JSP expression
            if (id === null || id === '') {
                alert("로그인 후 채팅창을 열어주세요.");
                return;
            }
            window.open("/chat/ChatWindow.jsp?chatId=" + id, "", "width=350,height=410");
        }

        // Call the function immediately when the page loads
        window.onload = function() {
            chatWinOpen();
        };
    </script>
</body>
</html>
