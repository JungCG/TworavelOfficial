package com.kh.tworavel.model.domain;

import org.springframework.stereotype.Component;

@Component
public class Mlike {
	private String m_id;
	private String m_id2;
	
	
	
	public Mlike() {
		super();
	}



	public Mlike(String m_id, String m_id2) {
		super();
		this.m_id = m_id;
		this.m_id2 = m_id2;
	}



	@Override
	public String toString() {
		return "Mlike [m_id=" + m_id + ", m_id2=" + m_id2 + "]";
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
	
	
}
