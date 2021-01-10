package com.kh.tworavel.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.tworavel.model.dao.MyPageDao;
import com.kh.tworavel.model.domain.Blike;
import com.kh.tworavel.model.domain.Board;
import com.kh.tworavel.model.domain.Clike;
import com.kh.tworavel.model.domain.Companion;
import com.kh.tworavel.model.domain.CompanionInfo;
import com.kh.tworavel.model.domain.Favor;
import com.kh.tworavel.model.domain.Member;
import com.kh.tworavel.model.domain.Mlike;
import com.kh.tworavel.model.domain.Report;

@Service("mypService")
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MyPageDao mypDao;

	@Override
	public Member selectMember(String m_id) {
		return mypDao.selectMember(m_id);
	}

	@Override
	public int updateMember(Member m) {
		return mypDao.updateMember(m);
	}

	@Override
	public List<Companion> selectCompanionlist(String m_id, int startPage, int limit) {
		return mypDao.selectCompanionlist(m_id, startPage, limit);
	}
	
	@Override
	public List<Companion> selectLikeCompanionlist(String m_id, int startPage, int limit) {
		return mypDao.selectLikeCompanionlist(m_id, startPage, limit);
	}
	
	@Override
	public List<Board> selectBoardlist(String m_id, int startPage, int limit) {
		return mypDao.selectBoardlist(m_id, startPage, limit);
	}
	
	@Override
	public List<Board> selectLikeBoardlist(String m_id, int startPage, int limit) {
		return mypDao.selectLikeBoardlist(m_id, startPage, limit);
	}
	
	@Override
	public List<CompanionInfo> selectCompanioninfo(String m_id) {
		return mypDao.selectCompanioninfo(m_id);
	}
	@Override
	public List<CompanionInfo> selectCompanioninfo2(String m_id) {
		return mypDao.selectCompanioninfo2(m_id);
	}

	@Override
	public int outMember(String m_id) {
		return mypDao.outMember(m_id);
	}
	
	@Override
	public int insertFavor(Favor favor) {
		int result = mypDao.selectFavorOne(favor);
		if(result>0) {
			return -1;
		}else {
			return mypDao.insertFavor(favor);
		}
	}
	
	@Override
	public List<Favor> selectFavordlist(String m_id) {
		return mypDao.selectFavordlist(m_id);
	}
	@Override
	public int deleteFavordlist(Favor favor) {
		return mypDao.deleteFavordlist(favor);
	}
	@Override
	@Transactional
	public int deleteBoardLikelist(Blike blike) {
		int result, result2 = 0;
		result = mypDao.deleteBoardLikelist(blike);
		if(result>0) {
			result2 = mypDao.updateBoardLikeVal(blike.getB_id());	//-1
			if(result2>0) 
				return result2;
			else 
				return -1;
		}else {
			return -1;
		}
		
	}
	@Override
	@Transactional
	public int deleteCompanionLikelist(Clike clike) {
		int result, result2 = 0;
		result = mypDao.deleteCompanionLikelist(clike);
		if(result>0) {
			result2 = mypDao.updateCompanionLikeVal(clike.getC_id());	//-1
			if(result2>0) 
				return result2;
			else 
				return -1;
		}else {
			return -1;
		}
		
	}
	@Override
	public int selectCompanionCountAll(String m_id) {
		return mypDao.selectCompanionCountAll(m_id);
	}
	@Override
	public int selectLikeCompanionCountAll(String m_id) {
		return mypDao.selectLikeCompanionCountAll(m_id);
	}
	
	@Override
	public int selectBoardCountAll(String m_id) {
		return mypDao.selectBoardCountAll(m_id);
	}
	@Override
	public int selectLikeBoardCountAll(String m_id) {
		return mypDao.selectLikeBoardCountAll(m_id);
	}
	
	@Override
	public int updateCompanionOk(CompanionInfo companioninfo) {
		return mypDao.updateCompanionOk(companioninfo);
	}
	
	@Override
	public int updateCompanionEnd(String c_id) {
		return mypDao.updateCompanionEnd(c_id);
	}
	
	@Override
	public int updateCompanionRe(String c_id) {
		return mypDao.updateCompanionRe(c_id);
	}
	@Override
	public int selectReportStatus(Report report) {
		return mypDao.selectReportStatus(report);
	}
	@Override
	public int insertReport(Report report) {
		return mypDao.insertReport(report);
	}

	@Override
	public int selectMlikeStatus(Mlike mlike) {
		return mypDao.selectMlikeStatus(mlike);
	}

	@Override
	public int MemberLikeInsert(Mlike mlike) {
		return mypDao.MemberLikeInsert(mlike);
	}
	@Override
	public int MemberLikeUpdate(Mlike mlike) {
		return mypDao.MemberLikeUpdate(mlike);
	}
	
	

}
