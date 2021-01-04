package com.kh.tworavel.model.domain;

import org.springframework.stereotype.Component;

@Component
public class Blike {
	private int b_id;
	private String m_id;
	
	public Blike() {}
	
	public Blike(int b_id, String m_id) {
		super();
		this.b_id = b_id;
		this.m_id = m_id;
	}

	@Override
	public String toString() {
		return "Blike [b_id=" + b_id + ", m_id=" + m_id + "]";
	}

	public int getB_id() {
		return b_id;
	}

	public void setB_id(int b_id) {
		this.b_id = b_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	
}
