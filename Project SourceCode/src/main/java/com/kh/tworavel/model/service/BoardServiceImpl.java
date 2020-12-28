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
	public List<Board> selectSearch(String keyword) {
		return bDao.searchList(keyword);
	}
	@Override
	public List<Board> selectComment(int b_id) {
		return bDao.selectComment(b_id);
	}
	@Override
	public Board selectBoard(int b_id) {
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

}
