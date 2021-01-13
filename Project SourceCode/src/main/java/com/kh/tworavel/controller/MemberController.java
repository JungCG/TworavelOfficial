package com.kh.tworavel.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
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
import com.kh.tworavel.common.RandomPassword;
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

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView MainPage(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv) {
		//날씨
		mv.addObject("weatherArr", weatherparsing.WeatherParsing("60","127"));	//기본은 서울
		mv.setViewName("MainPage");
		return mv;
	}
	
	@RequestMapping(value = "/MainPage.do", method = RequestMethod.GET)
	public ModelAndView MainPage2(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv) {
		//날씨
		mv.addObject("weatherArr", weatherparsing.WeatherParsing("60","127"));	//기본은 서울
		mv.setViewName("MainPage");
		return mv;
	}

	@RequestMapping(value = "/LoginCtl.do", method = RequestMethod.POST)
	public String LogInCtl(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		try {
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

					String loginDate = mService.getloginDate(m_id);
					String currentDate = mService.getCurrentDate();

					int check3 = 0;
					int check4 = 0;

					if (loginDate != null) {
						if (!loginDate.equals(currentDate)) {
							check4 = mService.updateLoginPoint(m_id);
						}
					}
					check3 = mService.updateLoginDate(m_id);

					if (check3 == 1 && (check4 == 1 || check4 == 0)) {
						model.addAttribute("msg", "로그인 성공");
						model.addAttribute("url", "/");
					} else if (check3 == 0 && check4 == 1) {
						model.addAttribute("msg", "로그인에 성공하였으나 출석체크에 실패하였습니다. 관리자에게 문의해주세요.");
						model.addAttribute("url", "/");
					} else {
						model.addAttribute("msg", "로그인 성공에 성공하였으나 출석체크와 포인트 적립에 실해하였습니다. 관리자에게 문의해주세요.");
						model.addAttribute("url", "/");
					}
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
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "에러발생");
			model.addAttribute("url", "/");
			return "alertMsg";
		}
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
					String m_id = m.getM_id();

					HttpSession session = request.getSession();
					session.removeAttribute("m_id");

					String to = mService.selectOne(m_id).getM_email();

					mService.joinEmailSend(m_id, to);

					mv.addObject("msg", "이메일 인증 후 로그인 해주세요.");
					mv.addObject("url", "/loginPre.do");
					mv.setViewName("alertMsg");
				} else {
					mv.addObject("msg", "회원가입 실패, 관리자에게 문의해주세요!");
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

	@RequestMapping(value = "/EmailAcceptCtl.do", method = RequestMethod.GET)
	public String EmailAcceptCtl(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		try {
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
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "에러발생");
			model.addAttribute("url", "/");
		}
		return "alertMsg";
	}

	@RequestMapping(value = "/IdSearchCtl.do", method = RequestMethod.POST)
	public String IdSearchCtl(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		try {
			String m_name = request.getParameter("search_name");
			String m_email = request.getParameter("search_email");

			Member m = mService.searchUsingEmail(m_email);

			if (m != null) {
				String m_id = m.getM_id();
				int len = m_id.length();
				String secret_id = "";

				for (int i = 0; i < len - 3; i++) {
					secret_id += String.valueOf(m_id.charAt(i));
				}
				secret_id += "***";
				model.addAttribute("msg", m_name + "님의 아이디는 " + secret_id + " 입니다.");
				model.addAttribute("url", "/loginPre.do");
			} else {
				model.addAttribute("msg", "해당 이메일을 가진 " + m_name + "님의 아이디는 존재하지 않습니다.");
				model.addAttribute("url", "/searchPage.do");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "에러 발생");
			model.addAttribute("url", "/");
		}
		return "alertMsg";
	}

	@RequestMapping(value = "/PwdSearchCtl.do", method = RequestMethod.POST)
	public ModelAndView PwdSearchCtl(HttpServletRequest request, HttpServletResponse response, Model model,
			ModelAndView mv) throws IOException {
		try {
			String m_id = request.getParameter("search_id");
			String m_email = request.getParameter("search_email");

			Member m = mService.searchUsingEmail(m_email);

			if (m != null) {
				if (!m_id.equals(m.getM_id())) {
					mv.addObject("msg", "아이디와 이메일이 일치하지 않습니다.");
					mv.addObject("url", "/searchPage.do");
					mv.setViewName("alertMsg");
				} else {
					HashMap<String, String> paramMap = new HashMap<String, String>();
					RandomPassword rp = new RandomPassword();
					paramMap.put("m_id", m_id);
					paramMap.put("m_pw", rp.getRamdomPassword(10));

					int result = mService.updatePwd(paramMap);
					if (result == 1) {
						Member m2 = mService.selectOne(m_id);

						mService.searchEmailSend(m2);

						mv.addObject("msg", "이메일로 임시 비밀번호가 전송되었습니다.");
						mv.addObject("url", "/loginPre.do");
						mv.setViewName("alertMsg");
					} else {
						mv.addObject("msg", "예기치 못한 에러가 발생했습니다. 다시 시도해주세요.");
						mv.addObject("url", "/searchPage.do");
						mv.setViewName("alertMsg");
					}
				}
			} else {
				mv.addObject("msg", "해당 이메일을 가진 아이디는 존재하지 않습니다.");
				mv.addObject("url", "/searchPage.do");
				mv.setViewName("alertMsg");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "에러발생");
			mv.addObject("url", "/");
			mv.setViewName("alertMsg");
		}
		return mv;
	}

	@RequestMapping(value = "/loginPre.do", method = RequestMethod.GET)
	public String LogIn(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		return "login";
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String LogOut(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		try {
			HttpSession session = request.getSession();
			session.invalidate();
			model.addAttribute("msg", "로그아웃 하였습니다.");
			model.addAttribute("url", "/");
			return "alertMsg";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "에러발생");
			model.addAttribute("url", "/");
			return "alertMsg";
		}
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

	@RequestMapping(value = "/searchPage.do", method = RequestMethod.GET)
	public String searchPage(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		return "searchPage";
	}

	@ResponseBody
	@RequestMapping(value = "/IdCheckCtl.do", method = RequestMethod.GET)
	public String IdCheckCtl(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv)
			throws IOException {
		JSONObject job = new JSONObject();
		try {
			String m_id = request.getParameter("m_id");
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
		try {
			String m_nick = request.getParameter("m_nick");
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
		try {
			String m_email = request.getParameter("m_email");
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
			filePath = folder + "\\" + report.getOriginalFilename();
			report.transferTo(new File(filePath)); // 파일을 저장한다
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
