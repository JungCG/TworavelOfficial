package com.kh.tworavel.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.tworavel.model.domain.Companion;
import com.kh.tworavel.model.domain.Member;
import com.kh.tworavel.model.domain.Out;

public interface MemberService {
	Member selectOne(String m_id);
	
	int loginCheck(String m_id, String m_pw);
	
	int duplecateID(String m_id);
	
	int duplecateNickname(String m_nick);
	
	int duplecateEMAIL(String m_email);
	
	int insertMember(Member m);
	
	String getUserEmailCode(String m_id);
	
	int setUserEmailChecked(String m_id);
	
	Member searchUsingEmail(String m_email);
	
	int updatePwd(HashMap<String, String> paramMap);
	
	int updateLoginDate(String m_id);
	
	String getloginDate(String m_id);
	
	String getCurrentDate();
	
	int updateLoginPoint(String m_id);
	
	List<Member> unEqualLoginDate();
	
	int minusLoginPoint(String m_id);
	
	int selectMemberAllCount();
	
	List<Member>selectMemberAll(int startPage,int limit);
	
	void joinEmailSend(String m_id, String to) throws InterruptedException;
	
	void searchEmailSend(Member m) throws InterruptedException;
	
	void outEmailSend(String Tto, Out vo) throws InterruptedException;

	void deleteCompanionEmailSend(Companion comp, Member m) throws InterruptedException;
	
	void adminminuspoint(String m_id);

}
