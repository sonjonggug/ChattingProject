package com.example.toy.service;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Service;

import com.example.toy.jpa.LoginRepository;
import com.example.toy.jpa.LoginUser;
/**
 WebSocketChatService는 클라이언트가 접속할 때마다 생성되어 클라이언트와 직접 통신하는 클래스입니다. 
 따라서 새로운 클라이언트가 접속할 때마다 클라이언트의 세션 관련 정보를 정적형으로 저장하여 1:N의 통신이 가능하도록 만들어야 합니다.
 */
@Service
@ServerEndpoint(value="/chatt")
public class WebSocketChatService {
	private static Set<Session> clients = 
			Collections.synchronizedSet(new HashSet<Session>());
	
	/**
	 @throws Exception 
	 * @OnOpen : 클라이어트가 접속할 때
	 클라이언트가 ServerEndpoint값인  “/chatt “ url로 서버에 접속하게 되면 onOpen 메서드가 실행되며
	 클라이언트 정보를 매개변수인 Session 객체를 통해 전달받습니다. 
	 이때 정적 필드인 clients에 해당 session이 존재하지 않으면 clients에 접속된 클라이언트를 추가합니다.
	 */
	@OnOpen
	public void onOpen(Session s ) throws Exception {
		System.out.println("open session : " + s.toString());
		if(!clients.contains(s)) {
			clients.add(s);			
			System.out.println("session open : " + s);
			System.out.println("clients.size : " + clients.size());
			
		}else {
			System.out.println("이미 연결된 session 임!!!");
		}
	}
	
	/**
	 @OnMessage : 메시지가 수신되었을 때	
	 클라이언트로부터 메시지가 전달되면 WebSocketChatService 클래스의 onMessage 메서드에 의해  clients에 있는 모든 session에 메시지를 전달합니다.
	 */
	@OnMessage
	public void onMessage(String msg, Session session) throws Exception{
		System.out.println("receive message : " + msg);
		System.out.println("clients.OnMessage : " + clients.size());
		for(Session s : clients) {
			System.out.println("send data : " + msg);
			s.getBasicRemote().sendText(msg);

		}
		
	}	
	/**
	 @OnClose : 클라이언트가 브라우저를 끄거나 다른 경로로 이동할 때
	 클라이언트가 url을 바꾸거나 브라우저를 종료하면 자동으로 onClose() 메서드가 실행되며 해당 클라이언트 정보를 clients에서 제거합니다.	 	
	 */
	@OnClose
	public void onClose(Session s) {
		System.out.println("session close : " + s);
		clients.remove(s);
	}
}
