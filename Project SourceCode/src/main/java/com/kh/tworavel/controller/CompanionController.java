package com.kh.tworavel.controller;

import java.io.File;
import java.io.FileOutputStream;
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
import com.kh.tworavel.model.domain.CompanionAdd;
import com.kh.tworavel.model.domain.CompanionInfo;
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
			@RequestParam(name = "mapval5", required = false) String mapval5,
			ModelAndView mv, HttpServletRequest request) {
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
			System.out.println("값넣음"+maplist.get(i));
			cService.insertCMap(vo);
		}

		mv.setViewName("redirect:/companion_list.do");
		return mv;
	}

	// 동행글 리스트 페이지
	@RequestMapping(value = "companion_list.do", method = RequestMethod.GET)
	public ModelAndView boardListService(@RequestParam(name = "page", defaultValue = "1") int page,
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
		return mv;
	}

	// 동행글 상세페이지
	@RequestMapping(value = "companion_detail.do")
	public ModelAndView boardDetailService(ModelAndView mv, @RequestParam(name = "c_id") int c_id) {
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
	public ModelAndView companionupdate(ModelAndView mv,@RequestParam(name ="c_id")int c_id) {
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
	public ModelAndView companionupdateService(Companion c,	@RequestParam(name = "mapval1", required = false) String mapval1,
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
	// 게시판 리스트
//	@RequestMapping(value="companion_list.do")
//	public ModelAndView fBoardListService(ModelAndView mv,@RequestParam(name = "page", defaultValue = "1") int page,
//			@RequestParam(name = "keyword", required = false) String keyword,@RequestParam(name="type",defaultValue="G") char c_type
//			){
//		try {
//			int currentPage = page;
//			// 한 페이지당 출력할 목록 갯수
//		String type=String.valueOf(c_type);
//			int listCount = cService.listCountC(c)(type);
//			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
//			if (keyword != null && !keyword.equals(""))
//				mv.addObject("list", cService.selectSearchC(keyword));
//			else {
//			mv.addObject("list", cService.selectListC(currentPage, LIMIT,type));
//			mv.addObject("currentPage", currentPage);
//			mv.addObject("maxPage", maxPage);
//			mv.addObject("listCount", listCount);
//			mv.addObject("type",type);
//			mv.setViewName("companion_list");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			mv.addObject("msg", e.getMessage());
//			mv.setViewName("errorPage");
//		}
//		return mv;
//	}

////	작성된 글을 insert
//	@RequestMapping(value = "/cInsert.do", method = RequestMethod.POST)
//	public ModelAndView companionInsert(Companion c,CompanionAdd ca, @RequestParam(value = "upfile") MultipartFile report,
//			HttpServletRequest request, ModelAndView mv) {
//		try {
//			// 첨부파일 저장
//			if (report != null && !report.equals("")) {
//				saveFile(report, request);
//			}
//			ca.setCa_img1(report.getOriginalFilename()); // 저장된 파일명을 vo에 set
//
//			cService.insertC(c);
//			mv.addObject("aaa", "aaa");
//			mv.setViewName("redirect:companion_list.do"); // insertCompanion에 성공했다면 !!! View페이지로 이동하는 것이 아니라 컨트롤러 url 중 "게시글 리스트
//													// select로 이동" 하는 "/companion_list.do"
//		} catch (Exception e) {
//			// 실패했다면
////		mv.setViewName("errorPage");   // errorPage 페이지로 이동
//		}
//		return mv;
//	}

//	@RequestMapping(method=RequestMethod.GET)
//	public String aaa(ModelAndView mv) {
//		return "aaa";
//	}
//	@RequestMapping(method=RequestMethod.POST)
//	public String bbb(ModelAndView mv) {
//		return "bbb";
//	}

//	// 게시글 작성 페이지
//	@RequestMapping(value = "/companion_write.do", method = RequestMethod.GET)
//	public String companionInsertForm(ModelAndView mv) {
//		return "companion/companion_write"; // View페이지에서 작성 후 form action = "cInsert.do" 로 들어오도록 함.
//	}
//
//	// 작성된 글을 insert
//	@RequestMapping(value = "/cInsert.do", method = RequestMethod.POST)
//	public ModelAndView companionInsert(Companion c,CompanionAdd ca, @RequestParam(value = "upfile") MultipartFile report,
//			HttpServletRequest request, ModelAndView mv) {
//		try {
//			// 첨부파일 저장
//			if (report != null && !report.equals("")) {
//				saveFile(report, request);
//			}
//			ca.setCa_img1(report.getOriginalFilename()); // 저장된 파일명을 vo에 set
//
//			cService.insertC(c);
//			mv.addObject("aaa", "aaa");
//			mv.setViewName("redirect:companion_list.do"); // insertCompanion에 성공했다면 !!! View페이지로 이동하는 것이 아니라 컨트롤러 url 중 "게시글 리스트
//													// select로 이동" 하는 "/companion_list.do"
//		} catch (Exception e) {
//			// 실패했다면
////		mv.setViewName("errorPage");   // errorPage 페이지로 이동
//		}
//		return mv;
//	}
//
//	// 게시글 리스트 select
//	@RequestMapping(value = { "/companion_list.do", "/cSearch.do" })
//	public ModelAndView companionListService(@RequestParam(value = "keyword", required = false) String keyword,
//			@RequestParam(value = "page", defaultValue = "1") int page, ModelAndView mv) {
//		int listCount = cService.listCountC();
//		int maxPage = (int) ((double) listCount / LIMIT + 0.9);
//		mv.addObject("maxPage", maxPage);
//		mv.addObject("currentPage", page);
//		mv.addObject("list", cService.selectListC(page, LIMIT));
//		mv.setViewName("companion_list"); // companion/blist View페이지가 보여짐
//		return mv;
//	}
//
//	@RequestMapping(value = "/companion_detail.do")
//	public ModelAndView companionDetail(@RequestParam(value = "c_id") int c_id,
//			@RequestParam(value = "page", defaultValue = "1") int page, ModelAndView mv) {
//		mv.addObject("companion", cService.selectOneC(c_id));
//		mv.setViewName("companion_detail");
//		return mv;
//	}
//
//	@RequestMapping(value = "/cRenew.do")
//	public ModelAndView companionDetail(@RequestParam(value = "c_id") int c_id, ModelAndView mv) {
//		mv.addObject("companion", cService.selectOneC(c_id));
//		mv.setViewName("companionRenew");
//		return mv;
//	}
//
//	@RequestMapping(value = "/cUpdate.do", method = RequestMethod.POST)
////	public ModelAndView companionUpdate(Companion c,CompanionCadd ca, @RequestParam(value = "upfile") MultipartFile report,
////			HttpServletRequest request, ModelAndView mv) {
//	public ModelAndView companionUpdate(Companion c,CompanionAdd ca, @RequestParam(value = "upfile") MultipartFile report,
//	HttpServletRequest request, ModelAndView mv) {
//
//	try {
//			// 첨부파일 저장
//			if (report != null || !report.getOriginalFilename().equals("")) {
////			System.out.println(report.getName());   //  upfile
////			System.out.println(report.getOriginalFilename());   // 선택된 filename
//				removeFile(ca.getCa_img1(), request);
//				saveFile(report, request);
//				ca.setCa_img1(report.getOriginalFilename()); // 저장된 파일명을 vo에 set
//			}
//			if (cService.updateC(c) != null) {
//				mv.addObject("c_id", cService.updateC(c).getC_id());
//				mv.setViewName("redirect:cDetail.do");
//			} else {
//				// 이전화면으로 이동
//			}
//		} catch (Exception e) {
//			// 실패했다면
//			System.out.println("실패 transaction 실패");
////			mv.setViewName("errorPage");   // errorPage 페이지로 이동
//		}
//		return mv;
//	}
//
//	private void saveFile(MultipartFile report, HttpServletRequest request) {
//		String root = request.getSession().getServletContext().getRealPath("resources");
//		String savePath = root + "\\uploadFiles";
//		File folder = new File(savePath);
//		if (!folder.exists()) {
//			folder.mkdirs(); // 폴더가 없다면 생성한다.
//		}
//		String filePath = null;
//		try {
//			// 파일 저장
//			System.out.println(report.getOriginalFilename() + "을 저장합니다.");
//			System.out.println("저장 경로 : " + savePath);
//
//			filePath = folder + "\\" + report.getOriginalFilename();
//			report.transferTo(new File(filePath)); // 파일을 저장한다
//			System.out.println("파일 명 : " + report.getOriginalFilename());
//			System.out.println("파일 경로 : " + filePath);
//			System.out.println("파일 전송이 완료되었습니다.");
//		} catch (Exception e) {
//			System.out.println("파일 전송 에러 : " + e.getMessage());
//		}
//	}
//
//	private void removeFile(String companion_file, HttpServletRequest request) {
//		String root = request.getSession().getServletContext().getRealPath("resources");
//		String savePath = root + "\\uploadFiles";
//		String filePath = savePath + "\\" + companion_file;
//		try {
//			System.out.println(companion_file + "을 삭제합니다.");
//			System.out.println("기존 저장 경로 : " + savePath);
//			File delFile = new File(filePath);
//			delFile.delete();
//			System.out.println("파일 삭제가 완료되었습니다.");
//		} catch (Exception e) {
//			System.out.println("파일 삭제 에러: " + e.getMessage());
//		}
//	}
}
