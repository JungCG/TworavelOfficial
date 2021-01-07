package com.kh.tworavel.model.domain;

import org.springframework.stereotype.Component;

@Component
public class CompanionInfo implements java.io.Serializable{
	private static final long serialVersionUID = 20001L;
	private int c_id;
	private String m_id2;
	private String m_id;
	private String c_name;
	private String c_yn;
	
	public CompanionInfo() {
		super();
	}

	public CompanionInfo(int c_id, String m_id2, String m_id, String c_name, String c_yn) {
		super();
		this.c_id = c_id;
		this.m_id2 = m_id2;
		this.m_id = m_id;
		this.c_name = c_name;
		this.c_yn = c_yn;
	}

	@Override
	public String toString() {
		return "Companioninfo [c_id=" + c_id + ", m_id2=" + m_id2 + ", m_id=" + m_id + ", c_name=" + c_name + ", c_yn="
				+ c_yn + "]";
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public String getM_id2() {
		return m_id2;
	}

	public void setM_id2(String m_id2) {
		this.m_id2 = m_id2;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_yn() {
		return c_yn;
	}

	public void setC_yn(String c_yn) {
		this.c_yn = c_yn;
	}
	
	
	
	
}
