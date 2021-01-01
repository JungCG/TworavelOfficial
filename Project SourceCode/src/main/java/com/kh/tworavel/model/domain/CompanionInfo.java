package com.kh.tworavel.model.domain;

import org.springframework.stereotype.Component;

@Component
public class CompanionInfo implements java.io.Serializable{
	private static final long serialVersionUID = 20001L;
	private int c_id;
	private String m_id;
	private String c_yn;
	
	public CompanionInfo() {
		super();
	}
	public CompanionInfo(int c_id, String m_id, String c_yn) {
		super();
		this.c_id = c_id;
		this.m_id = m_id;
		this.c_yn = c_yn;
	}
	@Override
	public String toString() {
		return "CompanionInfo [c_id=" + c_id + ", m_id=" + m_id + ", c_yn=" + c_yn + "]";
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getC_yn() {
		return c_yn;
	}
	public void setC_yn(String c_yn) {
		this.c_yn = c_yn;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/*
	 * C_ID NUMBER 
	 * M_ID VARCHAR2(500 BYTE) 
	 * C_YN CHAR(1 BYTE)
	 */
	
	
}
