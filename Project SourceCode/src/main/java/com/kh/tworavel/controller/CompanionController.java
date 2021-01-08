package com.kh.tworavel.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tworavel.model.domain.Board;
import com.kh.tworavel.model.domain.Companion;
import com.kh.tworavel.model.domain.Companion;
import com.kh.tworavel.model.domain.Companion;
import com.kh.tworavel.model.domain.CompanionAdd;
import com.kh.tworavel.model.domain.CompanionInfo;
import com.kh.tworavel.model.domain.CompanionLike;
import com.kh.tworavel.model.domain.CompanionMap;
import com.kh.tworavel.model.domain.CompanionTag;
import com.kh.tworavel.model.service.CompanionService;

@Controller
@RequestMapping
public class CompanionController {
	@Autowired
	private CompanionService cService;
	public static final int LIMIT = 15;

	// 동행글 등록 페이지
	@RequestMapping(value = "companion_write.do", method = RequestMethod.GET)
	public ModelAndView companion_write(ModelAndView mv) {
		mv.setViewName("companion_write");
		return mv;
	}

	// 동행글 등록
	@RequestMapping(value = "companioninsert.do", method = RequestMethod.POST)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public ModelAndView CompanionInsertService(Companion c, CompanionTag ct,
			@RequestParam(name = "c_lid1", required = false) String c_lid1,
			@RequestParam(name = "c_lid2", required = false) String c_lid2,
			@RequestParam(name = "c_lid3", required = false) String c_lid3,
			@RequestParam(name = "c_sid1", required = false) String c_sid1,
			@RequestParam(name = "c_sid2", required = false) String c_sid2,
			@RequestParam(name = "c_sid3", required = false) String c_sid3,
			@RequestParam(name = "mapval1", required = false) String mapval1,
			@RequestParam(name = "mapval2", required = false) String mapval2,
			@RequestParam(name = "mapval3", required = false) String mapval3,
			@RequestParam(name = "mapval4", required = false) String mapval4,
			@RequestParam(name = "mapval5", required = false) String mapval5, ModelAndView mv,
			HttpServletRequest request) {
		try {

			List<String> maplist = new ArrayList<String>();
			int c_id = cService.companion(c);
			ct.setC_id(c_id);
			if (!c_lid1.equals("") && c_lid1 != null) {
				ct.setC_lid(Integer.parseInt(c_lid1));
				ct.setC_sid(Integer.parseInt(c_sid1));
				cService.insertCTag(ct);
			}
			if (!c_lid2.equals("") && c_lid2 != null) {
				ct.setC_lid(Integer.parseInt(c_lid2));
				ct.setC_sid(Integer.parseInt(c_sid2));
				cService.insertCTag(ct);
			}
			if (!c_lid3.equals("") && c_lid3 != null) {
				ct.setC_lid(Integer.parseInt(c_lid3));
				ct.setC_sid(Integer.parseInt(c_sid3));
				cService.insertCTag(ct);
			}
			if (mapval1 != null) {
				System.out.println(mapval1);
				maplist.add(mapval1);
			}
			if (mapval2 != null) {
				System.out.println(mapval2);
				maplist.add(mapval2);
			}
			if (mapval3 != null) {
				System.out.println(mapval3);
				maplist.add(mapval3);
			}
			if (mapval4 != null) {
				maplist.add(mapval4);
			}
			if (mapval5 != null) {
				maplist.add(mapval5);
			}
			for (int i = 0; i < maplist.size(); i++) {
				CompanionMap vo = new CompanionMap();
				vo.setC_id(c_id);
				vo.setC_xy(maplist.get(i));
				vo.setCm_id(i + 1);
				System.out.println("값넣음" + maplist.get(i));
				cService.insertCMap(vo);
			}
			mv.setViewName("redirect:/companion_list.do");
		} catch (Exception e) {
			mv.addObject("msg","글작성에 실패하셨습니다.");
			mv.addObject("url","/companion_list.do");
			mv.setViewName("alertMsg");
			return mv;
		}
		mv.addObject("msg","글작성에 성공하였습니다. 30포인트가 감소되었습니다");
		mv.addObject("url","/companion_list.do");
		mv.setViewName("alertMsg");
		return mv;
	}

