package com.kh.tworavel.model.service;

import java.util.List;

import com.kh.tworavel.model.domain.CoronaMap;

public interface CoronaMapService {
	
	int updateUsingName(CoronaMap cm);
	
	List<CoronaMap> selectList();
}
