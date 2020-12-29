package com.kh.tworavel.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tworavel.model.domain.Companion;
import com.kh.tworavel.model.domain.CompanionAdd;
import com.kh.tworavel.model.domain.CompanionInfo;
import com.kh.tworavel.model.domain.CompanionMap;
import com.kh.tworavel.model.domain.CompanionTag;

@Repository("cDao")
public class CompanionDao {
	@Autowired
	private SqlSession sqlSession;

	public void companion(Companion c, CompanionAdd ca, CompanionInfo ci, CompanionMap cm, CompanionTag ct) {
		sqlSession.insert("Companion.insertC", c);
		sqlSession.insert("Companion.insertCAdd", ca);
		sqlSession.insert("Companion.insertCInfo", ci);
		sqlSession.insert("Companion.insertCMap", cm);
		sqlSession.insert("Companion.insertCTag", ct);
		
	}
	public void companion(Companion c) {
		sqlSession.insert("Companion.insertC",c);
	}
	
	
//	public int listCountC() {
//		return sqlSession.selectOne("Companion.listCount");
//	}
//
//
//	public List<Companion> selectListC() {
//		return sqlSession.selectList("Companion.selectList");
//	}
//
//	public List<Companion> selectListC(int startPage, int limit) { // limit:한페이지당 글개수,
//		int offset = (startPage - 1) * limit; // 0~9, 10~19, 20~19
//		RowBounds row = new RowBounds(offset, limit);
//		return sqlSession.selectList("Companion.selectListC", null, row);
//	}
//
//	public Companion selectOneC(String c_id) {
//		return sqlSession.selectOne("Companion.selectOneC", c_id);
//	}
//
//	public int addReadCount(String c_id) {
//		return sqlSession.update("Companion.addReadCount", c_id);
//	}
//
//	public int insertC(Companion c) {
//		return sqlSession.insert("Companion.insertC", c);
//	}
//	public int updateC(Companion c) {
//		return sqlSession.update("Companion.updateC", c);
//	}
//	
//	public int deleteC(String c_id) {
//		return sqlSession.delete("Companion.deleteC", c_id);
//	}

}
