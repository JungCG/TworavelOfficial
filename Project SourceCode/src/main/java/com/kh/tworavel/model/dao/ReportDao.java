package com.kh.tworavel.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tworavel.model.domain.Report;

@Repository("rDao")
public class ReportDao {

	
	
	@Autowired
	private SqlSession sqlSession;
	public int selectReportAllCount() {
		return sqlSession.selectOne("Report.selectReportAllCount");
	}
	public List<Report>selectReportAll(int startPage,int limit){
		 int startRow = (startPage-1)*limit;
		 RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Report.selectReportAll","",row);
	}
	
	public void deleteReport(int r_id) {
		
		sqlSession.delete("Report.deleteReport",r_id);
	}
}
