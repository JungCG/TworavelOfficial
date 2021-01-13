package com.kh.tworavel.model.domain;

import org.springframework.stereotype.Component;

@Component
public class GAdd {

	
//	Name   Null?    Type           
//			------ -------- -------------- 
//			G_ID   NOT NULL NUMBER         
//			G_IMG1          VARCHAR2(4000) 
//			G_IMG2          VARCHAR2(4000) 
//			G_IMG3          VARCHAR2(4000) 
			
			


				private int g_id;
				private String g_img1;
				private String g_img2;
				private String g_img3;
				private String m_id;
				public GAdd() {}

				public GAdd(int g_id, String g_img1, String g_img2, String g_img3) {
					super();
					this.g_id = g_id;
					this.g_img1 = g_img1;
					this.g_img2 = g_img2;
					this.g_img3 = g_img3;
				}

				
				public GAdd(int g_id, String g_img1, String g_img2, String g_img3, String m_id) {
					super();
					this.g_id = g_id;
					this.g_img1 = g_img1;
					this.g_img2 = g_img2;
					this.g_img3 = g_img3;
					this.m_id = m_id;
				}

				public int getG_id() {
					return g_id;
				}

				public void setG_id(int g_id) {
					this.g_id = g_id;
				}

				public String getG_img1() {
					return g_img1;
				}

				public void setG_img1(String g_img1) {
					this.g_img1 = g_img1;
				}

				public String getG_img2() {
					return g_img2;
				}

				public void setG_img2(String g_img2) {
					this.g_img2 = g_img2;
				}

				public String getG_img3() {
					return g_img3;
				}

				public void setG_img3(String g_img3) {
					this.g_img3 = g_img3;
				}

				public String getM_id() {
					return m_id;
				}

				public void setM_id(String m_id) {
					this.m_id = m_id;
				}
				
				
				
				
				
//				public GAdd() {}
//				
//				public GAdd(int g_id, String g_img, String g_img2, String g_img3) {
//					super();
//					this.g_id = g_id;
//					this.m_id = m_id;
//					this.g_like = g_like;
//					this.g_content = g_content;
//					this.g_view = g_view;
//				}
//				public int getG_id() {
//					return g_id;
//				}
//				public void setG_id(int g_id) {
//					this.g_id = g_id;
//				}
//				public String getM_id() {
//					return m_id;
//				}
//				public void setM_id(String m_id) {
//					this.m_id = m_id;
//				}
//				public int getG_like() {
//					return g_like;
//				}
//				public void setG_like(int g_like) {
//					this.g_like = g_like;
//				}
//				public String getG_content() {
//					return g_content;
//				}
//				public void setG_content(String g_content) {
//					this.g_content = g_content;
//				}
//				public int getG_view() {
//					return g_view;
//				}
//				public void setG_view(int g_view) {
//					this.g_view = g_view;
//				}
//				public static long getSerialversionuid() {
//					return serialVersionUID;
//				}
//				
//				
//
//			}
}
