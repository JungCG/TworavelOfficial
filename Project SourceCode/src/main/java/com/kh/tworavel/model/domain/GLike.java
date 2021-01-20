package com.kh.tworavel.model.domain;

import org.springframework.stereotype.Component;

@Component
public class GLike {
	private int g_id;
	private String m_id;
	public GLike() {
		super();
	}
	public GLike(int g_id, String m_id) {
		super();
		this.g_id = g_id;
		this.m_id = m_id;
	}
	public int getG_id() {
		return g_id;
	}
	public void setG_id(int g_id) {
		this.g_id = g_id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	
}
