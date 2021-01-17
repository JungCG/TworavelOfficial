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
	@Override
	public List<ChatMessage> selectChatGroup(String m_id) {
		return chDao.selectChatGroup(m_id);
	}
	@Override
	public int insertChatJoin(ChatJoin chatJn) {
		return chDao.insertChatJoin(chatJn);
	}
	@Override
	public int inviteChatMessage(ChatMessage chatmsg) {
		return chDao.inviteChatMessage(chatmsg);
	}
	@Override
	public int insertChatMessage(ChatMessage chatmsg) {
		return chDao.insertChatMessage(chatmsg);
	}
	@Override
	public int checkChatJoin(ChatJoin chatJn) {
		return chDao.checkChatJoin(chatJn);
	}
	@Override
	public int checkInoutChatJoin(ChatJoin chatJn) {
		String ioStr = chDao.checkInoutChatJoin(chatJn);
		int result = 0;
		if(ioStr.equals("I")) {
		}else if(ioStr.equals("O")) {
			result = chDao.updateChatInTime(chatJn);
		}
		return result;
	}
	@Override
	public List<ChatJoin> selectSameRoom(int c_id) {
		return chDao.selectSameRoom(c_id);
	}
	@Transactional
	@Override
	public List<ChatMessage> selectBeforeChat(ChatMessage chatMsg) {
		List<ChatMessage> list = chDao.selectBeforeChat(chatMsg);
		int result = chDao.updateReadChat(chatMsg);
		return list;
	}
	@Override
	public int updateReadChat2(ChatMessage chatMsg) {
		return chDao.updateReadChat2(chatMsg);
	}
	@Override
	public int updateChatOut(ChatJoin chatJn) {
		return chDao.updateChatOut(chatJn);
	}
	@Override
	public int updateChatInTime(ChatJoin chatJn) {
		return chDao.updateChatInTime(chatJn);
	}
	@Override
	public int ChatUnreadServlet(String m_receiver) {
		return chDao.ChatUnreadServlet(m_receiver);
	}
	@Override
	public int selectUnreadChat(ChatMessage chatMsg) {
		return chDao.selectUnreadChat(chatMsg);
	}
	@Override
	public int totalChat(String m_id) {
		return chDao.totalChat(m_id);
	}
	@Override
	public int totalUnreadChat(String m_id) {
		return chDao.totalUnreadChat(m_id);
	}

	
	
}
