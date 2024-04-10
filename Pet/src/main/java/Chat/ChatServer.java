package Chat;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.CloseReason;
import javax.websocket.CloseReason.CloseCodes;
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

		if(!chatId.equals("null")) {
		if (chatRooms.containsKey(chatRoom)) {
			Set<Session> clients = chatRooms.get(chatRoom);
			for (Session client : clients) {
				String existingChatId = client.getRequestParameterMap().get("userId").get(0);
				if (existingChatId.equals(chatId)) {
					try {
						// Reject the new connection
						session.close(new CloseReason(CloseCodes.UNEXPECTED_CONDITION,
								"Another session with the same ID already exists in this chat room."));
						return;
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		chatRooms.computeIfAbsent(chatRoom, k -> new HashSet<>()).add(session);
		System.out.println("웹소켓 연결: " + chatId + ", 채팅방: " + chatRoom);
		broadcastMessage(chatRoom, chatId +'|'+ "채팅방에 입장하였습니다.");
		}else {
			System.out.println("비정상 접속");
		}

	}

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		String chatRoom = session.getRequestParameterMap().get("chatRoom").get(0);
		String chatId = session.getRequestParameterMap().get("userId").get(0);
		System.out.println("메시지 전송: " + chatId + ", 채팅방: " + chatRoom + ", 내용: " + message);
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
		String chatId = session.getRequestParameterMap().get("userId").get(0);
		chatRooms.get(chatRoom).remove(session);
		System.out.println("웹소켓 종료: " + chatId + ", 채팅방: " + chatRoom);
		broadcastMessage(chatRoom, chatId +'|'  + "채팅방에서 퇴장하였습니다.");
	}

	@OnError
	public void onError(Throwable e) {
		System.out.println("에러 발생");
		e.printStackTrace();
	}

	private void broadcastMessage(String chatRoom, String message) {
		synchronized (chatRooms) {
			Set<Session> clients = chatRooms.get(chatRoom);
			for (Session client : clients) {
				try {
					client.getBasicRemote().sendText(message);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
