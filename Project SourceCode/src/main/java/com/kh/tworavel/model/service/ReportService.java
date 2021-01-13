package com.kh.tworavel.model.service;

import java.util.List;

import com.kh.tworavel.model.domain.Report;

public interface ReportService {

	
	
	int selectReportAllCount();
	List<Report>selectReportAll(int startPage, int limit);
	void deleteReport(int r_id);

}
