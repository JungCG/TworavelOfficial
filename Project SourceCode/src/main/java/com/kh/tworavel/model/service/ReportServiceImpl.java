package com.kh.tworavel.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tworavel.model.dao.ReportDao;
import com.kh.tworavel.model.domain.Report;

@Service("rService")
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportDao rdao;
	@Override
	public int selectReportAllCount() {
		return rdao.selectReportAllCount();
	}

	@Override
	public List<Report> selectReportAll(int startPage,int limit) {

		return rdao.selectReportAll(startPage,limit);
	}

	@Override
	public void deleteReport(int r_id) {
		
		rdao.deleteReport(r_id);
		
	}



	
	
	
	
}
