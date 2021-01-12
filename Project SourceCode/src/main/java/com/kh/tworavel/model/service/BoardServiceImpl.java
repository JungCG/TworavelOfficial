package com.kh.tworavel.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tworavel.model.dao.BoardDao;
import com.kh.tworavel.model.domain.Board;

@Service("bService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao bDao;
	@Override
	public int totalCount(String type) {
		return bDao.listCount(type);
	}
	@Override
	public List<Board> selectList(int startPage, int limit,String type) {
		return bDao.selectList(startPage,limit,type);
	}
	@Override
	public void insertBoard(Board b) {
		bDao.insertBoard(b);
	}
	@Override
	public List<Board> selectSearch(String keyword,int startPage,int limit) {
		return bDao.searchList(keyword,startPage,limit);
	}
	@Override
	public List<Board> selectComment(int b_id) {
		return bDao.selectComment(b_id);
	}
	@Override
	public Board selectBoard(int b_id) {
		bDao.addReadCount(b_id);
		return bDao.selectBoard(b_id);
	}
	@Override
	public int selectCommentStep(int b_id) {
		return bDao.selectCommentStep(b_id);
	}
	@Override
	public void commentInsert(Board vo) {
		vo.setB_re_step(bDao.selectCommentStep(vo.getB_ref()));;	
		bDao.commentInsert(vo);
	}
	@Override
	public int selectCommentLevel(HashMap<String, Integer> blist) {
		return bDao.selectCommentLevel(blist);
	}
	@Override
	public void recommentInsert(Board vo,HashMap<String, Integer> blist) {
		vo.setB_re_level(bDao.selectCommentLevel(blist));
		System.out.println("몇번이냐"+vo.getB_re_level());
		bDao.recommentInsert(vo);
	}
	@Override
	public void deleteBoard(int b_id) {
		bDao.deleteBoard(b_id);
		
	}
	@Override
	public void deleteComment(int b_id) {
		bDao.deleteComment(b_id);
	}
	@Override
	public void deleteRecomment(int b_id) {

		bDao.deleteComment(b_id);
		
	}
	public int selectCommentCount(HashMap<String, Integer> commentinfo) {
		
		return bDao.selectCommentCount(commentinfo);
	}
	@Override
	public void deleteCommentB(int b_id) {

bDao.deleteCommentB(b_id);
		
	}
	@Override
	public void updateComment(Board vo) {
		bDao.updateComment(vo);
		
	}
	@Override
	public void updateBoard(Board vo) {
		
		bDao.updateBoard(vo);
	}

	@Override
	public int selectLikeMid(Board vo) {
		return bDao.selectLikeMid(vo);
	}
	@Override
	public void insertLike(Board vo) {
		bDao.insertLike(vo);
	}
	@Override
	public void updateLikePlus(int b_id) {
		bDao.updateLikePlus(b_id);
	}
	@Override
	public void updateLikeMinus(int b_id) {
		bDao.updateLikeMinus(b_id);
	}
	@Override
	public void deleteLike(Board vo) {
			bDao.deleteLike(vo);
	}
	@Override
	public int selectLikeCount(int b_id) {
		return bDao.selectLikeCount(b_id);
	}
	@Override
	public List<Board> selectHotViewList() {
		return bDao.selectHotViewList();
	}
	@Override
	public int totalSearchCount(String keyword) {
		return bDao.totalSearchCount(keyword);
	}
	@Override
	public int selectBoardAllCount() {

		return bDao.selectBoardAllCount();
	}
	public List<Board>selectBoardAll(int startPage, int limit){
		return bDao.selectBoardAll(startPage,limit);
	}
	@Override
	public int selectRecommentCount(Board vo) {
		
		return bDao.selectRecommentCount(vo);
	}
	@Override
	public void deleteCommentC(Board vo) {

		bDao.deleteCommentC(vo);
	}
	@Override
	public String selectCommentContent(Board vo) {
		
		return bDao.selectCommentContent(vo);
		
	}
}
