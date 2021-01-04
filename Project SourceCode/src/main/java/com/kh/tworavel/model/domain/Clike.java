package com.kh.tworavel.model.domain;

import org.springframework.stereotype.Component;

@Component
public class Clike {
	private int c_id;
	private String m_id;
	
	public Clike() {}
	
	public Clike(int c_id, String m_id) {
		super();
		this.c_id = c_id;
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "Clike [c_id=" + c_id + ", m_id=" + m_id + "]";
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
	
	
}
