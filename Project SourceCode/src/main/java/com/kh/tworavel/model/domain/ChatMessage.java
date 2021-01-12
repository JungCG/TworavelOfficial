package com.kh.tworavel.model.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;


@Component
public class ChatMessage {
	private int ch_id;
	private int c_id;
	private String m_sender;
	private String m_receiver;
	private String ch_content;
	private Timestamp ch_time;
	private int ch_read;
	
	private String m_id;

	
	
	public ChatMessage() {}



	public ChatMessage(int ch_id, int c_id, String m_sender, String m_receiver, String ch_content, Timestamp ch_time,
			int ch_read, String m_id) {
		super();
		this.ch_id = ch_id;
		this.c_id = c_id;
		this.m_sender = m_sender;
		this.m_receiver = m_receiver;
		this.ch_content = ch_content;
		this.ch_time = ch_time;
		this.ch_read = ch_read;
		this.m_id = m_id;
	}



	@Override
	public String toString() {
		return "ChatMessage [ch_id=" + ch_id + ", c_id=" + c_id + ", m_sender=" + m_sender + ", m_receiver="
				+ m_receiver + ", ch_content=" + ch_content + ", ch_time=" + ch_time + ", ch_read=" + ch_read + "]";
	}



	public int getCh_id() {
		return ch_id;
	}



	public void setCh_id(int ch_id) {
		this.ch_id = ch_id;
	}



	public int getC_id() {
		return c_id;
	}



	public void setC_id(int c_id) {
		this.c_id = c_id;
	}



	public String getM_sender() {
		return m_sender;
	}



	public void setM_sender(String m_sender) {
		this.m_sender = m_sender;
	}



	public String getM_receiver() {
		return m_receiver;
	}



	public void setM_receiver(String m_receiver) {
		this.m_receiver = m_receiver;
	}



	public String getCh_content() {
		return ch_content;
	}



	public void setCh_content(String ch_content) {
		this.ch_content = ch_content;
	}



	public Timestamp getCh_time() {
		return ch_time;
	}



	public void setCh_time(Timestamp ch_time) {
		this.ch_time = ch_time;
	}



	public int getCh_read() {
		return ch_read;
	}



	public void setCh_read(int ch_read) {
		this.ch_read = ch_read;
	}
	
	
	public String getM_id() {
		return m_id;
	}
	
	
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	
	
	
}
