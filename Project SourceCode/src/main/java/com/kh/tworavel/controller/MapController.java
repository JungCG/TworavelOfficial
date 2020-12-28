package com.kh.tworavel.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tworavel.model.domain.Map;
import com.kh.tworavel.model.service.MapService;

@Controller
public class MapController {
	// tag값의 정보를 가져오는 메소드
	@Autowired
	private MapService mapService;

	@RequestMapping(value = "selectMap.do", method = RequestMethod.GET)
	public ModelAndView selectMap(ModelAndView mv) {
		mv.clear();
		List<Map> list = new ArrayList<Map>();

		list = mapService.selectMap();
		mv.addObject("mList", list);
		mv.setViewName("PotatoMap");
		return mv;
	}

	@RequestMapping(value ="tworavelmap.do", method = RequestMethod.GET)
	public ModelAndView testMap(ModelAndView mv) {
		mv.clear();
		List<Map> list = new ArrayList<Map>();
		list = mapService.selectMap();
		mv.addObject("mList", list);
		mv.setViewName("tworavelmap");
		return mv;

	}

	@RequestMapping(value = "mapmap.do", method = RequestMethod.GET)
	public ModelAndView testMap1(ModelAndView mv) {
		/*
		 * mv.clear(); List<Map> list = new ArrayList<Map>();
		 * 
		 * list = mapService.selectMap();
		 * 
		 * System.out.println("길이"+list.size()); for(int i =0; i<=list.size();i++) {
		 * System.out.println(list.get(i).getTitle()); }
		 * 
		 * mv.addObject("mList",list);
		 */
		mv.setViewName("mapmap");
		return mv;
	}

	@RequestMapping(value = "weather.do", method = RequestMethod.GET)
	public ModelAndView weather(ModelAndView mv) {
		/*
		 * mv.clear(); List<Map> list = new ArrayList<Map>();
		 * 
		 * list = mapService.selectMap();
		 * 
		 * System.out.println("길이"+list.size()); for(int i =0; i<=list.size();i++) {
		 * System.out.println(list.get(i).getTitle()); }
		 * 
		 * mv.addObject("mList",list);
		 */
		mv.setViewName("weather");
		return mv;
	}

	@RequestMapping(value = "rmrm.do", method = RequestMethod.GET)
	public ModelAndView testMap12(ModelAndView mv) {
		/*
		 * mv.clear(); List<Map> list = new ArrayList<Map>();
		 * 
		 * list = mapService.selectMap();
		 * 
		 * System.out.println("길이"+list.size()); for(int i =0; i<=list.size();i++) {
		 * System.out.println(list.get(i).getTitle()); }
		 * 
		 * mv.addObject("mList",list);
		 */
		mv.setViewName("rmrm");
		return mv;
	}

	@RequestMapping(value = "markertest.do", method = RequestMethod.GET)
	public ModelAndView testMap123(ModelAndView mv) {
		/*
		 * mv.clear(); List<Map> list = new ArrayList<Map>();
		 * 
		 * list = mapService.selectMap();
		 * 
		 * System.out.println("길이"+list.size()); for(int i =0; i<=list.size();i++) {
		 * System.out.println(list.get(i).getTitle()); }
		 * 
		 * mv.addObject("mList",list);
		 */
		mv.setViewName("markertest");
		return mv;
	}

	@RequestMapping(value = "categoryList.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public @ResponseBody void categoryList(ModelAndView mv, HttpServletResponse response) {
		response.setContentType("application/x-json; charset=UTF-8");
		List<Map> list = new ArrayList<Map>();
		list = (List<Map>) mapService.selectMap();
		JSONArray jsonArray = new JSONArray();
		JSONObject json = null;
		try {
			for (int i = 0; i < list.size(); i++) {
				json = new JSONObject();
				json.put("title", list.get(i).getTitle());
				json.put("mapx", list.get(i).getMapx());
				json.put("mapy", list.get(i).getMapy());
				json.put("address", list.get(i).getAddress());
				json.put("tel", list.get(i).getTel());

				jsonArray.add(json);
			}
			String jsonSt = jsonArray.toJSONString();
			response.getWriter().print(jsonSt);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
