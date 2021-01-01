package com.kh.tworavel.model.domain;

import org.springframework.stereotype.Component;

@Component
public class CompanionTag implements java.io.Serializable{
	private static final long serialVersionUID = 20001L;
	
	private int c_id;
	private int c_lid;
	private int c_sid;
	
	public CompanionTag() {
		super();
	}
	public CompanionTag(int c_id, int c_lid, int c_sid) {
		super();
		this.c_id = c_id;
		this.c_lid = c_lid;
		this.c_sid = c_sid;
	}
	@Override
	public String toString() {
		return "CompanionTag [c_id=" + c_id + ", c_lid=" + c_lid + ", c_sid=" + c_sid + "]";
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public int getC_lid() {
		return c_lid;
	}
	public void setC_lid(int c_lid) {
		this.c_lid = c_lid;
	}
	public int getC_sid() {
		return c_sid;
	}
	public void setC_sid(int c_sid) {
		this.c_sid = c_sid;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
//	C_ID	NUMBER
//	C_LID	NUMBER
//	C_SID	NUMBER
	
}
