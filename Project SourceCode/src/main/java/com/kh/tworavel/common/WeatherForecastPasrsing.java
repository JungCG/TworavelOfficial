package com.kh.tworavel.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.kh.tworavel.model.domain.WeatherForecast;




@Controller
public class WeatherForecastPasrsing {
	public static String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}
	
	
	
	@RequestMapping(value="weatherforecast.do")
	@ResponseBody
    public Object main(ModelAndView mv,HttpServletRequest request) throws SAXException, IOException{
		
		String currentdate = "202101090600";
		String regId =request.getParameter("area");
		String weid = null;
     	Calendar cal = Calendar.getInstance();
    	cal.setTime(new Date());
    	DateFormat df = new SimpleDateFormat("yyyyMMdd");
    	String today =null; 
    	today=df.format(cal.getTime())+"0600";
    	System.out.println(today);
		if(regId.equals("11B10101")||regId.equals("11B20201")||regId.equals("11B20601")||regId.equals("11B20305")) {
			
			weid="11B00000";
		}
		else if(regId.equals("11D10301")||regId.equals("11D10401")||regId.equals("11D20501")){
			weid ="11D10000";
			
		}else if(regId.equals("11C20401")||regId.equals("11C20101")) {
			weid ="11C20000";
			
		}else if(regId.equals("11C10301")) {
			weid ="11C10000";
			
		}else if(regId.equals("11F20501")||regId.equals("21F20801")||regId.equals("11F20401")) {
			weid ="11F20000";
			
		}else if(regId.equals("11F20401")||regId.equals("21F10501")) {
			weid ="11F10000";
			
		}else if(regId.equals("11H10701")||regId.equals("11H10501")||regId.equals("11H10201")) {
			weid ="11H10000";
			
		}else if(regId.equals("11H20201")||regId.equals("11H20101")||regId.equals("11H20301")) {
			weid ="11H20000";
			
		}else if(regId.equals("11G00201")||regId.equals("11G00401")) {
			weid ="11G00000";
			
		}
		else {
			
			weid="11B00000";
		}
		String url1 ="http://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst?serviceKey=Uq5b5ZVnMrI8bHXLfp7QobEpnbwUxx0hbBjcymfQ361Xegx5pjA2gkrm%2BAKepXa1aOhMoqVT1G7PHCoo%2B5VsNw%3D%3D&pageNo=1&numOfRows=10&dataType=XML&regId="+weid+"&tmFc="+today;
		//String url1 = "http://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst?serviceKey=Uq5b5ZVnMrI8bHXLfp7QobEpnbwUxx0hbBjcymfQ361Xegx5pjA2gkrm%2BAKepXa1aOhMoqVT1G7PHCoo%2B5VsNw%3D%3D&numOfRows=10&pageNo=1&regId="+weid+"&tmFc="+currentdate;
		WeatherForecast vo = new WeatherForecast();
		try {
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder;
			dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url1);
			doc.getDocumentElement().normalize();
			NodeList nList = doc.getElementsByTagName("item");
			Node nNode = nList.item(0);
			Element eElement = (Element) nNode;
			vo.setWf3(getTagValue("wf3Pm",eElement));
			vo.setWf4(getTagValue("wf4Pm",eElement));
			vo.setWf5(getTagValue("wf5Pm",eElement));
			vo.setWf6(getTagValue("wf6Pm",eElement));
			vo.setWf7(getTagValue("wf7Pm",eElement));
			vo.setWf8(getTagValue("wf8",eElement));
			vo.setWf9(getTagValue("wf9",eElement));
			vo.setWf10(getTagValue("wf10",eElement));
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}
		//
        String url ="http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa?ServiceKey=Uq5b5ZVnMrI8bHXLfp7QobEpnbwUxx0hbBjcymfQ361Xegx5pjA2gkrm%2BAKepXa1aOhMoqVT1G7PHCoo%2B5VsNw%3D%3D"
        		+"&pageNo=1&numOfRows=10&dataType=XML&regId="+regId+"&tmFc="+today;
        List<WeatherForecast>list = new ArrayList<WeatherForecast>();
		try {
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder;
			dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			doc.getDocumentElement().normalize();
			NodeList nList = doc.getElementsByTagName("item");
			Node nNode = nList.item(0);
			Element eElement = (Element) nNode;
			vo.setTaMax3(getTagValue("taMax3",eElement));
			vo.setTaMax4(getTagValue("taMax4",eElement));
			vo.setTaMax5(getTagValue("taMax5",eElement));
			vo.setTaMax6(getTagValue("taMax6",eElement));
			vo.setTaMax7(getTagValue("taMax7",eElement));
			vo.setTaMax8(getTagValue("taMax8",eElement));
			vo.setTaMax9(getTagValue("taMax9",eElement));
			vo.setTaMax10(getTagValue("taMax10",eElement));
			vo.setTaMin3(getTagValue("taMin3",eElement));
			vo.setTaMin4(getTagValue("taMin4",eElement));
			vo.setTaMin5(getTagValue("taMin5",eElement));
			vo.setTaMin6(getTagValue("taMin6",eElement));
			vo.setTaMin7(getTagValue("taMin7",eElement));
			vo.setTaMin8(getTagValue("taMin8",eElement));
			vo.setTaMin9(getTagValue("taMin9",eElement));
			vo.setTaMin10(getTagValue("taMin10",eElement));
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}
		
		list.add(vo);
		 Map<String, Object> retVal = new HashMap<String, Object>();
		 retVal.put("list",list);
	        return retVal;
    }
}