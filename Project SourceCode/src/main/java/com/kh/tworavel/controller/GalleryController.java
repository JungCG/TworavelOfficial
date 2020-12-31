package com.kh.tworavel.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tworavel.model.service.GalleryService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class GalleryController {

	@Autowired
	private GalleryService gService;
	public static final int LIMIT = 6; //한 페이지당 6개 사진을 보여준다. 

//게시판 리스트

	// 게시글 리스트 select
	@RequestMapping(value = { "/gallery_list.do" }, method= {RequestMethod.GET})
	public ModelAndView galleryListService(@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv) {
		int listCount = gService.listCount(); // 게시글 개수
		int maxPage = (int) ((double) listCount / LIMIT + 0.9);
		mv.addObject("maxPage", maxPage);
		mv.addObject("currentPage", page);
		mv.addObject("list", gService.selectList(page, LIMIT)); // 첫번째 페이지에 5개
		mv.setViewName("gallery_list"); // gallery/glist View페이지가 보여짐 
		return mv;
	}

//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
//	
//	/**
//	 * Simply selects the home view to render by returning its name.
//	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "gallery_list";
//		

}
