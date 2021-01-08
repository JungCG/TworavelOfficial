package com.kh.tworavel.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tworavel.model.dao.ChatDao;
import com.kh.tworavel.model.domain.ChatJoin;
import com.kh.tworavel.model.domain.ChatMessage;

@Service("chService")
public class ChatService {
	@Autowired
	private ChatDao chDao;
	
	public List<ChatMessage> selectChatGroup(String m_id) {
		return chDao.selectChatGroup(m_id);
	}
	public int insertChatJoin(ChatJoin chatJn) {
		return chDao.insertChatJoin(chatJn);
	}
	public int inviteChatMessage(ChatMessage chatmsg) {
		return chDao.inviteChatMessage(chatmsg);
	}
	public int insertChatMessage(ChatMessage chatmsg) {
		return chDao.insertChatMessage(chatmsg);
	}
	public int checkChatJoin(ChatJoin chatJn) {
		return chDao.checkChatJoin(chatJn);
	}
	public List<ChatJoin> selectSameRoom(int c_id) {
		return chDao.selectSameRoom(c_id);
	}
	public List<ChatMessage> selectBeforeChat(ChatMessage chatMsg) {
		return chDao.selectBeforeChat(chatMsg);
	}
	public int updateChatOut(ChatJoin chatJn) {
		return chDao.updateChatOut(chatJn);
	}
	public int updateChatInTime(ChatJoin chatJn) {
		return chDao.updateChatInTime(chatJn);
	}
	
	
}
