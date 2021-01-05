package com.kh.tworavel.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.tworavel.model.domain.Board;



public interface BoardService {
	 int totalCount(String type);
	 List<Board> selectList(int startPage, int limit,String type);
	 List<Board>selectHotViewList();
	 void insertBoard(Board b);
	 List<Board> selectSearch(String keyword,int startPage, int limit);
	 List<Board>selectComment(int b_id);
	 Board selectBoard(int b_id);
	 int selectCommentStep(int b_id);
	 void commentInsert(Board vo);
	 int selectCommentLevel(HashMap<String, Integer> blist);
	 void recommentInsert(Board vo,HashMap<String, Integer> blist);
	 void deleteBoard(int b_id);
	 void deleteComment(int b_id);
	 void deleteRecomment(int b_id);
	 int selectCommentCount(HashMap<String, Integer> commentinfo);
	 void deleteCommentB(int b_id);
	 void updateComment(Board vo);
	 void updateBoard(Board vo);
	 void insertLike(Board vo);
	 void updateLikePlus(int b_id);
	 void updateLikeMinus(int b_id);
	 void deleteLike(Board vo);
	 int selectLikeMid(Board vo);
	 int selectLikeCount(int b_id);
	 int totalSearchCount(String keyword);
	 int selectBoardAllCount();
	 List<Board>selectBoardAll(int startPage, int limit);
}
