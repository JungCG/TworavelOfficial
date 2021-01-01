package com.kh.tworavel.model.domain;

import org.springframework.stereotype.Component;

@Component
public class CompanionLike implements java.io.Serializable{
	private static final long serialVersionUID = 20001L;
	
	private int c_id;
	private String m_id;
	
	public CompanionLike() {
		super();
	}
	public CompanionLike(int c_id, String m_id) {
		super();
		this.c_id = c_id;
		this.m_id = m_id;
	}
	@Override
	public String toString() {
		return "CompanionLike [c_id=" + c_id + ", m_id=" + m_id + "]";
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
