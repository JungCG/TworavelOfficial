package com.kh.tworavel.model.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Out implements java.io.Serializable{
	private static final long serialVersionUID = 20002L;
	private String m_id;
	private char o_status;
	private Date o_outdate;
	private String o_reason;
	
	public Out() {}
	
	public Out(String m_id, char o_status) {
		super();
		this.m_id = m_id;
		this.o_status = o_status;
	}

	@Override
	public String toString() {
		return "Out [m_id=" + m_id + ", o_status=" + o_status + ", o_outdate=" + o_outdate + ", o_reason=" + o_reason
				+ "]";
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public char getO_status() {
		return o_status;
	}
	public void setO_status(char o_status) {
		this.o_status = o_status;
	}
	public Date getO_outdate() {
		return o_outdate;
	}
	public void setO_outdate(Date o_outdate) {
		this.o_outdate = o_outdate;
	}
	public String getO_reason() {
		return o_reason;
	}
	public void setO_reason(String o_reason) {
		this.o_reason = o_reason;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
