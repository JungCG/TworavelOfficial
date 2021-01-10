package com.kh.tworavel.model.domain;

import org.springframework.stereotype.Component;

@Component
public class Report {
	private int r_id;
	private String m_id;
	private String m_id2;
	private String r_reason;
	
	
	
	public Report() {
		super();
	}

	public Report(int r_id, String m_id, String m_id2, String r_reason) {
		super();
		this.r_id = r_id;
		this.m_id = m_id;
		this.m_id2 = m_id2;
		this.r_reason = r_reason;
	}

	@Override
	public String toString() {
		return "Report [r_id=" + r_id + ", m_id=" + m_id + ", m_id2=" + m_id2 + ", r_reason=" + r_reason + "]";
	}

	public int getR_id() {
		return r_id;
	}

	public void setR_id(int r_id) {
		this.r_id = r_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_id2() {
		return m_id2;
	}

	public void setM_id2(String m_id2) {
		this.m_id2 = m_id2;
	}

	public String getR_reason() {
		return r_reason;
	}

	public void setR_reason(String r_reason) {
		this.r_reason = r_reason;
	}
	
	

}
