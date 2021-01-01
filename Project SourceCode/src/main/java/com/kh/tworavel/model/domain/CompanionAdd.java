package com.kh.tworavel.model.domain;

import org.springframework.stereotype.Component;

@Component
public class CompanionAdd implements java.io.Serializable{
	private static final long serialVersionUID = 20001L;
	
	private int c_id;
	private String ca_img1;
	private String ca_img2;
	private String ca_img3;
	
	public CompanionAdd() {
		super();
	}
	public CompanionAdd(int c_id, String ca_img1, String ca_img2, String ca_img3) {
		super();
		this.c_id = c_id;
		this.ca_img1 = ca_img1;
		this.ca_img2 = ca_img2;
		this.ca_img3 = ca_img3;
	}
	@Override
	public String toString() {
		return "CompanionAdd [c_id=" + c_id + ", ca_img1=" + ca_img1 + ", ca_img2=" + ca_img2 + ", ca_img3=" + ca_img3
				+ "]";
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getCa_img1() {
		return ca_img1;
	}
	public void setCa_img1(String ca_img1) {
		this.ca_img1 = ca_img1;
	}
	public String getCa_img2() {
		return ca_img2;
	}
	public void setCa_img2(String ca_img2) {
		this.ca_img2 = ca_img2;
	}
	public String getCa_img3() {
		return ca_img3;
	}
	public void setCa_img3(String ca_img3) {
		this.ca_img3 = ca_img3;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
//	C_ID	NUMBER
//	CA_IMG1	VARCHAR2(4000 BYTE)
//	CA_IMG2	VARCHAR2(4000 BYTE)
//	CA_IMG3	VARCHAR2(4000 BYTE)
}
