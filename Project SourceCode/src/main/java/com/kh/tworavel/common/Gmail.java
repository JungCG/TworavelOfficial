package com.kh.tworavel.common;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		// 개인 이메일, 비밀번호 작성
		return new PasswordAuthentication("보내는사람이메일주소", "이메일비밀번호");
	}
}
