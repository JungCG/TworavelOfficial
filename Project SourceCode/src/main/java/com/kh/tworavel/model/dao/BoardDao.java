package com.kh.tworavel.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tworavel.model.domain.Board;

@Repository("bDao")
public class BoardDao {
	@Autowired
	private SqlSession sqlSession;

	public List<Board> selectList(int startPage, int limit, String type) { // 특정 페이지 단위의 게시글 조회
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Board.selectList", type, row);
	}

	public List<Board> selectHotViewList() { // 특정 페이지 단위의 게시글 조회

		return sqlSession.selectList("Board.selectHotViewList");
	}

	public int insertBoard(Board b) { // 글 입력
		return sqlSession.insert("Board.insertBoard", b);
	}

	public int addReadCount(String board_num) { // 글 조회 수 증가
		return sqlSession.update("Board.addReadCount", board_num);
	}

	public int listCount(String type) { // 전체 글 수 조회
		return sqlSession.selectOne("Board.listCount", type);
	}

	public List<Board> searchList(String keyword) { // 게시글 검색 조회
		return sqlSession.selectList("Board.selectSearch", keyword);
	}

	public Board selectBoard(int b_id) {
		return sqlSession.selectOne("Board.selectBoard", b_id);
	}

	public List<Board> selectComment(int b_ref) {
		return sqlSession.selectList("Board.selectComment", b_ref);
	}

	public int selectCommentStep(int b_id) {
		return sqlSession.selectOne("Board.selectCommentStep", b_id);
	}

	public void commentInsert(Board vo) {
		sqlSession.insert("Board.commentInsert", vo);
	}

	public void addReadCount(int b_id) {
		sqlSession.update("Board.addReadCount", b_id);
	}

	public void recommentInsert(Board vo) {
		sqlSession.insert("Board.recommentInsert", vo);
	}

	public int selectCommentLevel(HashMap<String, Integer> blist) {
		System.out.println(blist.get("b_ref"));
		System.out.println(blist.get("b_re_step"));
		int result = 0;
		result = sqlSession.selectOne("Board.selectCommentLevel", blist);
		System.out.println("결과+" + result);
		return result;
	}

	public void deleteBoard(int b_id) {
		sqlSession.delete("Board.deleteBoard", b_id);
	}

	public void deleteComment(int b_id) {
		sqlSession.delete("Board.deleteComment", b_id);
	}

	public void deleteRecomment(int b_id) {
		sqlSession.delete("Board.deleteComment", b_id);
	}

	public int selectCommentCount(HashMap<String, Integer> commentinfo) {
		return sqlSession.selectOne("Board.selectCommentCount", commentinfo);
	}

	public void deleteCommentB(int b_id) {

		sqlSession.update("Board.deleteCommentB", b_id);
	}

	public void updateComment(Board vo) {
		sqlSession.update("Board.updateComment", vo);

	}

	public void updateBoard(Board vo) {

		sqlSession.update("Board.updateBoard", vo);
	}

	public int selectLikeMid(Board vo) {
		int result = 0;
		result = sqlSession.selectOne("Board.selectLikeMid", vo);
		return result;
	}

	public void insertLike(Board vo) {

		sqlSession.insert("Board.insertLike", vo);
	}

	public void deleteLike(Board vo) {

		sqlSession.delete("Board.deleteLike", vo);
	}

	public void updateLikePlus(int b_id) {

		sqlSession.update("Board.updateLikePlus", b_id);

	}

	public void updateLikeMinus(int b_id) {
		sqlSession.update("Board.updateLikeMinus", b_id);
	}

	public int selectLikeCount(int b_id) {

		return sqlSession.selectOne("Board.selectLikeCount", b_id);
	}

}
