package com.kh.tworavel.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tworavel.model.dao.MapDao;
import com.kh.tworavel.model.domain.Map;

@Service("mapService")
public class MapServiceImpl implements MapService {

	@Autowired
	private MapDao dao;

	@Override
	public List<Map> selectMap() {
		
		List<Map> list = new ArrayList<Map>(); 
				list =dao.selectMap();
		
		return list;
	}
	
	
}
