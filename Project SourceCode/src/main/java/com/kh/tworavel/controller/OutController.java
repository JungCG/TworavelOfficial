package com.kh.tworavel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.tworavel.model.service.OutService;

@Controller
public class OutController {
	@Autowired
	private OutService oService;
}
