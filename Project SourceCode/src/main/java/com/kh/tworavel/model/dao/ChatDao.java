package com.kh.tworavel.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tworavel.model.domain.ChatJoin;
import com.kh.tworavel.model.domain.ChatMessage;

@Repository("chDao")
public class ChatDao {
	@Autowired
	private SqlSession sqlSession;
	
	//채팅방 select
	public List<ChatMessage> selectChatGroup(String m_id) {
		return sqlSession.selectList("Chatmessage.selectChatGroup", m_id);
	}
	//채팅방 insert
	public int insertChatJoin(ChatJoin chatJn) {
		return sqlSession.insert("Chatjoin.insertChatJoin", chatJn);
	}
	//채팅메세지 invite
	public int inviteChatMessage(ChatMessage chatmsg) {
		return sqlSession.insert("Chatmessage.inviteChatMessage", chatmsg);
	}
	//채팅메세지 insert
	public int insertChatMessage(ChatMessage chatmsg) {
		String sender = chatmsg.getM_sender();
		String receiver = chatmsg.getM_receiver();
		int result = 0;
		int result2 = 0;
		int result3 = 0;
		if(sender.equals(receiver)) {
			result = sqlSession.insert("Chatmessage.insertChatMessage2", chatmsg);
		}else {
			result2 = sqlSession.insert("Chatmessage.insertChatMessage", chatmsg);
		}
		if(result>0 && result2>0) {
			result3 = 1;
		}
		return result3;
	}
	//채팅 insertCheck
	public int checkChatJoin(ChatJoin chatJn) {
		return sqlSession.selectOne("Chatjoin.checkChatJoin", chatJn);
	}
	//채팅 inout Check
	public String checkInoutChatJoin(ChatJoin chatJn) {
		return sqlSession.selectOne("Chatjoin.checkInoutChatJoin", chatJn);
	}
	//같은 채팅방 사람 조회
	public List<ChatJoin> selectSameRoom(int c_id) {
		return sqlSession.selectList("Chatjoin.selectSameRoom", c_id);
	}
	//이전 채팅 목록
	public List<ChatMessage> selectBeforeChat(ChatMessage chatMsg) {
		return sqlSession.selectList("Chatmessage.selectBeforeChat", chatMsg);
	}
	//읽음
	public int updateReadChat(ChatMessage chatMsg) {
		return sqlSession.update("Chatmessage.updateReadChat", chatMsg);
	}
	public int updateReadChat2(ChatMessage chatMsg) {
		return sqlSession.update("Chatmessage.updateReadChat2", chatMsg);
	}
	//채팅 Out
	public int updateChatOut(ChatJoin chatJn) {
		return sqlSession.update("Chatjoin.updateChatOut", chatJn);
	}
	//채팅 Inout Time
	public int updateChatInTime(ChatJoin chatJn) {
		return sqlSession.update("Chatjoin.updateChatInTime", chatJn);
	}
	// 안읽은 채팅 개수 띄우기
	public int ChatUnreadServlet(String m_receiver) {
		return sqlSession.selectOne("Chatmessage.ChatUnreadServlet", m_receiver);
	}
}
