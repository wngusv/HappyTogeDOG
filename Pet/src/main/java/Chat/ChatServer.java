package Chat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatingServer")
public class ChatServer {

	private static Map<String, Set<Session>> chatRooms = new HashMap<>();

	@OnOpen
	public void onOpen(Session session) {
		String chatRoom = session.getRequestParameterMap().get("chatRoom").get(0);
		String chatId = session.getRequestParameterMap().get("userId").get(0);
		System.out.println(chatId);
		chatRooms.computeIfAbsent(chatRoom, k -> new HashSet<>()).add(session);
		System.out.println("웹소켓 연결: " + session.getId() + ", 채팅방: " + chatRoom);
	}

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		String chatRoom = session.getRequestParameterMap().get("chatRoom").get(0);
		System.out.println("메시지 전송: " + session.getId() + ", 채팅방: " + chatRoom + ", 내용: " + message);
		synchronized (chatRooms) {
			Set<Session> clients = chatRooms.get(chatRoom);
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	@OnClose
	public void onClose(Session session) {
		String chatRoom = session.getRequestParameterMap().get("chatRoom").get(0);
		chatRooms.get(chatRoom).remove(session);
		System.out.println("웹소켓 종료: " + session.getId() + ", 채팅방: " + chatRoom);
	}

	@OnError
	public void onError(Throwable e) {
		System.out.println("에러 발생");
		e.printStackTrace();
	}
}
