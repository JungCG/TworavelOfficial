package com.kh.tworavel.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tworavel.common.Gmail;
import com.kh.tworavel.common.SHA256;
import com.kh.tworavel.common.VillageWeatherParsing;
import com.kh.tworavel.model.domain.Member;
import com.kh.tworavel.model.service.MemberService;
import com.kh.tworavel.model.service.OutService;

@Controller
public class MemberController {
	@Autowired
	private MemberService mService;

	@Autowired
	private OutService oService;
	
	@Autowired
	private VillageWeatherParsing weatherparsing;

	// 게시글 작성 페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView MainPage(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv) {
		//날씨
		mv.addObject("weatherArr", weatherparsing.WeatherParsing("60","127"));	//기본은 서울
		mv.setViewName("MainPage");
		return mv;
	}

	@RequestMapping(value = "/LoginCtl.do", method = RequestMethod.POST)
	public String LogInCtl(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");

		int check = mService.loginCheck(m_id, m_pw);
		if (check == 2) {
			// 이메일 인증 필요
			model.addAttribute("msg", "이메일 인증이 필요합니다.");
			model.addAttribute("url", "/loginPre.do");
		} else if (check == 1) {
			int check2 = oService.outCheck(m_id);

			if (check2 == 1) {
				// 로그인 성공
				HttpSession session = request.getSession();
				session.setAttribute("userID", m_id);

				model.addAttribute("msg", "로그인 성공");
				model.addAttribute("url", "/");
			} else if (check2 == 0) {
				String reason = "";

				if (reason.equals("") || reason == null) {
					// 탈퇴한 회원
					model.addAttribute("msg", "탈퇴한 회원입니다.");
					model.addAttribute("url", "/loginPre.do");
				} else {
					// 탈퇴 + 사유
					model.addAttribute("msg", "관리자에 의해 탈퇴 처리되었습니다.");
					model.addAttribute("url", "/loginPre.do");
				}
			} else {
				// 데이터베이스 조회 실패
				model.addAttribute("msg", "데이터베이스 조회에 실패했습니다.");
				model.addAttribute("url", "/loginPre.do");
			}
		} else if (check == 0) {
			// 비밀번호 불일치
			model.addAttribute("msg", "비밀번호가 불일치합니다.");
			model.addAttribute("url", "/loginPre.do");
		} else if (check == -1) {
			// 아이디 존재x
			model.addAttribute("msg", "아이디가 존재하지 않습니다.");
			model.addAttribute("url", "/loginPre.do");
		} else {
			// 데이터베이스 조회 실패
			model.addAttribute("msg", "데이터베이스 조회에 실패했습니다.");
			model.addAttribute("url", "/loginPre.do");
		}
		return "alertMsg";
	}

	@RequestMapping(value = "/mInsert.do", method = RequestMethod.POST)
	public ModelAndView JoinCtl(Member m, @RequestParam(name = "upfile", required = false) MultipartFile report,
			HttpServletRequest request, ModelAndView mv) throws IOException {
		try {

			if (report != null && !report.getOriginalFilename().equals("")) {
				saveFile(report, request);
			}

			m.setM_image(report.getOriginalFilename());
			m.setM_emailhash(SHA256.getSHA256(request.getParameter("m_email")));
			m.setM_address(request.getParameter("sample4_roadAddress"));
			m.setM_address_detail(request.getParameter("sample4_detailAddress"));

			int check = mService.insertMember(m);

			if (check == 1) {
				int check2 = oService.insertOut(m.getM_id());
				if (check2 == 1) {
					mv.setViewName("forward:EmailSendCtl.do");
				} else {
					mv.addObject("msg", "회원가입 실패");
					mv.addObject("url", "/join.do");
					mv.setViewName("alertMsg");
				}
			} else {
				mv.addObject("msg", "회원가입 실패, 관리자에게 문의 필수!!");
				mv.addObject("url", "/join.do");
				mv.setViewName("alertMsg");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.addObject("url", "/join.do");
			mv.setViewName("alertMsg");
		}
		return mv;
	}

	@RequestMapping(value = "/EmailSendCtl.do", method = RequestMethod.POST)
	public ModelAndView EmailSendCtl(Member m, HttpServletRequest request, HttpServletResponse response, Model model,
			ModelAndView mv) throws IOException {

		String m_id = m.getM_id();
		System.out.println(m_id + "&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
		// 사용자에게 보낼 메시지를 기입합니다.

		String host = "http://localhost:8090/tworavel/";
		// 개인 이메일 작성
		String from = "nothing1360@gmail.com";
		System.out.println(mService.selectOne(m_id).getM_email() + "&&&&&&&&&&&&&&&&&&&&&&&&&&&&");

		String to = mService.selectOne(m_id).getM_email();
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

		try {
			Authenticator auth = new Gmail();
			Session ses = Session.getInstance(p, auth);

			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);

			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);

			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);

			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);
			mv.setViewName("login");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "오류 발생!");
			mv.addObject("url", "/join.do");
			mv.setViewName("alertMsg");
		}

		return mv;
	}

	@RequestMapping(value = "/EmailAcceptCtl.do", method = RequestMethod.GET)
	public String EmailAcceptCtl(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		String code = null;
		String m_id = null;
		if (request.getParameter("code") != null) {
			code = request.getParameter("code");
		}
		if (request.getParameter("m_id") != null) {
			m_id = request.getParameter("m_id");
		}

		boolean isRight = (mService.getUserEmailCode(m_id).equals(code)) ? true : false;
		if (isRight == true) {
			mService.setUserEmailChecked(m_id);
			model.addAttribute("msg", "인증에 성공했습니다.");
			model.addAttribute("url", "/loginPre.do");
		} else {
			model.addAttribute("msg", "유효하지 않은 코드입니다.");
			model.addAttribute("url", "/loginPre.do");
		}
		return "alertMsg";
	}

	@RequestMapping(value = "/loginPre.do", method = RequestMethod.GET)
	public String LogIn(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		return "login";
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String LogOut(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		model.addAttribute("msg", "로그아웃 하였습니다.");
		model.addAttribute("url", "/");
		return "alertMsg";
	}

	@RequestMapping(value = "/MyPage.do", method = RequestMethod.GET)
	public String MyPage(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		return "MyPage";
	}

	@RequestMapping(value = "/AdminPage.do", method = RequestMethod.GET)
	public String AdminPage(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		return "AdminPage";
	}

	@RequestMapping(value = "/joinPre.do", method = RequestMethod.GET)
	public String joinPre(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		return "joinPre";
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		return "join";
	}

	@ResponseBody
	@RequestMapping(value = "/IdCheckCtl.do", method = RequestMethod.GET)
	public String IdCheckCtl(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		JSONObject job = new JSONObject();

		String m_id = request.getParameter("m_id");

		try {
			job.put("cnt", mService.duplecateID(m_id));
		} catch (Exception e) {
			job.put("cnt", 0);
		}
		return job.toJSONString();
	}

	@ResponseBody
	@RequestMapping(value = "/NickCheckCtl.do", method = RequestMethod.GET)
	public String NickCheckCtl(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		JSONObject job = new JSONObject();

		String m_nick = request.getParameter("m_nick");

		try {
			job.put("cnt", mService.duplecateNickname(m_nick));
		} catch (Exception e) {
			job.put("cnt", 0);
		}
		return job.toJSONString();
	}

	@ResponseBody
	@RequestMapping(value = "/EmailCheckCtl.do", method = RequestMethod.GET)
	public String EmailCheckCtl(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		JSONObject job = new JSONObject();

		String m_email = request.getParameter("m_email");

		try {
			job.put("cnt", mService.duplecateEMAIL(m_email));
		} catch (Exception e) {
			job.put("cnt", 0);
		}
		return job.toJSONString();
	}

	private void saveFile(MultipartFile report, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdir(); // 폴더가 없다면 생성한다.
		}

		String filePath = null;

		try { // 파일 저장
			System.out.println(report.getOriginalFilename() + "을 저장합니다.");
			System.out.println("저장 경로 : " + savePath);
			filePath = folder + "\\" + report.getOriginalFilename();

			report.transferTo(new File(filePath)); // 파일을 저장한다
			System.out.println("파일 명 : " + report.getOriginalFilename());
			System.out.println("파일 경로 : " + filePath);
			System.out.println("파일 전송이 완료되었습니다.");
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
	}
}
