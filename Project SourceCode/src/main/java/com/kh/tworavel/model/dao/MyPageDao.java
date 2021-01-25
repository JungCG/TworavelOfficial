package com.kh.tworavel.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tworavel.model.domain.Blike;
import com.kh.tworavel.model.domain.Board;
import com.kh.tworavel.model.domain.Clike;
import com.kh.tworavel.model.domain.Companion;
import com.kh.tworavel.model.domain.CompanionInfo;
import com.kh.tworavel.model.domain.Favor;
import com.kh.tworavel.model.domain.Member;
import com.kh.tworavel.model.domain.Mlike;
import com.kh.tworavel.model.domain.Report;

@Repository("mypDao")
public class MyPageDao {
	@Autowired
	private SqlSession sqlSession;
	
	//회원 한명 조회
	public Member selectMember(String m_id) {
		return sqlSession.selectOne("Member.My_SelectOne", m_id);
	}
	//프로필 업데이트
	public int updateMember(Member m) {
		return sqlSession.update("Member.My_updateProfile", m);
	}
	//동행게시판 리스트 조회
	public List<Companion> selectCompanionlist(String m_id, int startPage, int limit) {
		int offset = (startPage-1)*limit;	//offset : 없다치는	//limit : 페이지당 글개수
		RowBounds row = new RowBounds(offset, limit);
		return sqlSession.selectList("Companion.My_selectCompanionlist", m_id, row);
	}
	//좋아요한 동행게시판 리스트 조회
	public List<Companion> selectLikeCompanionlist(String m_id, int startPage, int limit) {
		int offset = (startPage-1)*limit;	//offset : 없다치는	//limit : 페이지당 글개수
		RowBounds row = new RowBounds(offset, limit);
		return sqlSession.selectList("Companion.My_selectLikeCompanionlist", m_id, row);
	}
	//게시판 리스트 조회
	public List<Board> selectBoardlist(String m_id, int startPage, int limit) {
		int offset = (startPage-1)*limit;	//offset : 없다치는	//limit : 페이지당 글개수
		RowBounds row = new RowBounds(offset, limit);
		return sqlSession.selectList("Board.My_selectBoardlist", m_id, row);
	}
	//좋아요한 게시판 리스트 조회
	public List<Board> selectLikeBoardlist(String m_id, int startPage, int limit) {
		int offset = (startPage-1)*limit;	//offset : 없다치는	//limit : 페이지당 글개수
		RowBounds row = new RowBounds(offset, limit);
		return sqlSession.selectList("Board.My_selectLikeBoardlist", m_id, row);
	}
	public List<CompanionInfo> selectCompanioninfo(String m_id) {
		return sqlSession.selectList("Companioninfo.My_selectCompanioninfo", m_id);
	}
	public List<CompanionInfo> selectCompanioninfo2(String m_id) {
		return sqlSession.selectList("Companioninfo.My_selectCompanioninfo2", m_id);
	}
	public int jcg_dup_check(CompanionInfo companioninfo) {
		return sqlSession.selectOne("Companioninfo.jcg_dup_check", companioninfo);
	}
	
	//회원탈퇴(Out table update)
	public int outMember(String m_id) {
		return sqlSession.update("Out.My_updateOutMember", m_id);
	}
	//키워드 insert
	public int insertFavor(Favor favor) {
		return sqlSession.insert("Favor.My_insertFavor", favor);
	}
	//키워드 중복확인
	public int selectFavorOne(Favor favor) {
		return sqlSession.selectOne("Favor.My_selectFavorOne", favor);
	}
	//키워드 리스트 조회
	public List<Favor> selectFavordlist(String m_id) {
		return sqlSession.selectList("Favor.My_selectFavordlist", m_id);
	}
	//키워드 삭제
	public int deleteFavordlist(Favor favor) {
		return sqlSession.delete("Favor.My_deleteFavordlist", favor);
	}
	//게시판 좋아요 취소
	public int deleteBoardLikelist(Blike blike) {
		return sqlSession.delete("Blike.My_deleteBoardLikelist", blike);
	}
	//동행게시판 좋아요 취소
	public int deleteCompanionLikelist(Clike clike) {
		return sqlSession.delete("Clike.My_deleteCompanionLikelist", clike);
	}
	public int updateBoardLikeVal(int b_id) {
		return sqlSession.update("Board.My_updateBoardLikeVal", b_id);
	}
	public int updateCompanionLikeVal(int c_id) {
		return sqlSession.update("Companion.My_updateCompanionLikeVal", c_id);
	}
	//작성한 동행글 갯수 조회
	public int selectCompanionCountAll(String m_id) {
		return sqlSession.selectOne("Companion.My_selectCompanionCountAll", m_id);
	}
	//좋아요한 동행글 갯수 조회
	public int selectLikeCompanionCountAll(String m_id) {
		return sqlSession.selectOne("Companion.My_selectLikeCompanionCountAll", m_id);
	}
	//작성한 게시글 갯수 조회
	public int selectBoardCountAll(String m_id) {
		return sqlSession.selectOne("Board.My_selectBoardCountAll", m_id);
	}
	//작성한 게시글 갯수 조회
	public int selectLikeBoardCountAll(String m_id) {
		return sqlSession.selectOne("Board.My_selectLikeBoardCountAll", m_id);
	}
	//동행 수락
	public int updateCompanionOk(CompanionInfo companioninfo) {
		return sqlSession.update("Companioninfo.My_updateCompanionOk", companioninfo);
	}
	//동행 마감
	public int updateCompanionEnd(String c_id) {
		return sqlSession.update("Companion.My_updateCompanionEnd", c_id);
	}
	public int updateCompanionRe(String c_id) {
		return sqlSession.update("Companion.My_updateCompanionRe", c_id);
	}
	public int updateLike(String m_id) {
		return sqlSession.update("Member.My_updateLike", m_id);
	}
	public int selectReportStatus(Report report) {
		return sqlSession.selectOne("Report.My_selectReportStatus", report);
	}
	public int selectMlikeStatus(Mlike mlike) {
		return sqlSession.selectOne("Mlike.My_selectMlikeStatus", mlike);
	}
	public int updateReport(Report report) {
		int result = sqlSession.delete("Report.My_deleteReport", report);
		String m_id = report.getM_id2();
		int result2 = sqlSession.update("Member.My_minusReport", m_id);
		if(result>0 && result2>0) {
			return 1;
		}else {
			return -1;
		}
	}
	public int insertReport(Report report) {
		int result = sqlSession.insert("Report.My_insertReport", report);
		String m_id = report.getM_id2();
		int result2 = sqlSession.update("Member.My_plusReport", m_id);
		if (result>0 &&result2>0) {
			return 1;
		}else {
			return -1;
		}
	}
	public int MemberLikeInsert(Mlike mlike) {
		int result = sqlSession.insert("Mlike.My_MemberLikeInsert", mlike);
		String m_id = mlike.getM_id();
		int result2 = sqlSession.update("Member.My_plusLike", m_id);
		if (result>0 &&result2>0) {
			return 1;
		}else {
			return -1;
		}
	}
	public int MemberLikeUpdate(Mlike mlike) {
		int result = sqlSession.delete("Mlike.My_MemberLikeUpdate", mlike);
		String m_id = mlike.getM_id();
		int result2 = sqlSession.update("Member.My_minusLike", m_id);
		if(result>0 && result2>0) {
			return 1;
		}else {
			return -1;
		}
	}
	
	
}
