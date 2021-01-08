package com.kh.tworavel.model.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class ChatJoin {

	
	private int c_id;
	private String m_id;
	private String ch_inout;
	private Timestamp ch_intime;
	private Timestamp ch_outtime;
	
	public ChatJoin() {}

	public ChatJoin(int c_id, String m_id, String ch_inout, Timestamp ch_intime, Timestamp ch_outtime) {
		super();
		this.c_id = c_id;
		this.m_id = m_id;
		this.ch_inout = ch_inout;
		this.ch_intime = ch_intime;
		this.ch_outtime = ch_outtime;
	}

	@Override
	public String toString() {
		return "ChatJoin [c_id=" + c_id + ", m_id=" + m_id + ", ch_inout=" + ch_inout + ", ch_intime=" + ch_intime
				+ ", ch_outtime=" + ch_outtime + "]";
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

	public String getCh_inout() {
		return ch_inout;
	}

	public void setCh_inout(String ch_inout) {
		this.ch_inout = ch_inout;
	}

	public Timestamp getCh_intime() {
		return ch_intime;
	}

	public void setCh_intime(Timestamp ch_intime) {
		this.ch_intime = ch_intime;
	}

	public Timestamp getCh_outtime() {
		return ch_outtime;
	}

	public void setCh_outtime(Timestamp ch_outtime) {
		this.ch_outtime = ch_outtime;
	}
	
	
	
}
