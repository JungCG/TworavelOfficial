package com.kh.tworavel.model.service;

import java.util.List;



import com.kh.tworavel.model.domain.Blike;
import com.kh.tworavel.model.domain.Board;
import com.kh.tworavel.model.domain.Clike;
import com.kh.tworavel.model.domain.Companion;
import com.kh.tworavel.model.domain.CompanionInfo;
import com.kh.tworavel.model.domain.Favor;
import com.kh.tworavel.model.domain.Member;
import com.kh.tworavel.model.domain.Mlike;
import com.kh.tworavel.model.domain.Report;

public interface MypageService {
	//회원 1명 조회
	public Member selectMember(String m_id);
	//회원 프로필 수정
	public int updateMember(Member m);
	//동행게시판 조회
	public List<Companion> selectCompanionlist(String m_id, int startPage, int limit);
	//좋아요한 동행게시판 조회
	public List<Companion> selectLikeCompanionlist(String m_id, int startPage, int limit);
	//통합게시판 조회
	public List<Board> selectBoardlist(String m_id, int startPage, int limit);
	//좋아요한 게시판 조회
	public List<Board> selectLikeBoardlist(String m_id, int startPage, int limit);
	//동행 신청 내역 조회
	public List<CompanionInfo> selectCompanioninfo(String m_id);
	public List<CompanionInfo> selectCompanioninfo2(String m_id);
	//회원탈퇴
	public int outMember(String m_id);
	//키워드 insert
	public int insertFavor(Favor favor);
	//신고
	public int selectReportStatus(Report report);
	public int insertReport(Report report);
	//추천
	public int selectMlikeStatus(Mlike mlike);
	public int MemberLikeInsert(Mlike mlike);
	public int MemberLikeUpdate(Mlike mlike);
	//키워드 select
	public List<Favor> selectFavordlist(String m_id);
	//키워드 삭제
	public int deleteFavordlist(Favor favor);
	//게시판 좋아요 취소
	public int deleteBoardLikelist(Blike blike);
	//동행게시판 좋아요 취소
	public int deleteCompanionLikelist(Clike clike);
	//작성한 동행글 갯수 조회
	public int selectCompanionCountAll(String m_id);
	//좋아요한 동행글 갯수 조회
	public int selectLikeCompanionCountAll(String m_id);
	//작성한 게시글 갯수 조회
	public int selectBoardCountAll(String m_id);
	//좋아요한 게시글 갯수 조회
	public int selectLikeBoardCountAll(String m_id);
	//동행 수락
	public int updateCompanionOk(CompanionInfo companioninfo);
	//동행 마감
	public int updateCompanionEnd(String c_id);
	public int updateCompanionRe(String c_id);
}
