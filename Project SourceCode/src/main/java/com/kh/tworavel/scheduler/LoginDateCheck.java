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
import com.kh.tworavel.model.domain.Member;
import com.kh.tworavel.model.service.CoronaMapService;
import com.kh.tworavel.model.service.MemberService;

@Component
public class LoginDateCheck {
	
	@Autowired
	private MemberService mService;
	
	@Scheduled(cron = "55 59 23 * * *")
	public void minusLoginPoint() {
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println("time : "+format1.format(date));
		
		List<Member> memberList = mService.unEqualLoginDate();
		if(memberList != null) {
			int result = 0;
			for(int i = 0 ; i<memberList.size(); i++) {
				Member m = memberList.get(i);
				String m_id = m.getM_id();
				System.out.println("포인트 삭감 대상 : "+m_id);
				int temp = mService.minusLoginPoint(m_id);
				result += temp;
			}
			System.out.println("포인트 삭감된 회원 수 : "+result);
		}
	}
}
