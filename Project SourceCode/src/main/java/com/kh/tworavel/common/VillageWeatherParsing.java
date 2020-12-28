package com.kh.tworavel.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Component;


@Component
public class VillageWeatherParsing {
	public String[] WeatherParsing(String nx, String ny) {
		String weatherArr[] = new String[5];
		try { /* 요청정보입력 * 아래와 같은 정보들은 사용자 가이드를 확인하여 찾아주시면 됩니다. * 위도 경도는 엑셀파일 안에 있습니다. * */
			
			
			String calArr[] = getTodayDate();
			
			
			// 자신이 조회를 원하는 지역의 경도와 위도를 입력해주세요
			//String nx = "60"; // 경도
			//String ny = "127"; // 위도
			String baseDate = calArr[0]; // 자신이 조회하고싶은 날짜를 입력해주세요
			String baseTime = calArr[1]; // 자신이 조회하고싶은 시간대를 입력해주세요 // 서비스 인증키입니다. 공공데이터포털에서 제공해준 인증키를 넣어주시면 됩니다.
			String serviceKey = "I49jLZ94wz42QYjN%2B0i7AopUn7lzjp%2Byxe5rg0Nj%2BVuapiSnwMaP7H%2FIlAab5jMFql6%2FaHMvy4ieMIItbJ2sAg%3D%3D";

			// 정보를 모아서 URL정보를 만들면됩니다. 맨 마지막 "&_type=json"에 따라 반환 데이터의 형태가 정해집니다.
			String urlStr = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?"
					+ "serviceKey=" + serviceKey + "&dataType=JSON" + "&base_date=" + baseDate + "&base_time=" + baseTime + "&nx=" + nx
					+ "&ny=" + ny;
			URL url = new URL(urlStr); // 위 urlStr을 이용해서 URL 객체를 만들어줍니다.
			

			BufferedReader bf;
			String line = "";
			String result = "";

			// 날씨 정보를 받아옵니다.
			bf = new BufferedReader(new InputStreamReader(url.openStream()));

			// 버퍼에 있는 정보를 하나의 문자열로 변환.
			while ((line = bf.readLine()) != null) {
				result = result.concat(line);
				//System.out.println("받아온 데이터 확인용 : " + result); // 받아온 데이터를 확인해봅니다.
			}

			// Json parser를 만들어 만들어진 문자열 데이터를 객체화 합니다.
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(result);
			
			// Top레벨 단계인 response 키를 가지고 데이터를 파싱합니다.
			JSONObject parse_response = (JSONObject) obj.get("response");
			// response 로 부터 body 찾아옵니다.
			JSONObject parse_body = (JSONObject) parse_response.get("body");
			// body 로 부터 items 받아옵니다.
			JSONObject parse_items = (JSONObject) parse_body.get("items");
			// items로 부터 itemlist 를 받아오기 itemlist : 뒤에 [ 로 시작하므로 jsonarray이다
			JSONArray parse_item = (JSONArray) parse_items.get("item");

			String category;
			JSONObject weather; // parse_item은 배열형태이기 때문에 하나씩 데이터를 하나씩 가져올때 사용합니다.
			
			
			// 필요한 데이터만 가져오려고합니다.
			for (int i = 0; i < parse_item.size(); i++) {
				weather = (JSONObject) parse_item.get(i);
				//System.out.println("weather : " + weather);
				//String base_Date = (String)weather.get("baseDate");
				//String fcst_Time = (String)weather.get("fcstDate");
				String fcst_Value = (String) weather.get("fcstValue"); // 실수로된 값과 정수로된 값이 둘다 있어서 실수로 통일했습니다.
				//String nX = (String)weather.get("nx");
				//String nY = (String)weather.get("ny");
				category = (String) weather.get("category");
				//String base_Time = (String)weather.get("baseTime");
				//String fcscDate = (String)weather.get("fcscDate");
				
				if(category.equals("SKY")) {	// SKY : 하늘상태		//맑음	0 ～ 5	구름많음	6 ～ 8	흐림	9 ～ 10
					int fcst_Value2 = Integer.parseInt(fcst_Value);
					if(fcst_Value2<6) {
						weatherArr[0] = "맑음";
					}else if(5 < fcst_Value2 && fcst_Value2 < 9) {
						weatherArr[0] = "구름많음";
					}else if(8 < fcst_Value2 && fcst_Value2 < 11) {
						weatherArr[0] = "흐림";
					}
				}else if(category.equals("T3H")) {	// T3H : 3시간 기온 (C)
					weatherArr[1] = fcst_Value;
				}else if(category.equals("REH")) {	// REH : 습도 (%)
					weatherArr[2] = fcst_Value;
				}else if(category.equals("VEC")) {	// VEC : 풍향 (m/s)
					weatherArr[3] = fcst_Value;
					System.out.println("풍향 : " + fcst_Value);
				}
				//처음 서울 지역 보여줄 때
				weatherArr[4] = "서울";

			}
			// 마지막에보면 에러가 발생하였는데 casting문제입니다.
			// 이는 반환되는 데이터타입이 달라서인데 이번 글에서는 여기까지만하고
			// 데이터베이스에 입력할때는 수정해서 하겠습니다.
			bf.close();
		} catch (Exception e) {
			System.out.println("catch 로 들어옴!");
			e.printStackTrace();
		}
		return weatherArr;
	}
	
	
	public String[] getTodayDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String calArr[] = new String[2];
		Calendar cal = Calendar.getInstance();
		int year = cal.get(cal.YEAR);
		int month = cal.get(cal.MONTH) + 1;
		int day = cal.get(cal.DAY_OF_MONTH);
		int hour = cal.get(Calendar.HOUR_OF_DAY);	//0~23
		
		String month2  = String.valueOf(month);
		String day2  = String.valueOf(day);
		String hour2  = String.valueOf(hour);

		//시간
		if (2 < hour) { // 3~23시
			for (int i = 1; i < 8; i++) {
				if (hour / 3 == i) {
					hour = 2 + (3 * (i - 1));
				}
			}
			hour2  = String.valueOf(hour);
			calArr[0] =  String.valueOf(year) + month2 + day2;
		}else if(hour<3) {
			if(hour/3==0) {
				hour = 23;
				hour2  = String.valueOf(hour);
				cal.add(Calendar.DATE, -1);
			}
			calArr[0] =  sdf.format(cal.getTime());
		}
		
		
		if(hour<10) {	//0~9
			hour2 = "0" + hour2;
		}
		if(month<10) {
			month2 = "0" + month2;
		}
		
		
			
		
		calArr[1] = hour2 + "00";
		
		System.out.println("날짜 : " + calArr[0]);
		System.out.println("시간 : " + calArr[1]);
		
		return calArr;
	}
	
	
	
}
