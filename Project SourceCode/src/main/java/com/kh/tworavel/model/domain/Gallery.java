package com.kh.tworavel.model.domain;


//Name      Null?    Type          
//--------- -------- ------------- 
//G_ID      NOT NULL NUMBER        
//M_ID      NOT NULL VARCHAR2(500) 
//G_LIKE    NOT NULL NUMBER        
//G_CONTENT          VARCHAR2(500) 
//G_VIEW    NOT NULL NUMBER  

public class Gallery implements java.io.Serializable {
	private static final long serialVersionUID = 20001L;

	private int g_id;
	private String m_id;
	private int g_like;
	private String g_content;
	private int g_view;
	
	public Gallery() {}
	
	public Gallery(int g_id, String m_id, int g_like, String g_content, int g_view) {
		super();
		this.g_id = g_id;
		this.m_id = m_id;
		this.g_like = g_like;
		this.g_content = g_content;
		this.g_view = g_view;
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
	public int getG_like() {
		return g_like;
	}
	public void setG_like(int g_like) {
		this.g_like = g_like;
	}
	public String getG_content() {
		return g_content;
	}
	public void setG_content(String g_content) {
		this.g_content = g_content;
	}
	public int getG_view() {
		return g_view;
	}
	public void setG_view(int g_view) {
		this.g_view = g_view;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
