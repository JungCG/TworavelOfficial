package com.kh.tworavel.model.service;

import java.util.List;

import com.kh.tworavel.model.domain.Companion;
import com.kh.tworavel.model.domain.CompanionAdd;
import com.kh.tworavel.model.domain.CompanionInfo;
import com.kh.tworavel.model.domain.CompanionMap;
import com.kh.tworavel.model.domain.CompanionTag;

public interface CompanionService {
	void companion(Companion c, CompanionAdd ca, CompanionInfo ci, CompanionMap cm, CompanionTag ct);
	void companion1(Companion c);

//	int listCountC ();
//	int insertC(Companion c);
//	
//	List<Companion> selectListC();   // 전체 읽기
//	List<Companion> selectListC(int startPage, int limit);
//	List<Companion> searchlistC(String keyword);
//	
//	Companion selectOneC(int c_id);
//	Companion updateC(Companion c);
//
//	void deleteC(String c_id);
	
}
