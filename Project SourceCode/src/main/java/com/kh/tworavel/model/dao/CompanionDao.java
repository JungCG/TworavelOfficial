package com.kh.tworavel.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tworavel.model.domain.Board;
import com.kh.tworavel.model.domain.Companion;
import com.kh.tworavel.model.domain.CompanionAdd;
import com.kh.tworavel.model.domain.CompanionInfo;
import com.kh.tworavel.model.domain.CompanionMap;
import com.kh.tworavel.model.domain.CompanionTag;
import com.kh.tworavel.model.domain.Map;

@Repository("cDao")
public class CompanionDao {
	@Autowired
	private SqlSession sqlSession;

//	public void companion(Companion c, CompanionAdd ca,  CompanionInfo ci, CompanionMap cm, CompanionTag ct) { // 글 등록
//		sqlSession.insert("Companion.insertC", c);
//		sqlSession.insert("Companion.insertCAdd", ca);
//		sqlSession.insert("Companion.insertCInfo", ci);
//		sqlSession.insert("Companion.insertCMap", cm);
//		sqlSession.insert("Companion.insertCTag", ct);
//	}
	public int companion(Companion c) { // 글 등록
		sqlSession.insert("Companion.insertC", c);
		return sqlSession.selectOne("Companion.selectCmaxc_id");
	}

	public int companion(CompanionMap cm) { // 글 등록
		return sqlSession.insert("Companion.insertCMap", cm);
	}

	public int companion(CompanionTag ct) { // 글 등록
		return sqlSession.insert("Companion.insertCTag", ct);
	}

//	public int companion(CompanionAdd ca) { // 글 등록
//		return sqlSession.insert("Companion.insertCAdd", ca);
//	}
//
//	public int companion(CompanionInfo ci) { // 글 등록
//		return sqlSession.insert("Companion.insertCInfo", ci);
//	}

	public int updateC(Companion c, CompanionAdd ca, CompanionInfo ci, CompanionMap cm, CompanionTag ct) {
		sqlSession.update("Companion.insertC", c);
		sqlSession.update("Companion.insertCAdd", ca);
		sqlSession.update("Companion.insertCInfo", ci);
		sqlSession.update("Companion.insertCMap", cm);
		sqlSession.update("Companion.insertCTag", ct);
		return sqlSession.update("Companion.updateC", c);
	}

	public int listCountC() { // 전체 글 수 조회
		return sqlSession.selectOne("Companion.listCountC");
	}

	public List<Companion> selectListC() {
		return sqlSession.selectList("Companion.selectListC");
	}
	
	public List<Companion> selectListCp(int startPage, int limit) { // limit:한페이지당 글개수, 특정 페이지 단위의 게시글 조회
		int startRow = (startPage - 1) * limit; // 0~9, 10~19, 20~19
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Companion.selectListCp", row);
	}
	

	public Board selectCompanion(int c_id) {
		return sqlSession.selectOne("Companion.selectCompanion", c_id);
	}

	public Companion selectOneC(int c_id) {
		return sqlSession.selectOne("Companion.selectOneC", c_id);
	}

	public int addReadCount(int c_id) {
		return sqlSession.update("Companion.addReadCount", c_id);
	}

	public int deleteC(int c_id) {
		return sqlSession.delete("Companion.deleteC", c_id);
	}

}
