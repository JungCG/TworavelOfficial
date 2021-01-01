package com.kh.tworavel.model.domain;

import org.springframework.stereotype.Component;

@Component
public class Companion implements java.io.Serializable{
	private static final long serialVersionUID = 20001L;

	private int c_id;
	private int c_value;
	private int c_many;
	private int c_view;
	private int c_like;
	private String c_adddate;
	private String c_startd;
	private String c_endd;
	private String m_id;
	private String c_dealstatus;
	private String c_name;
	private String c_description;
	private String c_meet;
	private String c_address;

	public Companion() {
		super();
	}

	public Companion(int c_id, int c_value, int c_many, int c_view, int c_like, String c_adddate, String c_startd,
			String c_endd, String m_id, String c_dealstatus, String c_name, String c_description, String c_meet,
			String c_address) {
		super();
		this.c_id = c_id;
		this.c_value = c_value;
		this.c_many = c_many;
		this.c_view = c_view;
		this.c_like = c_like;
		this.c_adddate = c_adddate;
		this.c_startd = c_startd;
		this.c_endd = c_endd;
		this.m_id = m_id;
		this.c_dealstatus = c_dealstatus;
		this.c_name = c_name;
		this.c_description = c_description;
		this.c_meet = c_meet;
		this.c_address = c_address;
	}

	@Override
	public String toString() {
		return "Companion [c_id=" + c_id + ", c_value=" + c_value + ", c_many=" + c_many + ", c_view=" + c_view
				+ ", c_like=" + c_like + ", c_adddate=" + c_adddate + ", c_startd=" + c_startd + ", c_endd=" + c_endd
				+ ", m_id=" + m_id + ", c_dealstatus=" + c_dealstatus + ", c_name=" + c_name + ", c_description="
				+ c_description + ", c_meet=" + c_meet + ", c_address=" + c_address + "]";
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public int getC_value() {
		return c_value;
	}

	public void setC_value(int c_value) {
		this.c_value = c_value;
	}

	public int getC_many() {
		return c_many;
	}

	public void setC_many(int c_many) {
		this.c_many = c_many;
	}

	public int getC_view() {
		return c_view;
	}

	public void setC_view(int c_view) {
		this.c_view = c_view;
	}

	public int getC_like() {
		return c_like;
	}

	public void setC_like(int c_like) {
		this.c_like = c_like;
	}

	public String getC_dealstatus() {
		return c_dealstatus;
	}

	public void setC_dealstatus(String c_dealstatus) {
		this.c_dealstatus = c_dealstatus;
	}

	public String getC_adddate() {
		return c_adddate;
	}

	public void setC_adddate(String c_adddate) {
		this.c_adddate = c_adddate;
	}

	public String getC_startd() {
		return c_startd;
	}

	public void setC_startd(String c_startd) {
		this.c_startd = c_startd;
	}

	public String getC_endd() {
		return c_endd;
	}

	public void setC_endd(String c_endd) {
		this.c_endd = c_endd;
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

	public String getC_description() {
		return c_description;
	}

	public void setC_description(String c_description) {
		this.c_description = c_description;
	}

	public String getC_meet() {
		return c_meet;
	}

	public void setC_meet(String c_meet) {
		this.c_meet = c_meet;
	}

	public String getC_address() {
		return c_address;
	}

	public void setC_address(String c_address) {
		this.c_address = c_address;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/*
	 * C_ID NUMBER M_ID VARCHAR2(500 BYTE) C_NAME VARCHAR2(4000 BYTE) C_ADDDATE DATE
	 * C_VALUE NUMBER C_MANY NUMBER C_DESCRIPTION VARCHAR2(4000 BYTE) C_LIKE NUMBER
	 * C_DEALSTATUS CHAR(1 BYTE) C_VIEW NUMBER C_STARTD DATE C_ENDD DATE C_MEET
	 * VARCHAR2(2000 BYTE) C_ADDRESS VARCHAR2(4000 BYTE)
	 */

}

