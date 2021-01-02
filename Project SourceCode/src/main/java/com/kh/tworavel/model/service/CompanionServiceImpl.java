package com.kh.tworavel.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tworavel.model.dao.CompanionDao;
import com.kh.tworavel.model.domain.Board;
import com.kh.tworavel.model.domain.Companion;
import com.kh.tworavel.model.domain.CompanionAdd;
import com.kh.tworavel.model.domain.CompanionInfo;
import com.kh.tworavel.model.domain.CompanionMap;
import com.kh.tworavel.model.domain.CompanionTag;

@Service("cService")
public class CompanionServiceImpl implements CompanionService {

	@Autowired
	private CompanionDao cDao;

	@Override
	public void companion(Companion c, CompanionMap cm, CompanionTag ct) {
		int result = 0;
		result = cDao.companion(c);
		System.out.println("sdsds"+result);
		cm.setC_id(result);
		cDao.companion(cm);
		ct.setC_id(result);
		cDao.companion(ct);
	}

	/*
	 * @Override public void companion1(Companion c) { cDao.companion(c); }
	 */

	@Override
	public int listCountC() {
		return cDao.listCountC();
	}
	@Override
	public List<Companion> selectListC() {
		return cDao.selectListC();
	}
	@Override
	public List<Companion> selectListCp(int startPage, int limit) {
		return cDao.selectListCp(startPage, limit);
	}

	@Override
	public List<Companion> selectSearchC(String keyword) {
		return cDao.selectSearchC(keyword);
	}

	@Override
	public Companion selectOneC(int c_id) {
		return cDao.selectOneC(c_id);
	}
	@Override
	public List<Companion> selectTwoC(int c_id) {
		return cDao.selectTwoC(c_id);
	}	
	@Override
	public List<Companion> selectThrC(int c_id) {
		return cDao.selectThrC(c_id);
	}	
	
	@Override
	public void updateOneC(Companion c) {
		cDao.updateOneC(c);
	}

	@Override
	public void updateTwoC(CompanionMap cm) {
		cDao.updateTwoC(cm);
	}

	@Override
	public void updateThrC(CompanionTag ct) {
		cDao.updateThrC(ct);
	}
	
	@Override
	public void deleteC(String c_id) {
		
	}

//	@Override
//	public void updateC(Companion c, CompanionMap cm, CompanionTag ct) {
//		int result = 0;
//		result = cDao.companion(c);
//		System.out.println("sdsds"+result);
//		cm.setC_id(result);
//		cDao.companion(cm);
//		ct.setC_id(result);
//		cDao.companion(ct);
//	}

	
//	@Override
//	public int listCountC() {
//		return cDao.listCountC();
//	}
//	@Override
//	public int insertC(Companion c) {
//		return cDao.insertC(c);
//	}
//	@Override
//	public List<Companion> selectListC() {
//		return cDao.selectListC();
//	}
//	@Override
//	public List<Companion> selectListC(int startPage, int limit) {
//		return cDao.selectListC(startPage, limit);
//	}
//	@Override
//	public List<Companion> searchlistC(String keyword) {
//		return cDao.selectListC();
//	}
//	@Override
//	public Companion selectOneC(int c_id) {
//		return null;
//	}
//	@Override
//	public Companion updateC(Companion c) {
//		return null;
//	}
//	@Override
//	public void deleteC(String c_id) {
//	}
//	
	
}
