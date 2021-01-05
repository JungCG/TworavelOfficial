package com.kh.tworavel.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tworavel.model.service.BoardService;
import com.kh.tworavel.model.service.CompanionService;
import com.kh.tworavel.model.service.MemberService;



@Controller
public class AdminController {

	@Autowired
	private MemberService mService;
	
	@Autowired
	private BoardService bService;
	public static final int LIMIT = 10;
	@Autowired
	private CompanionService cService;
	
	
	@RequestMapping(value = "adminpage.do")
	public ModelAndView admin(ModelAndView mv, @RequestParam(name = "page", defaultValue = "1") int page,@RequestParam(name="type", defaultValue = "B",required = false) char b_type){
		
		int startPage =0;
		int endPage=0;
		int listCount=0;

		if(page%5==0) {
			
			startPage = (page/5 -1)*5+1;
			endPage= (page/5)*5;
		}else if(page%5!=0) {
			
			startPage = (page/5)*5 +1;
			endPage=(page/5 + 1)*5;
		}
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			String type = String.valueOf(b_type);
			System.out.println(type);
			if(type.equals("B")) {
				listCount = bService.selectBoardAllCount();
				System.out.println(listCount);
				System.out.println("보드실행");
			}
			else if (type.equals("C")) {
				listCount = bService.selectBoardAllCount();
			}
			else if(type.equals("M")) {
				listCount = mService.selectMemberAllCount();
				System.out.println(listCount);
				System.out.println("멤버실행");
			}
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			if(type.equals("B")) {
				mv.addObject("blist",bService.selectBoardAll(currentPage,LIMIT));
				System.out.println(bService.selectBoardAll(currentPage,LIMIT).size());
			}
			else if (type.equals("C")) {
				mv.addObject("blist",bService.selectBoardAll(currentPage,LIMIT));
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
		mv.setViewName("redirect:adminpage.do");
		return mv;
	}

}