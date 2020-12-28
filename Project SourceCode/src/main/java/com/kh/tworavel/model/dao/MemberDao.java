package com.kh.tworavel.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tworavel.model.domain.Member;

@Repository("mDao")
public class MemberDao {
	@Autowired
	private SqlSession sqlSession;

	public int loginCheck(String m_id, String m_pw) {
		Member member = sqlSession.selectOne("Member.selectOne", m_id);
		int result = -2;
		if (member != null) {
			if (m_pw.equals(member.getM_pw())) {
				if (member.getM_status() == 'L') {
					result = 2;
				}else {
					result = 1;
				}
			} else {
				result = 0;
			}
		} else {
			result = -1;
		}

		return result;
	}
	
	public int duplecateID(String m_id) {
		int cnt = 0;
		cnt = sqlSession.selectOne("Member.duplecateID",m_id);
		return cnt;
	}
	
	public int duplecateNickname(String m_nick) {
		int cnt = 0;
		cnt = sqlSession.selectOne("Member.duplecateNickname",m_nick);
		return cnt;
	}
	
	public int duplecateEMAIL(String m_email) {
		int cnt = 0;
		cnt = sqlSession.selectOne("Member.duplecateEMAIL",m_email);
		return cnt;
	}
	
	public int insertMember(Member m) {
		return sqlSession.insert("Member.insertMember", m);
	}
	
	public Member selectOne(String m_id) {
		return sqlSession.selectOne("Member.selectOne", m_id);
	}
	
	public String getUserEmailCode(String m_id) {
		return sqlSession.selectOne("Member.getUserEmailCode", m_id);
	}
	
	public int setUserEmailChecked(String m_id) {
		return sqlSession.update("Member.setUserEmailChecked", m_id);
	}
	
	public Member searchUsingEmail(String m_email) {
		return sqlSession.selectOne("Member.searchUsingEmail", m_email);
	}
	
	public int updatePwd(HashMap<String, String> paramMap) {
		return sqlSession.update("Member.updatePwd", paramMap);
	}
}
