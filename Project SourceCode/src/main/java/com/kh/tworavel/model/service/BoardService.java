package com.kh.tworavel.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.tworavel.model.domain.Board;



public interface BoardService {
	 int totalCount(String type);
	 List<Board> selectList(int startPage, int limit,String type);
	 void insertBoard(Board b);
	 List<Board> selectSearch(String keyword);
	 List<Board>selectComment(int b_id);
	 Board selectBoard(int b_id);
	 int selectCommentStep(int b_id);
	 void commentInsert(Board vo);
	 int selectCommentLevel(HashMap<String, Integer> blist);
	 void recommentInsert(Board vo,HashMap<String, Integer> blist);
}
