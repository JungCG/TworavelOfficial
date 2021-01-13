package com.kh.tworavel.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.tworavel.model.dao.ChatDao;
import com.kh.tworavel.model.domain.ChatJoin;
import com.kh.tworavel.model.domain.ChatMessage;

@Service("chService")
public class ChatServiceImpl implements ChatService {
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
	public int checkInoutChatJoin(ChatJoin chatJn) {
		String ioStr = chDao.checkInoutChatJoin(chatJn);
		int result = 0;
		if(ioStr.equals("I")) {
		}else if(ioStr.equals("O")) {
			result = chDao.updateChatInTime(chatJn);
		}
		return result;
	}
	public List<ChatJoin> selectSameRoom(int c_id) {
		return chDao.selectSameRoom(c_id);
	}
	@Transactional
	public List<ChatMessage> selectBeforeChat(ChatMessage chatMsg) {
		List<ChatMessage> list = chDao.selectBeforeChat(chatMsg);
		int result = chDao.updateReadChat(chatMsg);
		return list;
	}
	public int updateReadChat2(ChatMessage chatMsg) {
		return chDao.updateReadChat2(chatMsg);
	}
	public int updateChatOut(ChatJoin chatJn) {
		return chDao.updateChatOut(chatJn);
	}
	public int updateChatInTime(ChatJoin chatJn) {
		return chDao.updateChatInTime(chatJn);
	}

	
	
}
