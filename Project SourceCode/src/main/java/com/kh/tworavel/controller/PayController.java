package com.kh.tworavel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class PayController {

	@RequestMapping(value="point.do")
	public ModelAndView chargepoint(ModelAndView mv) {
		mv.setViewName("testiamport");
		return mv;
	}
	
	
	@RequestMapping(value="buypoint")
	public @ResponseBody void chargepoint(Long amount) {
		
		System.out.println(amount);
	}
}
