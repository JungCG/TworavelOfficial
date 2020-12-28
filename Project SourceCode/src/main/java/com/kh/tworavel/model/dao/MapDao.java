package com.kh.tworavel.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tworavel.model.domain.Map;
@Repository("mDAO")
public class MapDao {

	@Autowired
	private SqlSession sqlSession;
	public List<Map> selectMap(){
		return sqlSession.selectList("Map.selectMap");
	}
}
