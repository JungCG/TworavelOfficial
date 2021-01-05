package com.kh.tworavel.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tworavel.model.dao.MemberDao;
import com.kh.tworavel.model.domain.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao mDao;
	
	@Override
	public Member selectOne(String m_id) {
		return mDao.selectOne(m_id);
	}

	@Override
	public int loginCheck(String m_id, String m_pw) {
		return mDao.loginCheck(m_id, m_pw);
	}

	@Override
	public int duplecateID(String m_id) {
		return mDao.duplecateID(m_id);
	}

	@Override
	public int duplecateNickname(String m_nick) {
		return mDao.duplecateNickname(m_nick);
	}

	@Override
	public int duplecateEMAIL(String m_email) {
		return mDao.duplecateEMAIL(m_email);
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m);
	}

	@Override
	public String getUserEmailCode(String m_id) {
		return mDao.getUserEmailCode(m_id);
	}

	@Override
	public int setUserEmailChecked(String m_id) {
		return mDao.setUserEmailChecked(m_id);
	}

	@Override
	public Member searchUsingEmail(String m_email) {
		return mDao.searchUsingEmail(m_email);
	}

	@Override
	public int updatePwd(HashMap<String, String> paramMap) {
		return mDao.updatePwd(paramMap);
	}

	@Override
	public int updateLoginDate(String m_id) {
		return mDao.updateLoginDate(m_id);
	}

	@Override
	public String getloginDate(String m_id) {
		return mDao.getloginDate(m_id);
	}

	@Override
	public String getCurrentDate() {
		return mDao.getCurrentDate();
	}

	@Override
	public int updateLoginPoint(String m_id) {
		return mDao.updateLoginPoint(m_id);
	}

	@Override
	public List<Member> unEqualLoginDate() {
		return mDao.unEqualLoginDate();
	}

	@Override
	public int minusLoginPoint(String m_id) {
		return mDao.minusLoginPoint(m_id);
	}
	//陛瘤款何盒(包府磊)
	@Override
	public int selectMemberAllCount() {
		return mDao.selectMemberAllCount();
	}

	@Override
	public List<Member> selectMemberAll(int startPage, int limit) {
		
		return mDao.selectMemberAll(startPage,limit);
	}
	
}
