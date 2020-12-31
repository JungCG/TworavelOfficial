package com.kh.tworavel.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tworavel.model.domain.Gallery;

@Repository("gDao")
public class GalleryDao {
	@Autowired
	private SqlSession sqlSession;

	// public List<Gallery> selectList(int startPage,int limit,String type){ // 특정
	// 페이지 단위의 게시글 조회
	// int startRow = (startPage-1)*limit;
	// RowBounds row = new RowBounds(startRow, limit);
	// return sqlSession.selectList("Gallery.selectList",type,row);
	// }

	public int listCount() { // 전체 글 수 조회
		return sqlSession.selectOne("Gallery.listCount");
	}

	public List<Gallery> selectList(int page, int LIMIT) { // 전체 글 조회
		int offset = (page - 1) * LIMIT; // 0~9, 10~19, 20~29이 코드 오류 있고 별루래영
		RowBounds row = new RowBounds(offset, LIMIT);

		return sqlSession.selectList("Gallery.selectList", null, row);
	}

}
