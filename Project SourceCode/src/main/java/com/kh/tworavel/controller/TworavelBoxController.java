package com.kh.tworavel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TworavelBoxController {
	@RequestMapping(value = "/TworavelBox.do", method = RequestMethod.GET)
	public ModelAndView TworavelBox(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv) {
		mv.setViewName("TworavelBox");
		return mv;
	}
}
