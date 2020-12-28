package com.kh.tworavel.controller;


import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tworavel.common.VillageWeatherParsing;

@Controller
public class WeatherController {
	
	@Autowired
	private VillageWeatherParsing weatherparsing;
	
	
	//지역 날씨 메소드 ajax
	@ResponseBody
	@RequestMapping(value = "/Weather.do", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public String getVillageWeather(@RequestParam Map<String, String> param) {
		JSONObject job = new JSONObject();
		String weatherArr[] = new String[4];
		try {
			weatherArr = weatherparsing.WeatherParsing(param.get("nx"),param.get("ny"));
			job.put("SKY", weatherArr[0]);
			job.put("T3H", weatherArr[1]);
			job.put("REH", weatherArr[2]);
			job.put("VEC", weatherArr[3]);
			job.put("region", param.get("region"));
		} catch (Exception e) {
			job.put("result", -1);
		} finally {
		}
		return job.toJSONString();
	}
	
}
