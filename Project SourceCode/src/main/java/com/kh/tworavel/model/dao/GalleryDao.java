package com.kh.tworavel.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tworavel.model.domain.GAdd;
import com.kh.tworavel.model.domain.GLike;
import com.kh.tworavel.model.domain.Gallery;

@Repository("gDao")
public class GalleryDao {
	@Autowired
	private SqlSession sqlSession;

	public int listCount() { // 전체 글 수 조회
		return sqlSession.selectOne("Gallery.listCount");
	}

	public List<Gallery> selectList(int page, int LIMIT) { // 전체 글 조회
		int offset = (page - 1) * LIMIT; // 0~9, 10~19, 20~29이 코드 오류 있고 별루래영
		RowBounds row = new RowBounds(offset, LIMIT);

		return sqlSession.selectList("Gallery.selectList", null, row);
	}
	
	
	public int insertGallery(Gallery gallery) { 
		sqlSession.update("Member.updatePointGalleryWrite",gallery.getM_id());
		return sqlSession.insert("Gallery.insertGallery", gallery);
	}
	
	public int insertGadd(GAdd gadd) { 
		return sqlSession.insert("GAdd.insertGadd", gadd);
	}

	public GAdd selectGalleryAdd(int g_id) {
		return sqlSession.selectOne("GAdd.selectGalleryAdd", g_id);
	}
	public Gallery selectGallery(int g_id) {
		return sqlSession.selectOne("Gallery.selectGallery", g_id);
	}

	public void updateGallery(Gallery g,GAdd ga) {
		// TODO Auto-generated method stub
		sqlSession.update("GAdd.updategadd",ga);
		sqlSession.update("Gallery.updateGallery",g);
	}

	public void deleteGallery(int gallery_num) {
		sqlSession.delete("GAdd.deleteGadd",gallery_num);
		sqlSession.delete("Gallery.deleteGallery",gallery_num);
		
	}
	public void likeGallery(int gallery_num) {
		sqlSession.update("Gallery.likeGallery",gallery_num);
		
	}
	public void unlikeGallery(int gallery_num) {
		sqlSession.update("Gallery.unlikeGallery",gallery_num);
		
	}
	
	public int deleteGLike(GLike glike) {
		return sqlSession.insert("GLike.deleteGLike", glike);
	}
	public int inserGLike(GLike glike) {
		return sqlSession.insert("GLike.inserGLike", glike);
	}
	public int selectGLike(GLike glike) {
		return sqlSession.selectOne("GLike.selectGLike", glike);
	}
}




