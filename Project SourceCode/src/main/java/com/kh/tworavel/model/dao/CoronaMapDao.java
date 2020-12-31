package com.kh.tworavel.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tworavel.model.domain.CoronaMap;

@Repository("cmDao")
public class CoronaMapDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int updateUsingName(CoronaMap cm) {
		return sqlSession.update("CoronaMap.updateUsingName", cm);
	}
	
	public List<CoronaMap> selectList(){
		return sqlSession.selectList("CoronaMap.selectList");
	}
}
