package com.kh.tworavel.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.tworavel.model.domain.Board;
import com.kh.tworavel.model.domain.Companion;
import com.kh.tworavel.model.domain.CompanionAdd;
import com.kh.tworavel.model.domain.CompanionInfo;
import com.kh.tworavel.model.domain.CompanionLike;
import com.kh.tworavel.model.domain.CompanionMap;
import com.kh.tworavel.model.domain.CompanionTag;

public interface CompanionService {
	void companion(Companion c, CompanionMap cm, CompanionTag ct);

	int listCountC ();
	int companion(Companion c);
	int selectCmapCount(int c_id);
	int totalSearchCountC(String keyword);
	
	List<Companion> selectListC();
	List<Companion> selectListCp(int startPage, int limit);
	List<Companion> selectSearchC(String keyword,int startPage, int limit);
	
	void insertCMap(CompanionMap vo);
	void insertCTag(CompanionTag vo);
	void updateOneC(Companion c);
	void updateMapC(CompanionMap cm);
	void updateCMap(CompanionMap vo);
	void updateTagC(CompanionTag ct);
	
//	동행글 삭제
	void deleteC(int c_id);
	void deleteCMap(int c_id);
	void deleteCTag(int c_id);
	void deleteCChat(int c_id);
	
	
	String selectMapC(CompanionMap vo);
	List<CompanionTag> selectTagC(CompanionTag ct);

	Companion selectOneC(int c_id);
	Companion updateC(Companion c);
	
//	동행글 추천/비추천
	 void insertCLike(Companion vo);
	 void updateCLikePlus(int c_id);
	 void updateCLikeMinus(int c_id);
	 void deleteCLike(Companion vo);
	 int selectCLikeMid(Companion vo);
	 int selectCLikeCount(int c_id);

//	 동행 조회수 증가
//	 List<Companion>selectCHotViewList();
//	 int selectCAllCount();

	 // 동행 글쓰기 포인트 비교
	 int companionlistwrite(String m_id);
	 
	 //	 동행 신청
	 void insertCInfo(CompanionInfo vo);

	 List<Companion>selectCountarea();
	 List<Companion>selectCountpeople();
	 List<Companion>selectCounttendency();
	 
	 Companion selectOneCBy(String m_id);
	 
	 List<Companion> selectFavorML(HashMap<String, Integer> paramMap);
	 
	 void favorEmailSend(String m_id, String m_email, Companion comp);
}
