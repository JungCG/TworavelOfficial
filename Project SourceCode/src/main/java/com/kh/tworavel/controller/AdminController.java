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
import com.kh.tworavel.model.service.ReportService;

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

	@Autowired
	private ReportService rService;
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
			if (type.equals("B")) {
				listCount = bService.selectBoardAllCount();
			}
			else if (type.equals("C")) {
				listCount = cService.listCountC();
			}
			else if(type.equals("M")) {
				listCount = mService.selectMemberAllCount();
			}
			else if(type.equals("S")) {
				
				listCount = rService.selectReportAllCount();
			}
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			if(type.equals("B")) {
				mv.addObject("blist",bService.selectBoardAll(currentPage,LIMIT));
			}
			else if (type.equals("C")) {
				mv.addObject("clist",cService.selectListCp(currentPage,LIMIT));
			}
			else if(type.equals("M")) {
				mv.addObject("mlist",mService.selectMemberAll(currentPage,LIMIT));
			}else if(type.equals("S")){
				mv.addObject("rlist",rService.selectReportAll(currentPage,LIMIT));
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
			return mv;

		}
		return mv;
	}
	@RequestMapping(value = "Adminboarddelete.do", method = RequestMethod.GET)
	public ModelAndView BoardDeleteService(@RequestParam(name = "b_id") int b_id, ModelAndView mv,
		HttpServletRequest request) {
		
		try {
			bService.deleteBoard(b_id);
		}catch(Exception e) {
			mv.addObject("msg","게시글 삭제 실패");
			mv.addObject("url", "/adminpage.do?type=B");
			mv.setViewName("alertMsg");
			return mv;

		}
		mv.addObject("msg","해당 게시글 삭제 성공");
		mv.addObject("url", "/adminpage.do?type=B");
		mv.setViewName("alertMsg");		
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
		try {
			mService.outEmailSend(mService.selectOne(m_id).getM_email(), vo);
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", " 회원 삭제가 실패하였습니다");
			mv.addObject("url", "/adminpage.do?type=M");
			mv.setViewName("alertMsg");
			return mv;

		}
		/////////////////////////////////////
		mv.addObject("msg", "회원을 삭제 성공하였습니다");
		mv.addObject("url", "/adminpage.do?type=M");
		mv.setViewName("alertMsg");
		return mv;
	}

	@RequestMapping(value = "admincompaniondelete.do", method = RequestMethod.GET)
	public ModelAndView CompanionDeleteService(@RequestParam(name = "c_id") int c_id, ModelAndView mv,
			HttpServletRequest request) {
		
		try {
			
			cService.deleteC(c_id);
		}catch(Exception e) {
			
			e.printStackTrace();
			mv.addObject("msg", "동행글 삭제 실패");
			mv.addObject("url", "/adminpage.do?type=C");
			mv.setViewName("alertMsg");
			return mv;
		}
		mv.addObject("msg", "동행글 삭제 성공");
		mv.addObject("url", "/adminpage.do?type=C");
		mv.setViewName("alertMsg");
		return mv;
	}
	@RequestMapping(value = "adminddeleteReport", method = RequestMethod.GET)
	public ModelAndView adminddeleteReport(@RequestParam(name = "r_id") int r_id, ModelAndView mv,
			HttpServletRequest request) {
		
		
		try {
			
			rService.deleteReport(r_id);
			
		}catch(Exception e) {
			
			e.printStackTrace();
			mv.addObject("msg", "신고내역 삭제가 실패하였습니다");
			mv.addObject("url", "/adminpage.do?type=S");

			mv.setViewName("alertMsg");
			return mv;

		}

		mv.addObject("msg", "해당 신고내역이 삭제되었습니다");
		mv.addObject("url", "/adminpage.do?type=S");

		mv.setViewName("alertMsg");
		return mv;
	}
	
	@RequestMapping(value = "adminminuspoint")
	public ModelAndView adminminuspoint(@RequestParam(name = "m_id") String m_id, ModelAndView mv,
			HttpServletRequest request) {
		Member vo = new Member();
		mService.adminminuspoint(m_id);
		
		try {
			
		}catch(Exception e) {
			
			e.printStackTrace();
			mv.addObject("msg", "포인트 리셋 실패");
			mv.addObject("url", "/adminpage.do?type=S");
			mv.setViewName("alertMsg");
			return mv;
		}
		mv.addObject("msg", "해당 회원의 포인트가 리셋 되었습니다");
		mv.addObject("url", "/adminpage.do?type=S");
		mv.setViewName("alertMsg");
		return mv;
	}
	
}