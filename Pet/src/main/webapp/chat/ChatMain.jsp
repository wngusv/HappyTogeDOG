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
		function chatWinOpen() {
			var id = document.getElementById("chatId");
			if (id.value == "") {
				alert("아이디를 입력 후 채팅창을 열어주세요.");
				id.focus();
				return;
			}
			window.open("/chat/ChatWindow.jsp?chatId=" + id.value, "",
					"width=320,height=400");
			id.value = "";
		}
	</script>
	<h2>웹소켓 채팅 - 아이디 적용해서 채팅창 띄워주기</h2>
	아이디:
	<input type="text" id="chatId" />
	<button onclick="chatWinOpen();">채팅 참여</button>
</body>
</html>
