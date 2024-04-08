<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chat App</title>
<script>
var chatRoomNum = <%=request.getParameter("chatRoom")%>;
var LoginedId = '<%=session.getAttribute("userId")%>';
var userName = '<%=session.getAttribute("userName")%>'
var webSocket = new WebSocket("<%=application.getInitParameter("CHAT_ADDR")%>/ChatingServer?chatRoom="+chatRoomNum+"&userId="+LoginedId);
var chatWindow, chatMessage, chatId;

window.onload = function() {
    chatWindow = document.getElementById("chatWindow");
    chatMessage = document.getElementById("chatMessage");
    chatId = document.getElementById("chatId").value;
};

function sendMessage() {
    chatWindow.innerHTML += "<div class='myMsg'>" + chatMessage.value + "</div>";
    webSocket.send(userName + '|' + chatMessage.value);
    chatMessage.value = "";
    chatWindow.scrollTop = chatWindow.scrollHeight;
}

function disconnect() {
    webSocket.close();
}

function enterKey() {
    if (window.event.keyCode == 13) {
        sendMessage();
    }
}

webSocket.onopen = function(event) {
    chatWindow.innerHTML += "Connected to WebSocket server.<br>";
};

webSocket.onclose = function(event) {
    chatWindow.innerHTML += "WebSocket server has closed.<br>";
    window.close();
}

webSocket.onerror = function(event) {
    alert(event.data);
    chatWindow.innerHTML += "An error occurred during chat.<br>";
}

webSocket.onmessage = function(event) {
    var message = event.data.split("|");
    var sender = message[0];
    var content = message[1];
    if (content != "") {
        chatWindow.innerHTML += "<div>" + sender + ": <span class='message-content'>" + content + "</span></div>";
        chatWindow.scrollTop = chatWindow.scrollHeight;
    }
};
</script>
<style>
#chatWindow {
    border: 1px solid black;
    width: 300px;
    height: 310px;
    padding: 10px;
    overflow-y: auto;
    background-color: #f9f9f9;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#chatMessage {
    width: 240px;
    height: 30px;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
}

#sendBtn {
    margin-top: 10px;
    height: 36px;
    padding: 0 20px;
    border: none;
    border-radius: 5px;
    background-color: #4caf50;
    color: white;
    cursor: pointer;
}

#sendBtn:hover {
    background-color: #45a049;
}

#closeBtn {
    margin-top: 10px;
    height: 36px;
    padding: 0 20px;
    border: none;
    border-radius: 5px;
    background-color: #f44336;
    color: white;
    cursor: pointer;
}

#closeBtn:hover {
    background-color: #d32f2f;
}

#chatId {
    width: 158px;
    height: 24px;
    border: 1px solid #AAA;
    background-color: #EEE;
    padding: 5px;
    border-radius: 5px;
}

.myMsg {
    text-align: right;
    margin-bottom: 5px;
}

.message-content {
    word-wrap: break-word;
}
</style>
</head>
<body>
    아이디:
    <input type="text" id="chatId" value="${ param.chatId }" readonly />
    <button id="closeBtn" onclick="disconnect();">채팅 종료</button>
    <div id="chatWindow"></div>
    <div>
        <input type="text" id="chatMessage" onkeyup="enterKey();">
        <button id="sendBtn" onclick="sendMessage();">전송</button>
    </div>
</body>
</html>
