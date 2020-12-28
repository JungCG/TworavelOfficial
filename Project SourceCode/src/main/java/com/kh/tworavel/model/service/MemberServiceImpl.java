package com.kh.tworavel.model.service;

import java.util.HashMap;

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

	
}
