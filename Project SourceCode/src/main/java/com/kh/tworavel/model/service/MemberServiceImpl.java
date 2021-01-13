package com.kh.tworavel.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.kh.tworavel.common.Gmail;
import com.kh.tworavel.common.SHA256;
import com.kh.tworavel.model.dao.MemberDao;
import com.kh.tworavel.model.domain.Member;
import com.kh.tworavel.model.domain.Out;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao mDao;

	@Override
	public Member selectOne(String m_id) {
		return mDao.selectOne(m_id);
	}

	@Override
	public int loginCheck(String m_id, String m_pw) {
		return mDao.loginCheck(m_id, m_pw);
	}

	@Override
	public int duplecateID(String m_id) {
		return mDao.duplecateID(m_id);
	}

	@Override
	public int duplecateNickname(String m_nick) {
		return mDao.duplecateNickname(m_nick);
	}

	@Override
	public int duplecateEMAIL(String m_email) {
		return mDao.duplecateEMAIL(m_email);
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m);
	}

	@Override
	public String getUserEmailCode(String m_id) {
		return mDao.getUserEmailCode(m_id);
	}

	@Override
	public int setUserEmailChecked(String m_id) {
		return mDao.setUserEmailChecked(m_id);
	}

	@Override
	public Member searchUsingEmail(String m_email) {
		return mDao.searchUsingEmail(m_email);
	}

	@Override
	public int updatePwd(HashMap<String, String> paramMap) {
		return mDao.updatePwd(paramMap);
	}

	@Override
	public int updateLoginDate(String m_id) {
		return mDao.updateLoginDate(m_id);
	}

	@Override
	public String getloginDate(String m_id) {
		return mDao.getloginDate(m_id);
	}

	@Override
	public String getCurrentDate() {
		return mDao.getCurrentDate();
	}

	@Override
	public int updateLoginPoint(String m_id) {
		return mDao.updateLoginPoint(m_id);
	}

	@Override
	public List<Member> unEqualLoginDate() {
		return mDao.unEqualLoginDate();
	}

	@Override
	public int minusLoginPoint(String m_id) {
		return mDao.minusLoginPoint(m_id);
	}
	//±ÝÁö¿îºÎºÐ(°ü¸®ÀÚ)
	@Override
	public int selectMemberAllCount() {
		return mDao.selectMemberAllCount();
	}

	@Override
	public List<Member> selectMemberAll(int startPage, int limit) {
		return mDao.selectMemberAll(startPage, limit);
	}

	@Override
	@Async
	public void joinEmailSend(String m_id, String Tto) throws InterruptedException {
		String host = "http://localhost:8090/tworavel/";
		// 개인 이메일 작성
		String from = "nothing1360@gmail.com";

		String to = Tto;
		String subject = "[TwoRavel] 계정 활성화를 위한 이메일 확인 메일입니다.";
		String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." + "<br>" + "<a href='" + host + "EmailAcceptCtl.do?code="
				+ SHA256.getSHA256(to) + "&m_id=" + m_id + "'>이메일 인증하기</a>";

		// SMTP에 접속하기 위한 정보를 기입합니다.
		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "456");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p, auth);

		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);

		try {
			msg.setSubject(subject);

			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);

			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);

			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	@Async
	public void searchEmailSend(Member m) throws InterruptedException {
		String host = "http://localhost:8090/tworavel/";
		// 개인 이메일 작성
		Member m2 = m;

		String from = "nothing1360@gmail.com";
		String to = m2.getM_email();
		String subject = "[TwoRavel] 임시 비밀번호가 담긴 메일입니다.";

		String n_pwd = m2.getM_pw();

		String content = "임시 비밀번호는 아래와 같습니다." + "<br>" + n_pwd + "<br>임시 비밀번호로 로그인 후 비밀번호를 변경해주세요!!!";

		// SMTP에 접속하기 위한 정보를 기입합니다.

		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "456");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p, auth);

		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		try {
			msg.setSubject(subject);

			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);

			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);

			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	@Async
	public void outEmailSend(String Tto, Out vo) throws InterruptedException {
		String host = "http://localhost:8090/tworavel/";
		// 개인 이메일 작성
		String from = "nothing1360@gmail.com";

		String to = Tto;
		String subject = "[TwoRavel] 탈퇴 처리 안내입니다.";
		String content = vo.getM_id() + " 회원님은 " + "관리자에 의해서 탈퇴처리 되었습니다." + "<br>" + "탈퇴 사유 : " + vo.getO_reason()
				+ "<br>";

		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "456");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p, auth);

		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		try {
			msg.setSubject(subject);

			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);

			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);

			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void adminminuspoint(String m_id) {

		mDao.adminminuspoint(m_id);
	}

}
