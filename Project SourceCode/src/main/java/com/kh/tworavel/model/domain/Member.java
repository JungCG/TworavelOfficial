package com.kh.tworavel.model.domain;


import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Member implements java.io.Serializable{
	private static final long serialVersionUID = 20001L;
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_nick;
	private Date m_birth;
	private char m_gender;
	private String m_address;
	private String m_address_detail;
	private int m_like;
	private Date m_joindate;
	private String m_intro;
	private int m_visit;
	private String m_image;
	private char m_status;
	private Date m_logindate;
	private int m_reportcount;
	private String m_phone;
	private String m_email;
	private String m_emailhash;
	private char m_authorization;
	private String m_joinway;
	private int m_point;
	private int cnt;
	public Member() {
	}
	
	public Member(String m_id, String m_pw, String m_name, String m_nick, Date m_birth, char m_gender, String m_address,
			String m_address_detail, int m_like, Date m_joindate, String m_intro, int m_visit, String m_image,
			char m_status, Date m_logindate, int m_reportcount, String m_phone, String m_email, String m_emailhash,
			char m_authorization, String m_joinway, int m_point, int cnt) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_nick = m_nick;
		this.m_birth = m_birth;
		this.m_gender = m_gender;
		this.m_address = m_address;
		this.m_address_detail = m_address_detail;
		this.m_like = m_like;
		this.m_joindate = m_joindate;
		this.m_intro = m_intro;
		this.m_visit = m_visit;
		this.m_image = m_image;
		this.m_status = m_status;
		this.m_logindate = m_logindate;
		this.m_reportcount = m_reportcount;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_emailhash = m_emailhash;
		this.m_authorization = m_authorization;
		this.m_joinway = m_joinway;
		this.m_point = m_point;
		this.cnt = cnt;
	}
	
	public Member(String m_id, String m_pw, String m_name, String m_nick, Date m_birth, char m_gender, String m_address,
			String m_address_detail, Date m_joindate, String m_intro, String m_image, int m_reportcount, String m_phone,
			String m_email, char m_authorization) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_nick = m_nick;
		this.m_birth = m_birth;
		this.m_gender = m_gender;
		this.m_address = m_address;
		this.m_address_detail = m_address_detail;
		this.m_joindate = m_joindate;
		this.m_intro = m_intro;
		this.m_image = m_image;
		this.m_reportcount = m_reportcount;
		this.m_phone = m_phone;
		this.m_email = m_email;
		this.m_authorization = m_authorization;
	}



	@Override
	public String toString() {
		return "Member [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_nick=" + m_nick + ", m_birth="
				+ m_birth + ", m_gender=" + m_gender + ", m_address=" + m_address + ", m_address_detail="
				+ m_address_detail + ", m_like=" + m_like + ", m_joindate=" + m_joindate + ", m_intro=" + m_intro
				+ ", m_visit=" + m_visit + ", m_image=" + m_image + ", m_status=" + m_status + ", m_logindate="
				+ m_logindate + ", m_reportcount=" + m_reportcount + ", m_phone=" + m_phone + ", m_email=" + m_email
				+ ", m_emailhash=" + m_emailhash + ", m_authorization=" + m_authorization + ", m_joinway=" + m_joinway
				+ ", m_point=" + m_point + ", cnt=" + cnt + "]";
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public Date getM_birth() {
		return m_birth;
	}
	public void setM_birth(Date m_birth) {
		this.m_birth = m_birth;
	}
	public char getM_gender() {
		return m_gender;
	}
	public void setM_gender(char m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public String getM_address_detail() {
		return m_address_detail;
	}
	public void setM_address_detail(String m_address_detail) {
		this.m_address_detail = m_address_detail;
	}
	public int getM_like() {
		return m_like;
	}
	public void setM_like(int m_like) {
		this.m_like = m_like;
	}
	public Date getM_joindate() {
		return m_joindate;
	}
	public void setM_joindate(Date m_joindate) {
		this.m_joindate = m_joindate;
	}
	public String getM_intro() {
		return m_intro;
	}
	public void setM_intro(String m_intro) {
		this.m_intro = m_intro;
	}
	public int getM_visit() {
		return m_visit;
	}
	public void setM_visit(int m_visit) {
		this.m_visit = m_visit;
	}
	public String getM_image() {
		return m_image;
	}
	public void setM_image(String m_image) {
		this.m_image = m_image;
	}
	public char getM_status() {
		return m_status;
	}
	public void setM_status(char m_status) {
		this.m_status = m_status;
	}
	public Date getM_logindate() {
		return m_logindate;
	}
	public void setM_logindate(Date m_logindate) {
		this.m_logindate = m_logindate;
	}
	public int getM_reportcount() {
		return m_reportcount;
	}
	public void setM_reportcount(int m_reportcount) {
		this.m_reportcount = m_reportcount;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_emailhash() {
		return m_emailhash;
	}
	public void setM_emailhash(String m_emailhash) {
		this.m_emailhash = m_emailhash;
	}
	public char getM_authorization() {
		return m_authorization;
	}
	public void setM_authorization(char m_authorization) {
		this.m_authorization = m_authorization;
	}
	public String getM_joinway() {
		return m_joinway;
	}
	public void setM_joinway(String m_joinway) {
		this.m_joinway = m_joinway;
	}
	public int getM_point() {
		return m_point;
	}
	public void setM_point(int m_point) {
		this.m_point = m_point;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
