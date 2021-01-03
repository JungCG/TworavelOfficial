package com.kh.tworavel.model.service;

import java.util.List;

import com.kh.tworavel.model.domain.Board;
import com.kh.tworavel.model.domain.Companion;
import com.kh.tworavel.model.domain.CompanionAdd;
import com.kh.tworavel.model.domain.CompanionInfo;
import com.kh.tworavel.model.domain.CompanionMap;
import com.kh.tworavel.model.domain.CompanionTag;

public interface CompanionService {
	void companion(Companion c, CompanionMap cm, CompanionTag ct);
//	void companion1(Companion c);

	
	int listCountC ();
	List<Companion> selectListC();
	List<Companion> selectListCp(int startPage, int limit);
	List<Companion> selectSearchC(String keyword);
	void updateOneC(Companion c);
	void updateTwoC(CompanionMap cm);
	void updateThrC(CompanionTag ct);
	void deleteC(String c_id);
	 Companion selectOneC(int c_id);
	  String selectTwoC(CompanionMap vo);
	 List<Companion> selectThrC(int c_id);
	  int selectCmapCount(int c_id);
	  int companion(Companion c);
	void insertCmap(CompanionMap vo);
	void insertCtag(CompanionTag vo);
	Companion updateC(Companion c);
}
