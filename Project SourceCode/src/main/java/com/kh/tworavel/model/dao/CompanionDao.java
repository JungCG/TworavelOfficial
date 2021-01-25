package com.kh.tworavel.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tworavel.model.domain.Companion;
import com.kh.tworavel.model.domain.CompanionInfo;
import com.kh.tworavel.model.domain.CompanionMap;
import com.kh.tworavel.model.domain.CompanionTag;

@Repository("cDao")
public class CompanionDao {
	@Autowired
	private SqlSession sqlSession;

	public int companion(Companion c) { // 글 등록
	 	sqlSession.update("Member.updatePointCompanionWrite",c.getM_id());
		sqlSession.insert("Companion.insertC", c);
		return sqlSession.selectOne("Companion.selectCmaxc_id");
	}

	public int companion(CompanionMap cm) { // 글 등록
		return sqlSession.insert("Companion.insertCMap", cm);
	}

	public int companion(CompanionTag ct) { // 글 등록
		sqlSession.insert("Companion.insertCTag", ct);
		sqlSession.insert("Companion.insertCTag", ct);
		return sqlSession.insert("Companion.insertCTag", ct);
	}

	public int listCountC() { // 전체 글 수 조회
		return sqlSession.selectOne("Companion.listCountC");
	}

	public List<Companion> selectListC() { // 전체 글 조회
		return sqlSession.selectList("Companion.selectListC");
	}

	public List<Companion> selectListCp(int startPage, int limit) { // limit:한페이지당 글개수, 특정 페이지 단위의 게시글 조회
		int startRow = (startPage - 1) * limit; // 0~9, 10~19, 20~19
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Companion.selectListCp", "", row);
	}

	public List<Companion> selectSearchC(String keyword, int startPage, int limit) { // 게시글 검색 조회
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Companion.selectSearchC", keyword, row);
	}

	public int totalSearchCountC(String keyword) {
		return sqlSession.selectOne("Companion.totalSearchCountC", keyword);
	}

	// 동행글 상세 1,2,3
	public List<Companion> selectMapC(int c_id) { // 동행글 상세 2
		return sqlSession.selectList("CompanionMap.selectMapC", c_id);
	}

	// 동행글 수정 1,2,3
	public int updateOneC(Companion c) {
		return sqlSession.update("Companion.updateOneC", c);
	}

	public int updateMapC(CompanionMap cm) {
		return sqlSession.update("CompanionMap.updateMapC", cm);
	}

	public int updateTagC(CompanionTag ct) {
		return sqlSession.update("CompanionTag.updateTagC", ct);
	}

//	동행글 삭제
	public void deleteC(int c_id) {
		sqlSession.delete("Chatmessage.deleteCChat", c_id);
		sqlSession.delete("Companion.deleteComLike", c_id);
		sqlSession.delete("Companion.deleteCInfo", c_id);
		sqlSession.delete("Companion.deleteCMap", c_id);
		sqlSession.delete("Companion.deleteCTag", c_id);
		sqlSession.delete("Companion.deleteC", c_id);
	}

	public int selectCmapCount(int c_id) {
		return sqlSession.selectOne("Companion.selectCmapCount", c_id);
	}

	public int insertCTag(CompanionTag ct) { // 글 등록
		return sqlSession.insert("Companion.insertCTag", ct);
	}

	public void insertCMap(CompanionMap vo) {
		sqlSession.insert("Companion.insertCMap", vo);
	}

	public Companion selectOneC(int c_id) { // 동행글 상세 1
		return sqlSession.selectOne("Companion.selectOneC", c_id);
	}

	public String selectMapC(CompanionMap vo) { // 동행글 상세 2
		return sqlSession.selectOne("Companion.selectMapC", vo);
	}

	public List<CompanionTag> selectTagC(CompanionTag ct) { // 동행글 상세 3
		return sqlSession.selectList("Companion.selectTagC", ct);
	}

	public void updateCMap(CompanionMap vo) {
		sqlSession.update("Companion.updateCMap", vo);
	}

//	동행글 추천/비추천
	public void insertCLike(Companion vo) {
		sqlSession.insert("Companion.insertCLike", vo);
	}

	public void deleteCLike(Companion vo) {
		sqlSession.delete("Companion.deleteCLike", vo);
	}

	public void updateCLikePlus(int c_id) {
		sqlSession.update("Companion.updateCLikePlus", c_id);
	}

	public void updateCLikeMinus(int c_id) {
		sqlSession.update("Companion.updateCLikeMinus", c_id);
	}

	public int selectCLikeMid(Companion vo) {
		int result = 0;
		result = sqlSession.selectOne("Companion.selectCLikeMid", vo);
		return result;
	}

	public int selectCLikeCount(int c_id) {
		return sqlSession.selectOne("Companion.selectCLikeCount", c_id);
	}

//	동행 조회수 증가
	public int addCReadCount(int c_id) { // 글 조회 수 증가
		return sqlSession.update("Companion.addCReadCount", c_id);
	}

//	동행 신청
	public void insertCInfo(CompanionInfo vo) {
	 	sqlSession.update("Member.updatePointCompanionSubmit", vo.getM_id());
		sqlSession.insert("Companion.insertCInfo", vo);
	}
	    public List<Companion>selectCountarea(){
	    	return sqlSession.selectList("Companion.selectCountarea");
	    }
	    
   public List<Companion>selectCountpeople(){
	    	
	    	return sqlSession.selectList("Companion.selectCountpeople");
	    }
   public List<Companion>selectCounttendency(){
   	
   	return sqlSession.selectList("Companion.selectCounttendency");
   }
   // 동행 글쓰기 포인트 비교
   public int companionlistwrite(String m_id) {
	   return sqlSession.selectOne("Member.companionlistwrite", m_id);
   }
   
   public Companion selectOneCBy(String m_id) {
	   return sqlSession.selectOne("Companion.selectOneCBy", m_id);
   }
   
   public List<Companion> selectFavorML(HashMap<String, Integer> paramMap){
	   return sqlSession.selectList("Companion.selectFavorML", paramMap);
   }
}
