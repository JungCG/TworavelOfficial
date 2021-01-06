package com.kh.tworavel.model.service;

import com.kh.tworavel.model.domain.Out;

public interface OutService {
	Out selectOne(String m_id);
	
	int outCheck(String m_id);
	
	int insertOut(String m_id);
	
	void adminOutMember(Out vo);
}
