package com.kh.tworavel.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.tworavel.model.dao.GalleryDao;
import com.kh.tworavel.model.domain.GAdd;
import com.kh.tworavel.model.domain.Gallery;

@Service
public class GalleryServiceImpl implements GalleryService {
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private GalleryDao gDao;

	public int listCount() {
		return gDao.listCount();
	}

	public List<Gallery> selectList(int page, int LIMIT) {
		return gDao.selectList(page, LIMIT);
	}

	@Override
	public int insertGallery(Gallery gallery) {
		return gDao.insertGallery(gallery);
	}

	@Override
	public int insertGadd(GAdd gadd) {
		return gDao.insertGadd(gadd);
	}

	@Override
	public GAdd selectGalleryAdd(int gallery_num) {
		return gDao.selectGalleryAdd(gallery_num);
	}

	@Override
	public Gallery selectGallery(int gallery_num) {
		// TODO Auto-generated method stub
		return gDao.selectGallery(gallery_num);
	}

}
