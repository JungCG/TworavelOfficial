package com.kh.tworavel.model.service;

import java.util.List;

import com.kh.tworavel.model.domain.ChatJoin;
import com.kh.tworavel.model.domain.ChatMessage;


public interface ChatService {

	public List<ChatMessage> selectChatGroup(String m_id);

	public int insertChatJoin(ChatJoin chatJn);

	public int inviteChatMessage(ChatMessage chatmsg);

	public int insertChatMessage(ChatMessage chatmsg);

	public int updateReadChat2(ChatMessage chatmsg);

	public int checkChatJoin(ChatJoin chatJn);

	public int checkInoutChatJoin(ChatJoin chatJn);

	public List<ChatJoin> selectSameRoom(int c_id);

	public List<ChatMessage> selectBeforeChat(ChatMessage chatMsg);

	public int updateChatOut(ChatJoin chatJn);

	public int updateChatInTime(ChatJoin chatJn);
	
	public int ChatUnreadServlet(String m_receiver);

	public int selectUnreadChat(ChatMessage chatmsg);
}
