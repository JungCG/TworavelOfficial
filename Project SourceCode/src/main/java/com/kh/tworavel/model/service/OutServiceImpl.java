package com.kh.tworavel.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tworavel.model.dao.OutDao;
import com.kh.tworavel.model.domain.Out;

@Service("oService")
public class OutServiceImpl implements OutService{
	@Autowired
	private OutDao oDao;

	@Override
	public Out selectOne(String m_id) {
		return null;
	}

	@Override
	public int outCheck(String m_id) {
		return oDao.outCheck(m_id);
	}

	@Override
	public int insertOut(String m_id) {
		return oDao.insertOut(m_id);
	}

	@Override
	public void adminOutMember(Out vo) {
		
		oDao.adminOutMember(vo);
	}
}
