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

	public static final int LIMIT = 5;

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
			@RequestParam(name = "mapval1", required = false) String mapval1,
			@RequestParam(name = "mapval2", required = false) String mapval2,
			@RequestParam(name = "mapval3", required = false) String mapval3,
			@RequestParam(name = "mapval4", required = false) String mapval4,
			@RequestParam(name = "mapval5", required = false) String mapval5, ModelAndView mv,
			HttpServletRequest request) {
		List<String> maplist = new ArrayList<String>();
		int c_id = cService.companion(c);
		ct.setC_id(c_id);
		cService.insertCTag(ct);
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
		return mv;
	}

	// 동행글 리스트 페이지
	@RequestMapping(value = "companion_list.do", method = RequestMethod.GET)
	public ModelAndView companionListService(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv) {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			int listcountC = cService.listCountC();
			int maxPage = (int) ((double) listcountC / LIMIT + 0.9);
			if (keyword != null && !keyword.equals("")) {
				mv.addObject("list", cService.selectSearchC(keyword));
			} else {
				mv.addObject("list", cService.selectListCp(currentPage, LIMIT));
				mv.addObject("currentPage", currentPage);
				mv.addObject("maxPage", maxPage);
				mv.addObject("listCount", listcountC);
				mv.setViewName("companion_list");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			e.printStackTrace();
		}
//		mv.addObject("hotlist", cService.selectCHotViewList());
		return mv;
	}

	// 동행글 상세페이지
	@RequestMapping(value = "companion_detail.do")
	public ModelAndView companionDetailService(ModelAndView mv, @RequestParam(name = "c_id") int c_id) {
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
			mv.addObject("clist", cService.selectOneC(c_id));
			mv.addObject("meetpoint", cService.selectOneC(c_id).getC_meet());
			mv.addObject("maplist", maplist);
			mv.addObject("clist2", cService.selectTagC(c_id));
			mv.setViewName("companion_detail");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "companion_update.do")
	public ModelAndView companionupdate(ModelAndView mv, @RequestParam(name = "c_id") int c_id) {
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
			mv.addObject("clist2", cService.selectTagC(c_id));
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
		return mv;
	}

//	동행글 삭제
	@RequestMapping(value = "companiondelete.do", method = RequestMethod.GET)
	public ModelAndView CompanionDeleteService(@RequestParam(name = "c_id") int c_id, ModelAndView mv,
			HttpServletRequest request) {
		cService.deleteC(c_id);
		mv.setViewName("redirect:companion_list.do");
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
	public void companioninsertInfoService(CompanionInfo io, ModelAndView mv, HttpServletRequest request,
			HttpServletResponse response, @RequestParam(name = "c_id") int c_id,
			@RequestParam(name = "m_id2") String m_id2, @RequestParam(name = "m_id") String m_id,
			@RequestParam(name = "c_name") String c_name, @RequestParam(name = "c_yn") char c_yn) {
		PrintWriter out;
		try {
			out = response.getWriter();
			int checkid = 0;
			CompanionInfo vo = new CompanionInfo();
			vo.setC_id(c_id);
			vo.setM_id2(m_id2);
			vo.setM_id(m_id);
			vo.setC_name(c_name);
			vo.setC_yn(c_yn);
			System.out.println(c_yn);
			cService.insertCInfo(vo);
			out.print(checkid);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
