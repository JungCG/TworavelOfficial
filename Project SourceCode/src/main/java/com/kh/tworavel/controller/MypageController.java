package com.kh.tworavel.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tworavel.common.VillageWeatherParsing;
import com.kh.tworavel.model.domain.Blike;
import com.kh.tworavel.model.domain.Clike;
import com.kh.tworavel.model.domain.CompanionInfo;
import com.kh.tworavel.model.domain.Favor;
import com.kh.tworavel.model.domain.Member;
import com.kh.tworavel.model.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	private VillageWeatherParsing weatherparsing;
	@Autowired
	private MypageService mypService;
	@Autowired
	private Favor favor;
	@Autowired
	private Blike blike;
	@Autowired
	private Clike clike;
	@Autowired
	private CompanionInfo companioninfo;

	public static final int LIMIT = 10;


	// 마이페이지
	@RequestMapping(value = "/MyPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getMyPage(HttpServletRequest request, ModelAndView mv) {
		try {
			String userID = (String) request.getSession().getAttribute("userID");
			mv.addObject("userID", userID);
			mv.addObject("member", mypService.selectMember(userID));
			mv.setViewName("mypage_form");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 마이페이지 수정페이지 이동
	@RequestMapping(value = "/ProfileUpdateForm.do", method = RequestMethod.GET)
	public ModelAndView getMyPageUpdateForm(@RequestParam(name = "m_id") String m_id, ModelAndView mv) {
		try {
			mv.addObject("member", mypService.selectMember(m_id));
			mv.setViewName("profile_update");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 마이페이지 수정하기
	@RequestMapping(value = "/ProfileUpdate.do", method = RequestMethod.POST)
	public ModelAndView getMyPageUpdate(Member m, @RequestParam(name = "upfile") MultipartFile report,
			HttpServletRequest request, ModelAndView mv) {
		try {
			// 첨부파일 저장
			if (report != null && !report.getOriginalFilename().equals("")) {
				saveFile(report, request);
				
				System.out.println("b에 있는 기존 파일 이름 : " + m.getM_image());
				System.out.println("report 파일 이름 : " + report.getOriginalFilename());
				System.out.println("첨부파일 변경함~");
				m.setM_image(report.getOriginalFilename());
			}
			mypService.updateMember(m);
			mv.addObject("member", mypService.updateMember(m));
			mv.setViewName("redirect:MyPage.do");
		} catch (Exception e) {
			System.out.println("프로필 수정 실패!");
			e.printStackTrace();
		}
		return mv;
	}

	// 마이페이지 등록한 글 목록 조회
	@RequestMapping(value = "/WritedList.do", method = RequestMethod.GET)
	public ModelAndView getWritedList(@RequestParam(name = "m_id") String m_id,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "page2", defaultValue = "1") int page2, ModelAndView mv) {
		// 한 페이지당 출력할 목록 갯수
		int listCount, maxPage, listCount2, maxPage2;
		try {
			// 한 페이지당 출력할 목록 갯수
			listCount = mypService.selectBoardCountAll(m_id);
			maxPage = (int) ((double) listCount / LIMIT + 0.9);
			mv.addObject("board", mypService.selectBoardlist(m_id, page, LIMIT));

			listCount2 = mypService.selectCompanionCountAll(m_id);
			maxPage2 = (int) ((double) listCount2 / LIMIT + 0.9);
			mv.addObject("companion", mypService.selectCompanionlist(m_id, page2, LIMIT));

			mv.addObject("currentPage", page);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);

			mv.addObject("currentPage2", page2);
			mv.addObject("maxPage2", maxPage2);
			mv.addObject("listCount2", listCount2);
			

			mv.setViewName("mypage_writedlist");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	// 마이페이지 등록한 글 목록 조회
	@RequestMapping(value = "/WritedList2.do", method = RequestMethod.GET)
	public ModelAndView getWritedList2(@RequestParam(name = "m_id") String m_id,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "page2", defaultValue = "1") int page2, ModelAndView mv) {
		// 한 페이지당 출력할 목록 갯수
		int listCount, maxPage, listCount2, maxPage2;
		try {
			// 한 페이지당 출력할 목록 갯수
			listCount = mypService.selectBoardCountAll(m_id);
			maxPage = (int) ((double) listCount / LIMIT + 0.9);
			mv.addObject("board", mypService.selectBoardlist(m_id, page, LIMIT));
			
			listCount2 = mypService.selectCompanionCountAll(m_id);
			maxPage2 = (int) ((double) listCount2 / LIMIT + 0.9);
			mv.addObject("companion", mypService.selectCompanionlist(m_id, page2, LIMIT));
			
			mv.addObject("currentPage", page);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			
			mv.addObject("currentPage2", page2);
			mv.addObject("maxPage2", maxPage2);
			mv.addObject("listCount2", listCount2);
			
			mv.addObject("listView", "com");
			mv.setViewName("mypage_writedlist");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	
	@RequestMapping(value = "/BoardLikeDelete.do", method = RequestMethod.GET)
	public ModelAndView getBoardLikeDelete(HttpServletRequest request, @RequestParam(name = "b_id") int b_id, ModelAndView mv) {
		blike.setM_id((String) request.getSession().getAttribute("userID"));
		blike.setB_id(b_id);
		try {
			int result = 0;
			result = mypService.deleteBoardLikelist(blike);
			if(result>0) {
				mv.addObject("m_id", blike.getM_id());
				mv.setViewName("redirect:LikeList.do");
			}else {
				mv.addObject("failMsg", "좋아요 취소에 실패했습니다.");
				mv.setViewName("redirect:LikeList.do");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	@RequestMapping(value = "/CompanionLikeDelete.do", method = RequestMethod.GET)
	public ModelAndView getCompanionLikeDelete(HttpServletRequest request, @RequestParam(name = "c_id") int c_id, ModelAndView mv) {
		clike.setM_id((String) request.getSession().getAttribute("userID"));
		clike.setC_id(c_id);
		try {
			int result = 0;
			result = mypService.deleteCompanionLikelist(clike);
			if(result>0) {
				mv.addObject("m_id", clike.getM_id());
				mv.setViewName("redirect:LikeList2.do");
			}else {
				mv.addObject("failMsg", "좋아요 취소에 실패했습니다.");
				mv.setViewName("redirect:LikeList2.do");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
	
	
	
		// 마이페이지 좋아요한 글 목록 조회
		@RequestMapping(value = "/LikeList.do", method = RequestMethod.GET)
		public ModelAndView getLikeList(@RequestParam(name = "m_id") String m_id,
				@RequestParam(name = "page", defaultValue = "1") int page,
				@RequestParam(name = "page2", defaultValue = "1") int page2, ModelAndView mv) {
			// 한 페이지당 출력할 목록 갯수
			int listCount, maxPage, listCount2, maxPage2;
			try {
				// 한 페이지당 출력할 목록 갯수
				listCount = mypService.selectLikeBoardCountAll(m_id);
				maxPage = (int) ((double) listCount / LIMIT + 0.9);
				mv.addObject("board", mypService.selectLikeBoardlist(m_id, page, LIMIT));

				listCount2 = mypService.selectLikeCompanionCountAll(m_id);
				maxPage2 = (int) ((double) listCount2 / LIMIT + 0.9);
				mv.addObject("companion", mypService.selectLikeCompanionlist(m_id, page2, LIMIT));

				mv.addObject("currentPage", page);
				mv.addObject("maxPage", maxPage);
				mv.addObject("listCount", listCount);

				mv.addObject("currentPage2", page2);
				mv.addObject("maxPage2", maxPage2);
				mv.addObject("listCount2", listCount2);
				
				mv.setViewName("mypage_like");
			} catch (Exception e) {
				e.printStackTrace();
			}
			return mv;
		}
		@RequestMapping(value = "/LikeList2.do", method = RequestMethod.GET)
		public ModelAndView getLikeList2(@RequestParam(name = "m_id") String m_id,
				@RequestParam(name = "page", defaultValue = "1") int page,
				@RequestParam(name = "page2", defaultValue = "1") int page2, ModelAndView mv) {
			// 한 페이지당 출력할 목록 갯수
			int listCount, maxPage, listCount2, maxPage2;
			try {
				// 한 페이지당 출력할 목록 갯수
				listCount = mypService.selectLikeBoardCountAll(m_id);
				maxPage = (int) ((double) listCount / LIMIT + 0.9);
				mv.addObject("board", mypService.selectLikeBoardlist(m_id, page, LIMIT));
				
				listCount2 = mypService.selectLikeCompanionCountAll(m_id);
				maxPage2 = (int) ((double) listCount2 / LIMIT + 0.9);
				mv.addObject("companion", mypService.selectLikeCompanionlist(m_id, page2, LIMIT));
				
				mv.addObject("currentPage", page);
				mv.addObject("maxPage", maxPage);
				mv.addObject("listCount", listCount);
				
				mv.addObject("currentPage2", page2);
				mv.addObject("maxPage2", maxPage2);
				mv.addObject("listCount2", listCount2);
				
				mv.addObject("listView", "com");
				mv.setViewName("mypage_like");
			} catch (Exception e) {
				e.printStackTrace();
			}
			return mv;
		}

	// 마이페이지 동행신청내역 조회
	@RequestMapping(value = "/CompanionStatus.do", method = RequestMethod.GET)
	public ModelAndView getCompanionStatus(@RequestParam(name = "m_id") String m_id, ModelAndView mv) {
		try {
			// 신청한거
			mv.addObject("companioninfo_g", mypService.selectCompanioninfo(m_id));
			mv.addObject("companioninfo_t", mypService.selectCompanioninfo2(m_id));
			mv.setViewName("mypage_companion_status");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	// 마이페이지 동행신청내역 조회
	@RequestMapping(value = "/CompanionStatus2.do", method = RequestMethod.GET)
	public ModelAndView getCompanionStatus2(@RequestParam(name = "m_id") String m_id, ModelAndView mv) {
		try {
			// 신청한거
			mv.addObject("companioninfo_g", mypService.selectCompanioninfo(m_id));
			mv.addObject("companioninfo_t", mypService.selectCompanioninfo2(m_id));
			mv.addObject("listView", "t");
			mv.setViewName("mypage_companion_status");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/updateCompanionOk.do", method = RequestMethod.GET)
	public ModelAndView updateCompanionOk(@RequestParam(name = "c_id") int c_id, @RequestParam(name = "m_id") String m_id, HttpServletRequest request, ModelAndView mv) {
		try {
			String userID = (String) request.getSession().getAttribute("userID");
			// 신청한거
			companioninfo.setC_id(c_id);
			companioninfo.setM_id(m_id);
			int result = mypService.updateCompanionOk(companioninfo);
			if(result>0) {
				mv.setViewName("redirect:CompanionStatus2.do?m_id="+userID);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value = "/updateCompanionEnd.do", method = RequestMethod.GET)
	public ModelAndView updateCompanionEnd(@RequestParam(name = "c_id") String c_id, HttpServletRequest request, ModelAndView mv) {
		try {
			String userID = (String) request.getSession().getAttribute("userID");
			// 신청한거
			int result = mypService.updateCompanionEnd(c_id);
			if(result>0) {
				mv.setViewName("redirect:WritedList2.do?m_id="+userID);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping(value = "/updateCompanionRe.do", method = RequestMethod.GET)
	public ModelAndView updateCompanionRe(@RequestParam(name = "c_id") String c_id, HttpServletRequest request, ModelAndView mv) {
		try {
			String userID = (String) request.getSession().getAttribute("userID");
			// 신청한거
			int result = mypService.updateCompanionRe(c_id);
			if(result>0) {
				mv.setViewName("redirect:WritedList2.do?m_id="+userID);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 회원탈퇴
	@ResponseBody
	@RequestMapping(value = "/MemberOut.do", method = RequestMethod.GET)
	public void MemberOut(@RequestParam(name = "m_id") String m_id) {
		try {
			int result = 0;
			result = mypService.outMember(m_id);
			if (result > 0) {
				System.out.println("회원탈퇴 완료!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 키워드 수정 페이지
	@RequestMapping(value = "/FavordPage.do", method = RequestMethod.GET)
	public ModelAndView getFavorPage(@RequestParam(name = "m_id") String m_id, ModelAndView mv) {
		try {
			mv.addObject("Favorlist", mypService.selectFavordlist(m_id));
			mv.setViewName("mypage_favor");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 키워드 insert
	@ResponseBody
	@RequestMapping(value = "/FavorInsert.do", method = RequestMethod.POST)
	public String FavorInsert(HttpServletRequest request, @RequestParam Map<String, String> param) {
		favor.setM_id((String) request.getSession().getAttribute("userID"));
		favor.setC_lid(Integer.parseInt(param.get("c_lid")));
		favor.setC_sid(Integer.parseInt(param.get("c_sid")));
		JSONObject job = new JSONObject();
		try {
			int result = mypService.insertFavor(favor);
			if (result < 0) { // 같은거 있음
				job.put("result", result);
			} else {
				job.put("m_id", favor.getM_id());
				job.put("result", result);
			}
		} catch (Exception e) {
			job.put("result", -1);
		} finally {
		}
		return job.toJSONString();
	}

	// 키워드 삭제 페이지
	@RequestMapping(value = "/FavorDelete.do", method = RequestMethod.GET)
	public ModelAndView getFavorPage(HttpServletRequest request, @RequestParam(name = "c_lid") int c_lid,
			@RequestParam(name = "c_sid") int c_sid, ModelAndView mv) {
		favor.setM_id((String) request.getSession().getAttribute("userID"));
		favor.setC_lid(c_lid);
		favor.setC_sid(c_sid);
		try {

			mypService.deleteFavordlist(favor);

			mv.addObject("m_id", favor.getM_id());
			mv.addObject("delMsg", "삭제되었습니다.");
			mv.setViewName("redirect:FavordPage.do");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// 파일저장 메소드
	private void saveFile(MultipartFile report, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdir(); // 폴더가 없다면 생성한다.
		}
		String filePath = null;
		try {
			// 파일 저장
			System.out.println(report.getOriginalFilename() + "을 저장합니다.");
			System.out.println("저장 경로 : " + savePath);
			filePath = folder + "\\" + report.getOriginalFilename();
			report.transferTo(new File(filePath)); // 파일을 저장한다
			System.out.println("파일 명 : " + report.getOriginalFilename());
			System.out.println("파일 경로 : " + filePath);
			System.out.println("파일 전송이 완료되었습니다.");
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
	}
}
