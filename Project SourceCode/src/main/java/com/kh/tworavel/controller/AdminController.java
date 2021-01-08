package com.kh.tworavel.controller;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tworavel.common.Gmail;
import com.kh.tworavel.common.SHA256;
import com.kh.tworavel.model.domain.Member;
import com.kh.tworavel.model.domain.Out;
import com.kh.tworavel.model.service.BoardService;
import com.kh.tworavel.model.service.CompanionService;
import com.kh.tworavel.model.service.MemberService;
import com.kh.tworavel.model.service.OutService;

@Controller
public class AdminController {

	@Autowired
	private MemberService mService;

	@Autowired
	private BoardService bService;
	public static final int LIMIT = 10;
	@Autowired
	private CompanionService cService;
	@Autowired
	private OutService oService;

	@RequestMapping(value = "adminpage.do")
	public ModelAndView admin(ModelAndView mv, @RequestParam(name = "page", defaultValue = "1") int page,@RequestParam(name="type", defaultValue = "B",required = false) char b_type){
		
		int startPage =0;
		int endPage=0;
		int listCount=0;

		if (page % 5 == 0) {

			startPage = (page / 5 - 1) * 5 + 1;
			endPage = (page / 5) * 5;
		} else if (page % 5 != 0) {

			startPage = (page / 5) * 5 + 1;
			endPage = (page / 5 + 1) * 5;
		}
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			String type = String.valueOf(b_type);
			System.out.println(type);
			if (type.equals("B")) {
				listCount = bService.selectBoardAllCount();
			}
			else if (type.equals("C")) {
				listCount = cService.listCountC();
			}
			else if(type.equals("M")) {
				listCount = mService.selectMemberAllCount();
			}
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			if(type.equals("B")) {
				mv.addObject("blist",bService.selectBoardAll(currentPage,LIMIT));
				System.out.println(bService.selectBoardAll(currentPage,LIMIT).size());
			}
			else if (type.equals("C")) {
				mv.addObject("clist",cService.selectListCp(currentPage,LIMIT));
			}
			else if(type.equals("M")) {
				mv.addObject("mlist",mService.selectMemberAll(currentPage,LIMIT));
			}else {
				mv.addObject("blist",bService.selectBoardAll(currentPage,LIMIT));
			}
			mv.addObject("startPage",startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.addObject("type",type);
			mv.setViewName("AdminPage");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	@RequestMapping(value = "Adminboarddelete.do", method = RequestMethod.GET)
	public ModelAndView BoardDeleteService(@RequestParam(name = "b_id") int b_id, ModelAndView mv,
			HttpServletRequest request) {
		bService.deleteBoard(b_id);
		mv.setViewName("redirect:adminpage.do?type=B");
		return mv;
	}

	@RequestMapping(value = "AdminDeleteMember.do", method = RequestMethod.POST)
	public ModelAndView adminDeleteMember(@RequestParam(name = "m_id") String m_id,@RequestParam(name="o_reason")String o_reason, ModelAndView mv,
			HttpServletRequest request) {
		Out vo = new Out();
		vo.setM_id(m_id);
		vo.setO_reason(o_reason);
		oService.adminOutMember(vo);

		/////////////////////////////////////
		String host = "http://localhost:8090/tworavel/";
		// 개인 이메일 작성
		String from = "nothing1360@gmail.com";

		String to = mService.selectOne(m_id).getM_email();
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
		/////////////////////////////////////
		
		
		mv.setViewName("redirect:adminpage.do?type=M");
		return mv;
	}

	@RequestMapping(value = "admincompaniondelete.do", method = RequestMethod.GET)
	public ModelAndView CompanionDeleteService(@RequestParam(name = "c_id") int c_id, ModelAndView mv,
			HttpServletRequest request) {
		cService.deleteC(c_id);
		mv.setViewName("redirect:adminpage.do?type=C");
		return mv;
	}
}