package com.kh.tworavel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IntroController {



	
	@RequestMapping(value = {"/intro.do"}, method = {RequestMethod.GET}) //main으로 가는 
	public String IntroPage(HttpServletRequest request, HttpServletResponse response) {
	       
	   return "intro";
	}
}
	




//@RequestMapping(value = {"/intro.do,"}, method = {RequestMethod.GET}) //main으로 가는 
//public ModelAndView MainPage(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv) {
//         mv.setViewName("MainPage");
//   return mv;
//}