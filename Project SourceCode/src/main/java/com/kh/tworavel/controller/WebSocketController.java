package com.kh.tworavel.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;



@Controller
@ServerEndpoint(value="/echo.do/{c_id}")
public class WebSocketController{
	
	//private static List<Session> sessionList = new ArrayList<Session>();
	
	// (<"bang_id",방ID>, <"session",세션>) - (<"bang_id",방ID>, <"session",세션>) - (<"bang_id",방ID>, <"session",세션>) 형태 
	private static final List<Map<String, Object>> sessList = new ArrayList<Map<String, Object>>();
	
    private static final Logger logger = LoggerFactory.getLogger(WebSocketController.class);
    
    public WebSocketController() {
    }
    
    @OnOpen
    public void onOpen(Session session, @PathParam("c_id") int c_id) {
        try {
            final Basic basic = session.getBasicRemote();
//            basic.sendText("대화방에 연결 되었습니다.");
            
        }catch (Exception e) {
            e.printStackTrace();
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("c_id", String.valueOf(c_id));
        map.put("session", session);
        sessList.add(map);
        
    }
    
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param sender
     * @param message
     */
    //같은방 사람들에게 보내기
    private void sendAllSessionToMessage(Session self, String sender, String message, String c_id) {
    	try {
	    	for (int i = 0; i < sessList.size(); i++) {
				Map<String, Object> mapSessionList = sessList.get(i);
				String list_c_id = (String) mapSessionList.get("c_id");
				Session list_sess = (Session) mapSessionList.get("session");
				//방번호가 같다면 && 자신이 아니라면
				if (c_id.equals(list_c_id) && self.getId()!=list_sess.getId()) {
						list_sess.getBasicRemote().sendText(sender + "§" + message);
				}else {
//					System.out.println("메세지 전송 실패");
				}
				sendAllSessionToRoom(self,sender,message,c_id);
			}
    	}catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    private void sendAllSessionToRoom(Session self, String sender, String message, String c_id) {
    	try {
	    	for (int i = 0; i < sessList.size(); i++) {
				Map<String, Object> mapSessionList = sessList.get(i);
				String list_c_id = (String) mapSessionList.get("c_id");
				Session list_sess = (Session) mapSessionList.get("session");

				list_sess.getBasicRemote().sendText("®" + "§" + sender + "§" + message + "§" + c_id);
				
			}
    	}catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    /*
     * 내가 입력하는 메세지
     * @param message
     * @param session
     */
	@OnMessage
	public void onMessage(String message, Session session) {
		String c_id = message.split("§")[2];
		String sender = message.split("§")[1];
		message = message.split("§")[0];
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText(sender + "§" + message);
			// 같은방 사람들에게 보내기
		} catch (Exception e) {
			e.printStackTrace();
		}
		sendAllSessionToMessage(session, sender, message, c_id);
	}
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    @OnClose
    public void onClose(Session session, @PathParam("c_id") int c_id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("c_id", String.valueOf(c_id));
        map.put("session", session);
        sessList.remove(map);
    }
}