	// 동행글 리스트 페이지
	@RequestMapping(value = "companion_list.do")
	public ModelAndView companionListService(ModelAndView mv, @RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword) {
		int listCount = 0;
		int currentBlock = page % 4 == 0 ? (page / 4) + 1 : (page / 4);
		int startPage = 0;
		int endPage = 0;

		if (page % 5 == 0) {
			startPage = (page / 5 - 1) * 5 + 1;
			endPage = (page / 5) * 5;
		} else if (page % 5 != 0) {
			startPage = (page / 5) * 5 + 1;
			endPage = (page / 5 + 1) * 5;
		}

		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			listCount = cService.listCountC();

			if (keyword != null && !keyword.equals("")) {
				listCount = cService.totalSearchCountC(keyword);
			}
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			if (keyword != null && !keyword.equals("")) {
				mv.addObject("list", cService.selectSearchC(keyword, currentPage, LIMIT));
			} else {
				mv.addObject("list", cService.selectListCp(currentPage, LIMIT));
			}
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.addObject("currentblock", currentBlock);
			mv.addObject("keyword", keyword);
			mv.setViewName("companion_list");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	// 동행글 상세페이지
	@RequestMapping(value = "companion_detail.do")
	public ModelAndView companionDetailService(ModelAndView mv, @RequestParam(name = "c_id") int c_id,
			CompanionTag ct) {
		try {
			int markercount = cService.selectCmapCount(c_id);

			System.out.println(markercount);
			List<CompanionMap> maplist = new ArrayList<CompanionMap>();
			for (int i = 1; i <= markercount; i++) {
				CompanionMap mvo = new CompanionMap();
				mvo.setC_id(c_id);
				mvo.setCm_id(i);
				mvo.setC_xy(cService.selectMapC(mvo));
				maplist.add(mvo);
			}
			Companion list = cService.selectOneC(c_id);
			List<CompanionTag> tlist = cService.selectTagC(ct);
			String CTname1 = null;
			String CTname2 = null;
			String CTname3 = null;
			tlist.get(0).getC_sid();
			tlist.get(1).getC_sid();
			tlist.get(2).getC_sid();
			int CTsid1 = tlist.get(0).getC_sid();
			int CTsid2 = tlist.get(1).getC_sid();
			int CTsid3 = tlist.get(2).getC_sid();
			if (CTsid1 == 1) {
				CTname1 = "강원도";
			} else if (CTsid1 == 2) {
				CTname1 = "경기도";
			} else if (CTsid1 == 3) {
				CTname1 = "경상남도";
			} else if (CTsid1 == 4) {
				CTname1 = "경상북도";
			} else if (CTsid1 == 5) {
				CTname1 = "전라남도";
			} else if (CTsid1 == 6) {
				CTname1 = "전라북도";
			} else if (CTsid1 == 7) {
				CTname1 = "충청남도";
			} else if (CTsid1 == 8) {
				CTname1 = "충청북도";
			}
			if (CTsid2 == 1) {
				CTname2 = "4명 이내";
			} else if (CTsid2 == 2) {
				CTname2 = "5~8명";
			} else if (CTsid2 == 3) {
				CTname2 = "9명 이상";
			}
			if (CTsid3 == 1) {
				CTname3 = "호캉스";
			} else if (CTsid3 == 2) {
				CTname3 = "청춘";
			} else if (CTsid3 == 3) {
				CTname3 = "자연";
			} else if (CTsid3 == 4) {
				CTname3 = "유적지";
			} else if (CTsid3 == 5) {
				CTname3 = "액티비티";
			}

			mv.addObject("clist", list);
			mv.addObject("meetpoint", list.getC_meet());
			mv.addObject("maplist", maplist);
			mv.addObject("tlist1", CTname1);
			mv.addObject("tlist2", CTname2);
			mv.addObject("tlist3", CTname3);

			mv.setViewName("companion_detail");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "companion_update.do")
	public ModelAndView companionupdate(ModelAndView mv, @RequestParam(name = "c_id") int c_id, CompanionTag ct) {
		try {
			int markercount = cService.selectCmapCount(c_id);
			List<CompanionMap> maplist = new ArrayList<CompanionMap>();
			for (int i = 1; i <= markercount; i++) {
				CompanionMap mvo = new CompanionMap();
				mvo.setC_id(c_id);
				mvo.setCm_id(i);
				mvo.setC_xy(cService.selectMapC(mvo));
				maplist.add(mvo);
			}
			mv.addObject("clist", cService.selectOneC(c_id));
			mv.addObject("meetpoint", cService.selectOneC(c_id).getC_meet());
			mv.addObject("maplist", maplist);
			mv.addObject("clist2", cService.selectTagC(ct));
			mv.setViewName("companion_update");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "updatecompanion.do", method = RequestMethod.POST)
	public ModelAndView companionupdateService(Companion c,
			@RequestParam(name = "mapval1", required = false) String mapval1,
			@RequestParam(name = "mapval2", required = false) String mapval2,
			@RequestParam(name = "mapval3", required = false) String mapval3,
			@RequestParam(name = "mapval4", required = false) String mapval4,
			@RequestParam(name = "mapval5", required = false) String mapval5, CompanionTag ct, ModelAndView mv,
			HttpServletRequest request) {
		try {

			List<String> maplist = new ArrayList<String>();
			if (mapval1 != null) {
				System.out.println(mapval1);
				maplist.add(mapval1);
			}
			if (mapval2 != null) {
				System.out.println(mapval2);
				maplist.add(mapval2);
			}
			if (mapval3 != null) {
				System.out.println(mapval3);
				maplist.add(mapval3);
			}
			if (mapval4 != null) {
				maplist.add(mapval4);
			}
			if (mapval5 != null) {
				maplist.add(mapval5);
			}
			for (int i = 0; i < maplist.size(); i++) {
				CompanionMap vo = new CompanionMap();
				vo.setC_id(c.getC_id());
				vo.setC_xy(maplist.get(i));
				vo.setCm_id(i + 1);
				cService.updateCMap(vo);
			}
			cService.updateOneC(c);
//		cService.updateTwoC(cm);
//		cService.updateThrC(ct);
			mv.setViewName("redirect:/companion_list.do");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

//	동행글 삭제
	@RequestMapping(value = "companiondelete.do", method = RequestMethod.GET)
	public ModelAndView CompanionDeleteService(@RequestParam(name = "c_id") int c_id, ModelAndView mv,
			HttpServletRequest request) {
		try {
			cService.deleteC(c_id);
			mv.setViewName("redirect:companion_list.do");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

//	동행글 추천/비추천
	@RequestMapping(value = "companion_like.do")
	public void companionlike(ModelAndView mv, @RequestParam(name = "c_id") int c_id,
			@RequestParam(name = "m_id") String m_id, @RequestParam(name = "chc") int chc, HttpServletRequest request,
			HttpServletResponse response) {
		PrintWriter out;
		try {

			out = response.getWriter();
			Companion vo = new Companion();
			vo.setC_id(c_id);
			vo.setM_id(m_id);
			if (chc == 1) {
				System.out.println("실행");
				cService.deleteCLike(vo);
				cService.updateCLikeMinus(c_id);
			} else {
				cService.updateCLikePlus(c_id);
				cService.insertCLike(vo);
			}
			int LikeCountC = 0;
			LikeCountC = cService.selectCLikeCount(c_id);
			out.print(LikeCountC);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

//	동행 신청
	@RequestMapping(value = "companion_likecheck.do")
	public void companionlikecheck(ModelAndView mv, @RequestParam(name = "c_id") int c_id,
			@RequestParam(name = "m_id") String m_id, HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			int checkid = 0;
			Companion vo = new Companion();
			vo.setM_id(m_id);
			vo.setC_id(c_id);
			checkid = cService.selectCLikeMid(vo);
			out.print(checkid);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

//	동행 신청
	@RequestMapping(value = "companion_insertInfo.do")
	public ModelAndView companioninsertInfoService(CompanionInfo io, ModelAndView mv, HttpServletRequest request,
			HttpServletResponse response, @RequestParam(name = "c_id") int c_id,
			@RequestParam(name = "m_id2") String m_id2, @RequestParam(name = "m_id") String m_id,
			@RequestParam(name = "c_name") String c_name) {
		try {
			int checkid = 0;
			CompanionInfo vo = new CompanionInfo();
			vo.setC_id(c_id);
			vo.setM_id2(m_id2);
			vo.setM_id(m_id);
			vo.setC_name(c_name);
			vo.setC_yn("N");
			cService.insertCInfo(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("msg","동행 신청에 성공하였습니다. 20포인트가 감소되었습니다");
		mv.addObject("url","/companion_list.do");
		mv.setViewName("alertMsg");
		mv.setViewName("redirect:companion_list.do");
		return mv;
	}
}
