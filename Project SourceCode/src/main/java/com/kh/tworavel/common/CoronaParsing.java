package com.kh.tworavel.common;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class CoronaParsing {
	
	public List<HashMap<String, String>> coronaList(){
		List<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");

			Date dDate = new Date();
			dDate = new Date(dDate.getTime()+(1000*60*60*24*-1));

			Date time = new Date();
			String today = format.format(time);
			String yesterday = format.format(dDate);

			// parsing할 url 지정(API 키 포함해서)
			String url = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?serviceKey=LRnKfFBbtLlp71W0L%2BEz06LohOAKOIaYNjMhL5lvsRv1ynNvnwyXsUDqiLXiGCZQW87qXtXW%2FPI8M6UOmhIatA%3D%3D&pageNo=&numOfRows=&startCreateDt="+today+"&endCreateDt="+today;
			
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			// root tag
			doc.getDocumentElement().normalize();

			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("item");
			
			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					HashMap<String, String> map = new HashMap<String,String>();
					
					Element eElement = (Element) nNode;

					map.put("gubun", getTagValue("gubun", eElement));
					map.put("c_defCnt", getTagValue("defCnt", eElement));
					map.put("c_isolIngCnt", getTagValue("isolIngCnt", eElement));
					map.put("c_isolClearCnt", getTagValue("isolClearCnt", eElement));
					map.put("c_incDec", getTagValue("incDec", eElement));
					map.put("c_deathCnt", getTagValue("deathCnt", eElement));
					map.put("c_qurRate", getTagValue("qurRate", eElement));
					map.put("c_createDt", getTagValue("createDt", eElement));
					
					list.add(map);
//					System.out.println("====================================================");
//					System.out.println("등록일시분초  : " + getTagValue("createDt", eElement));
//					System.out.println("시도명(한글) : " + getTagValue("gubun", eElement));
//					System.out.println("확진자 수 : " + getTagValue("defCnt", eElement));
//					System.out.println("격리중 환자 수  : " + getTagValue("isolIngCnt", eElement));
//					System.out.println("격리 해제 수 : " + getTagValue("isolClearCnt", eElement));
//					System.out.println("전일대비 증감 수 : " + getTagValue("incDec", eElement));
//					System.out.println("지역발생 수 : " + getTagValue("localOccCnt", eElement));
//					System.out.println("해외유입 수 : " + getTagValue("overFlowCnt", eElement));
//					System.out.println("사망자 수 : " + getTagValue("deathCnt", eElement));
//					System.out.println("10만명당 발생률 : " + getTagValue("qurRate", eElement));
//					System.out.println("기준일시 : " + getTagValue("stdDay", eElement));
				} // if end
			} // for end
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// tag값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}
	
} // class end
