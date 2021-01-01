package com.kh.tworavel.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tworavel.common.CoronaParsing;
import com.kh.tworavel.model.domain.CoronaMap;
import com.kh.tworavel.model.domain.Map;
import com.kh.tworavel.model.service.CoronaMapService;
import com.kh.tworavel.model.service.MapService;

@Controller
public class MapController {
	// tag값의 정보를 가져오는 메소드
	@Autowired
	private MapService mapService;

	@Autowired
	private CoronaMapService cmService;

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
	public ModelAndView testMap(ModelAndView mv,@RequestParam(name="keyword",required = false)String searchtext) {
		List<Map> list = new ArrayList<Map>();
		list = mapService.selectMap();
		mv.addObject("mList", list);
		mv.addObject("searchtext",searchtext);
		mv.setViewName("tworavelmap");
		return mv;

	}
@RequestMapping(value = "testmapsearch.do", method = RequestMethod.GET)
	public ModelAndView testmapsearch(ModelAndView mv) {
		mv.setViewName("testmapsearch");
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

	@RequestMapping(value = "/coronaMapUpdate.do", method = RequestMethod.GET)
	public String coronaMapUpdate(HttpServletRequest request, HttpServletResponse response, Model model,
			ModelAndView mv) throws IOException {

		CoronaParsing cp = new CoronaParsing();
		List<HashMap<String, String>> parsedList = cp.coronaList();
		try {
			int cnt = 0;
			for (int i = 0; i < parsedList.size(); i++) {
				HashMap<String, String> cmap = parsedList.get(i);
				String gubun = cmap.get("gubun");
				int c_defCnt = Integer.parseInt(cmap.get("c_defCnt"));
				int c_isolIngCnt = Integer.parseInt(cmap.get("c_isolIngCnt"));
				int c_isolClearCnt = Integer.parseInt(cmap.get("c_isolClearCnt"));
				int c_incDec = Integer.parseInt(cmap.get("c_incDec"));
				int c_deathCnt = Integer.parseInt(cmap.get("c_deathCnt"));
				double c_qurRate;
				if (cmap.get("c_qurRate").equals("-"))
					c_qurRate = 0;
				else
					c_qurRate = Double.parseDouble(cmap.get("c_qurRate"));
				String c_createDt = cmap.get("c_createDt");
				CoronaMap cm = new CoronaMap(gubun, c_defCnt, c_isolIngCnt, c_isolClearCnt, c_incDec, c_deathCnt,
						c_qurRate, c_createDt);

				int temp = cmService.updateUsingName(cm);
				cnt += temp;
			}
			
			if (cnt > 0) {
				model.addAttribute("msg", "코로나맵을 업데이트하였습니다.");
				model.addAttribute("url", "/coronaMap.do");
			} else {
				model.addAttribute("msg", "업데이트 할 내용이 없습니다.");
				model.addAttribute("url", "/coronaMap.do");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "업데이트 도중 에러가 발생했습니다.");
			model.addAttribute("url", "/coronaMap.do");
		}
		return "alertMsg";
	}

	@RequestMapping(value = "coronaMap.do", method = RequestMethod.GET)
	public ModelAndView coronaMap(HttpServletRequest request, HttpServletResponse response, Model model, ModelAndView mv) {
		List<CoronaMap> coronaList = null;
		try {
			coronaList = cmService.selectList();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("coronaList", coronaList);
		mv.setViewName("coronaMap");
		return mv;
	}
}
