package com.kh.tworavel.model.domain;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class CompanionReply implements java.io.Serializable {
	private static final long serialVersionUID = 30001L;
	private String comment_id;
	private String companion_num;
	private String comment_name;
	private String comment_pwd;
	private String comments;
	private Date regdate;

	public CompanionReply() {
	}

	public CompanionReply(String comment_id, String comment_pwd, String comments) {
		super();
		this.comment_id = comment_id;
		this.comment_pwd = comment_pwd;
		this.comments = comments;
	}

	public CompanionReply(String comment_id, String comment_pwd) {
		this.comment_id = comment_id;
		this.comment_pwd = comment_pwd;
	}

	public CompanionReply(String comment_id, String companion_num, String comment_name, String comment_pwd, String comments,
			Date regdate) {
		this.comment_id = comment_id;
		this.companion_num = companion_num;
		this.comment_name = comment_name;
		this.comment_pwd = comment_pwd;
		this.comments = comments;
		this.regdate = regdate;
	}

	public CompanionReply(String companion_num, String comment_name, String comment_pwd, String comments) {
		this.companion_num = companion_num;
		this.comment_name = comment_name;
		this.comment_pwd = comment_pwd;
		this.comments = comments;
	}

	@Override // toString() 메소드 오버라이딩
	public String toString() {
		return "CompanionReply [comment_id=" + comment_id + ", companion_num=" + companion_num + ", comment_name=" + comment_name
				+ ", comment_pwd=" + comment_pwd + ", comments=" + comments + ", regdate=" + regdate + "]";
	}
	/* ***** 필드에 대한 Getter & Setter 구현 **** */

	public String getComment_id() {
		return comment_id;
	}

	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}

	public String getCompanion_num() {
		return companion_num;
	}

	public void setCompanion_num(String companion_num) {
		this.companion_num = companion_num;
	}

	public String getComment_name() {
		return comment_name;
	}

	public void setComment_name(String comment_name) {
		this.comment_name = comment_name;
	}

	public String getComment_pwd() {
		return comment_pwd;
	}

	public void setComment_pwd(String comment_pwd) {
		this.comment_pwd = comment_pwd;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

/*
 * public CompanionReply(String comment_id, String comment_pwd) { this.comment_id =
 * comment_id; this.comment_pwd = comment_pwd; }
 * 
 * public CompanionReply(String comment_id, String companion_num, String comment_name,
 * String comment_pwd, String comments, Date regdate) { this.comment_id =
 * comment_id; this.companion_num = companion_num; this.comment_name = comment_name;
 * this.comment_pwd = comment_pwd; this.comments = comments; this.regdate =
 * regdate; }
 * 
 * public CompanionReply(String companion_num, String comment_name, String comment_pwd,
 * String comments) { this.companion_num = companion_num; this.comment_name =
 * comment_name; this.comment_pwd = comment_pwd; this.comments = comments; }
 * 
 * @Override public String toString() { return "CompanionReply [comment_id=" +
 * comment_id + ", companion_num=" + companion_num + ", comment_name=" + comment_name +
 * ", comment_pwd=" + comment_pwd + ", comments=" + comments + ", regdate=" +
 * regdate + "]"; }
 * 
 * // toString() 메소드 오버라이딩
 ***** 
 * 필드에 대한 Getter & Setter 구현 **** 
 */
}