package com.kh.tworavel.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tworavel.model.dao.CoronaMapDao;
import com.kh.tworavel.model.domain.CoronaMap;

@Service("cmService")
public class CoronaMapServiceImpl implements CoronaMapService{
	
	@Autowired
	private CoronaMapDao cmDao;
	
	@Override
	public int updateUsingName(CoronaMap cm) {
		return cmDao.updateUsingName(cm);
	}

	@Override
	public List<CoronaMap> selectList() {
		return cmDao.selectList();
	}

}
