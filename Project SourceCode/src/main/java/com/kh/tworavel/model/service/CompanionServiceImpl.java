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

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.kh.tworavel.common.Gmail;
import com.kh.tworavel.common.SHA256;
import com.kh.tworavel.model.dao.CompanionDao;
import com.kh.tworavel.model.domain.Board;
import com.kh.tworavel.model.domain.Companion;
import com.kh.tworavel.model.domain.CompanionAdd;
import com.kh.tworavel.model.domain.CompanionInfo;
import com.kh.tworavel.model.domain.CompanionLike;
import com.kh.tworavel.model.domain.CompanionMap;
import com.kh.tworavel.model.domain.CompanionTag;

@Service("cService")
public class CompanionServiceImpl implements CompanionService {

	@Autowired
	private CompanionDao cDao;

	@Override
	public void companion(Companion c, CompanionMap cm, CompanionTag ct) {
		int result = 0;
		result = cDao.companion(c);
		System.out.println("sdsds" + result);
		cm.setC_id(result);
		cDao.companion(cm);
		ct.setC_id(result);
		cDao.companion(ct);
	}

	/*
	 * @Override public void companion1(Companion c) { cDao.companion(c); }
	 */

	@Override
	public List<Companion> selectSearchC(String keyword,int startPage, int limit) {
		return cDao.selectSearchC(keyword, startPage, limit);
	}
	@Override
	public int totalSearchCountC(String keyword) {
		return cDao.totalSearchCountC(keyword);
	}


	@Override
	public void updateOneC(Companion c) {
		cDao.updateOneC(c);
	}

	@Override
	public void updateMapC(CompanionMap cm) {
		cDao.updateMapC(cm);
	}

	@Override
	public void updateTagC(CompanionTag ct) {
		cDao.updateTagC(ct);
	}

//

	@Override
	public int companion(Companion c) {
		int result = cDao.companion(c);
		return result;
	}

	@Override
	public int listCountC() {
		return cDao.listCountC();
	}

	@Override
	public List<Companion> selectListC() {
		return cDao.selectListC();
	}

	@Override
	public List<Companion> selectListCp(int startPage, int limit) {
		return cDao.selectListCp(startPage, limit);
	}

	@Override
	public Companion updateC(Companion c) {
		return null;
	}

	@Override
	public void insertCMap(CompanionMap vo) {
		cDao.insertCMap(vo);
	}

	@Override
	public void insertCTag(CompanionTag vo) {
		cDao.insertCTag(vo);
	}

	@Override
	public Companion selectOneC(int c_id) {
		cDao.addCReadCount(c_id);
		return cDao.selectOneC(c_id);
	}

	@Override
	public String selectMapC(CompanionMap vo) {
		return cDao.selectMapC(vo);
	}

	@Override
	public List<CompanionTag> selectTagC(CompanionTag ct) {
		return cDao.selectTagC(ct);
	}

	@Override
	public int selectCmapCount(int c_id) {
		return cDao.selectCmapCount(c_id);
	}

	@Override
	public void updateCMap(CompanionMap vo) {
		cDao.updateCMap(vo);
	}

//	동행글 삭제
	@Override
	public void deleteCChat(int c_id) {
		cDao.deleteC(c_id);
	}
	
	@Override
	public void deleteCMap(int c_id) {
		cDao.deleteC(c_id);
	}

	@Override
	public void deleteCTag(int c_id) {
		cDao.deleteC(c_id);
	}

	@Override
	public void deleteC(int c_id) {
		cDao.deleteC(c_id);
	}

//	동행글 추천/비추천
	@Override
	public void insertCLike(Companion vo) {
		cDao.insertCLike(vo);
	}

	@Override
	public void updateCLikePlus(int c_id) {
		cDao.updateCLikePlus(c_id);
	}

	@Override
	public void updateCLikeMinus(int c_id) {
		cDao.updateCLikeMinus(c_id);
	}

	@Override
	public void deleteCLike(Companion vo) {
		cDao.deleteCLike(vo);
	}

	@Override
	public int selectCLikeMid(Companion vo) {
		return cDao.selectCLikeMid(vo);
	}

	@Override
	public int selectCLikeCount(int c_id) {
		return cDao.selectCLikeCount(c_id);
	}

//	동행 조회수 증가
//	@Override
//	public List<Companion> selectCHotViewList() {
//		return cDao.selectCHotViewList();
//	}
//	@Override
//	public int selectCAllCount() {
//		return cDao.selectCAllCount();
//	}

//	동행 신청
	@Override
	public void insertCInfo(CompanionInfo vo) {
		cDao.insertCInfo(vo);
	}
	@Override
	public List<Companion> selectCountpeople() {
		return cDao.selectCountpeople();
	}
	@Override
	public List<Companion> selectCountarea() {
		return cDao.selectCountarea();
	}
	@Override
	public List<Companion> selectCounttendency() {
		// TODO Auto-generated method stub
		return cDao.selectCounttendency();
	}
	
	// 동행 글쓰기 포인트 비교
	@Override
	public int companionlistwrite(String m_id) {
		
		return cDao.companionlistwrite(m_id);
	}

	@Override
	public Companion selectOneCBy(String m_id) {
		return cDao.selectOneCBy(m_id);
	}

	@Override
	public List<Companion> selectFavorML(HashMap<String, Integer> paramMap) {
		return cDao.selectFavorML(paramMap);
	}

	@Override
	@Async
	public void favorEmailSend(String m_id, String m_email, Companion comp) {
		String host = "http://localhost:8090/tworavel/";
		// 개인 이메일 작성
		String from = "nothing1360@gmail.com";

		String to = m_email;
		String subject = "[TwoRavel] 회원님의 여행 성향과 일치하는 동행 글이 올라왔습니다.";
		String content = "동행 게시글은 아래와 같습니다.<br>";
		content += "글 제목 : " + comp.getC_name() + "<br>";
		content += "글 등록날짜 : " + comp.getC_adddate() + "<br>";
		content += "희망 인원 : " + comp.getC_many() + "<br>";
		content += "예산 : " + comp.getC_value() + "<br>";
		content += "시작하는 날 : " + comp.getC_startd() + "<br>";
		content += "끝나는 날 : " + comp.getC_endd() + "<br>";
		content += "<a href='" + host + "companion_detail.do?c_id="
				+ comp.getC_id() + "&page=" + 1 + "'>게시글 링크</a>";

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
	
}
