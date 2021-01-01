package com.kh.tworavel.model.domain;

import org.springframework.stereotype.Component;

@Component
public class CompanionMap implements java.io.Serializable{
	private static final long serialVersionUID = 20001L;
	
	private int cm_id;
	private int c_id;
	private String c_xy;
	
	public CompanionMap() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CompanionMap(int cm_id, int c_id, String c_xy) {
		super();
		this.cm_id = cm_id;
		this.c_id = c_id;
		this.c_xy = c_xy;
	}
	@Override
	public String toString() {
		return "CompanionMap [cm_id=" + cm_id + ", c_id=" + c_id + ", c_xy=" + c_xy + "]";
	}
	public int getCm_id() {
		return cm_id;
	}
	public void setCm_id(int cm_id) {
		this.cm_id = cm_id;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_xy() {
		return c_xy;
	}
	public void setC_xy(String c_xy) {
		this.c_xy = c_xy;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
