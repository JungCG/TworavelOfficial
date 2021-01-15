package com.kh.tworavel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tworavel.model.domain.Companion;
import com.kh.tworavel.model.service.CompanionService;

@Controller
public class IntroController {

	@Autowired
	private CompanionService cService;

	
	@RequestMapping(value = {"/intro.do"}, method = {RequestMethod.GET}) //main으로 가는 
	public ModelAndView IntroPage(HttpServletRequest request, HttpServletResponse response,ModelAndView mv) {
		List<Companion>arealist = cService.selectCountarea();
		List<Companion>peoplelist = cService.selectCountpeople();
		List<Companion>tendencylist = cService.selectCounttendency();
		try {
			mv.addObject("m1", arealist.get(0).getC_id());
			mv.addObject("m2", arealist.get(1).getC_id());
			mv.addObject("m3", arealist.get(2).getC_id());
			mv.addObject("m4", arealist.get(3).getC_id());
			mv.addObject("m5", arealist.get(4).getC_id());
			mv.addObject("m6", arealist.get(5).getC_id());
			mv.addObject("m7", arealist.get(6).getC_id());
			mv.addObject("m8", arealist.get(7).getC_id());
			mv.addObject("p1", peoplelist.get(0).getC_id());
			mv.addObject("p2", peoplelist.get(1).getC_id());
			mv.addObject("p3", peoplelist.get(2).getC_id());
			mv.addObject("t1", tendencylist.get(0).getC_id());
			mv.addObject("t2", tendencylist.get(1).getC_id());
			mv.addObject("t3", tendencylist.get(2).getC_id());
			mv.addObject("t4", tendencylist.get(3).getC_id());
			mv.addObject("t5", tendencylist.get(4).getC_id());

		}catch(Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("chart");
		mv.setViewName("intro");
		return mv;
	}
}
	




//@RequestMapping(value = {"/intro.do,"}, method = {RequestMethod.GET}) //main으로 가는 
//public ModelAndView MainPage(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv) {
//         mv.setViewName("MainPage");
//   return mv;
//}