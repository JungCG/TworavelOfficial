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
import com.kh.tworavel.model.domain.CompanionLike;
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
		System.out.println("sdsds" + result);
		cm.setC_id(result);
		cDao.companion(cm);
		ct.setC_id(result);
		cDao.companion(ct);
	}

	/*
	 * @Override public void companion1(Companion c) { cDao.companion(c); }
	 */

	@Override
	public List<Companion> selectSearchC(String keyword) {
		return cDao.selectSearchC(keyword);
	}

	@Override
	public void updateOneC(Companion c) {
		cDao.updateOneC(c);
	}

	@Override
	public void updateMapC(CompanionMap cm) {
		cDao.updateMapC(cm);
	}

	@Override
	public void updateTagC(CompanionTag ct) {
		cDao.updateTagC(ct);
	}

//

	@Override
	public int companion(Companion c) {
		int result = cDao.companion(c);
		return result;
	}

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
	public Companion updateC(Companion c) {
		return null;
	}

	@Override
	public void insertCMap(CompanionMap vo) {
		cDao.insertCMap(vo);
	}

	@Override
	public void insertCTag(CompanionTag vo) {
		cDao.insertCTag(vo);
	}

	@Override
	public Companion selectOneC(int c_id) {
		cDao.addCReadCount(c_id);
		return cDao.selectOneC(c_id);
	}

	@Override
	public String selectMapC(CompanionMap vo) {
		return cDao.selectMapC(vo);
	}

	@Override
	public List<Companion> selectTagC(int c_id) {
		return cDao.selectTagC(c_id);
	}

	@Override
	public int selectCmapCount(int c_id) {
		return cDao.selectCmapCount(c_id);
	}

	@Override
	public void updateCMap(CompanionMap vo) {
		cDao.updateCMap(vo);
	}

//	동행글 삭제
	@Override
	public void deleteCMap(int c_id) {
		cDao.deleteC(c_id);
	}

	@Override
	public void deleteCTag(int c_id) {
		cDao.deleteC(c_id);
	}

	@Override
	public void deleteC(int c_id) {
		cDao.deleteC(c_id);
	}

//	동행글 추천/비추천
	@Override
	public void insertCLike(Companion vo) {
		cDao.insertCLike(vo);
	}

	@Override
	public void updateCLikePlus(int c_id) {
		cDao.updateCLikePlus(c_id);
	}

	@Override
	public void updateCLikeMinus(int c_id) {
		cDao.updateCLikeMinus(c_id);
	}

	@Override
	public void deleteCLike(Companion vo) {
		cDao.deleteCLike(vo);
	}

	@Override
	public int selectCLikeMid(Companion vo) {
		return cDao.selectCLikeMid(vo);
	}

	@Override
	public int selectCLikeCount(int c_id) {
		return cDao.selectCLikeCount(c_id);
	}

//	동행 조회수 증가
//	@Override
//	public List<Companion> selectCHotViewList() {
//		return cDao.selectCHotViewList();
//	}
//	@Override
//	public int selectCAllCount() {
//		return cDao.selectCAllCount();
//	}

//	동행 신청
	@Override
	public void insertCInfo(CompanionInfo vo) {
		cDao.insertCInfo(vo);
	}

}
