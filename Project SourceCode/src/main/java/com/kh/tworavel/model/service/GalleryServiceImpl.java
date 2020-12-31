package com.kh.tworavel.model.service;
	

	import java.util.HashMap;
	import java.util.List;

	import org.apache.ibatis.session.RowBounds;
	import org.apache.ibatis.session.SqlSession;
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.tworavel.model.dao.GalleryDao;
import com.kh.tworavel.model.domain.Gallery;

	@Service
	public class GalleryServiceImpl implements GalleryService{
		@Autowired
		private SqlSession sqlSession;
		
		@Autowired
		private GalleryDao gDao;
		
		
	public int listCount(){
			return gDao.listCount();
		}
	public List<Gallery> selectList(int page, int LIMIT){
		return gDao.selectList(page, LIMIT);
	}
		 
			 
	}


