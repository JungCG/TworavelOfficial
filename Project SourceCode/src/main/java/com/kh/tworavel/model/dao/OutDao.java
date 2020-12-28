package com.kh.tworavel.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tworavel.model.domain.Out;

@Repository("oDao")
public class OutDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int outCheck(String m_id) {
		Out out = sqlSession.selectOne("Out.selectOne", m_id);
		
		if(out != null) {
			if(out.getO_status() == 'Y')
				return 0;
			else
				return 1;
		}else {
			return -1;
		}
	}
	
	public int insertOut(String m_id) {
		return sqlSession.insert("Out.insertOut", m_id);
	}
}
