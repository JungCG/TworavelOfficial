package com.kh.tworavel.model.service;

import com.kh.tworavel.model.domain.Member;

public interface MemberService {
	Member selectOne(String m_id);
	
	int loginCheck(String m_id, String m_pw);
	
	int duplecateID(String m_id);
	
	int duplecateNickname(String m_nick);
	
	int duplecateEMAIL(String m_email);
	
	int insertMember(Member m);
	
	String getUserEmailCode(String m_id);
	
	int setUserEmailChecked(String m_id);
}
