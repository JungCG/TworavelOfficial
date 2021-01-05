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

	int listCountC ();
	int companion(Companion c);
	int selectCmapCount(int c_id);
	
	List<Companion> selectListC();
	List<Companion> selectListCp(int startPage, int limit);
	List<Companion> selectSearchC(String keyword);
	
	void insertCMap(CompanionMap vo);
	void insertCTag(CompanionTag vo);
	void updateOneC(Companion c);
	void updateMapC(CompanionMap cm);
	void updateCMap(CompanionMap vo);
	void updateTagC(CompanionTag ct);
	void deleteC(String c_id);
	
	String selectMapC(CompanionMap vo);
	List<Companion> selectTagC(int c_id);

	Companion selectOneC(int c_id);
	Companion updateC(Companion c);
}
