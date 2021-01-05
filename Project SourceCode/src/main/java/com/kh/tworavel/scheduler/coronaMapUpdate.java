package com.kh.tworavel.scheduler;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.tworavel.common.CoronaParsing;
import com.kh.tworavel.model.domain.CoronaMap;
import com.kh.tworavel.model.service.CoronaMapService;

@Component
public class coronaMapUpdate {
	
	@Autowired
	private CoronaMapService cmService;
	
	@Scheduled(cron = "0 0 10 * * *")
	public void minusLoginPoint() {
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println("time : "+format1.format(date));
		
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
			System.out.println("코로나 맵에서 "+cnt+"개 지역이 업데이트 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
