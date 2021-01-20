package com.kh.tworavel.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tworavel.model.domain.GAdd;
import com.kh.tworavel.model.domain.GLike;
import com.kh.tworavel.model.domain.Gallery;
import com.kh.tworavel.model.service.GalleryService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class GalleryController {

	@Autowired
	private GalleryService gService;
	@Autowired
	private Gallery gallery;
	@Autowired
	private GAdd gadd;

	public static final int LIMIT = 6; // 한 페이지당 6개 사진을 보여준다.

	@RequestMapping("gallery_write.do") // 글등록 페이지로 이동
	public String gallery_write() {
		return "gallery_write";
	}

//게시판 리스트
	// 게시글 리스트 select
	@RequestMapping(value = { "/gallery_list.do" }, method = { RequestMethod.GET })
	public ModelAndView galleryListService(@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv) {
		int listCount = gService.listCount(); // 게시글 개수
		int maxPage = (int) ((double) listCount / LIMIT + 0.9);
		try {
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", page);
			mv.addObject("list", gService.selectList(page, LIMIT)); // 첫번째 페이지에 5개
			mv.setViewName("gallery_list"); // gallery/glist View페이지가 보여짐
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	// **게시글 상세페이지 
	@RequestMapping(value = "/gallery_detail.do")
	public ModelAndView galleryDetail(@RequestParam(name = "gallery_num") int gallery_num,
			@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv, HttpServletRequest request) {
		mv.addObject("galleryAdd", gService.selectGalleryAdd(gallery_num));
		mv.addObject("gallery", gService.selectGallery(gallery_num));
		
		GLike glike = new GLike();
		HttpSession session = request.getSession();
		
		glike.setG_id(gallery_num);
		glike.setM_id(String.valueOf(session.getAttribute("userID")));
		
		if(session.getAttribute("userID") != null)
			mv.addObject("glikeCount", gService.selectGLike(glike));
		// mv.addObject("commentList", brService.selectList(board_num));
		mv.setViewName("gallery_detail");
		return mv;
	}

	// ** 게시판 수정페이지
	@RequestMapping(value = "/gallery_renew.do")
	public ModelAndView galleryDetail(@RequestParam(name = "gallery_num") int gallery_num, ModelAndView mv) {
		mv.addObject("galleryAdd", gService.selectGalleryAdd(gallery_num));
		mv.addObject("gallery", gService.selectGallery(gallery_num));
		mv.setViewName("gallery_renew");
		return mv;
	}

	@RequestMapping(value = "/gUpdate.do", method = RequestMethod.POST)
	public ModelAndView galleryUpdate(@RequestParam(name = "g_content") String g_content,
			@RequestParam(name = "g_id") int g_id, @RequestParam(name = "upfile") MultipartFile report,
			HttpServletRequest request, ModelAndView mv) {
		try {

			gadd.setG_img1(report.getOriginalFilename());

			// 첨부파일 저장
			if (report != null && !report.equals("")) {
				saveFile(report, request);
			}
			gallery.setG_content(g_content);
			gallery.setG_id(g_id);
			gadd.setG_id(g_id);
			System.out.println(gadd.getG_id());
			System.out.println(gadd.getG_img1());
			gService.updateGallery(gallery,gadd);
		} catch (Exception e) {
			// 실패했다면
			mv.setViewName("errorPage"); // errorPage 페이지로 이동
			e.printStackTrace();
		}
		mv.setViewName("redirect:gallery_list.do");
		return mv;

	}

	// 작성된 글을 insert
	@RequestMapping(value = "/gInsert.do", method = RequestMethod.POST)
	public ModelAndView galleryInsert(Gallery g, @RequestParam(name = "upfile1") MultipartFile report1,@RequestParam(name = "upfile2") MultipartFile report2,@RequestParam(name = "upfile3") MultipartFile report3
			,HttpServletRequest request, ModelAndView mv) {
		try {

			String userID = (String) request.getSession().getAttribute("userID");
			System.out.println("userID:" + userID);
			gallery.setM_id(userID);
			gallery.setG_content(g.getG_content());
			gadd.setG_img1(report1.getOriginalFilename());
			gadd.setG_img2(report2.getOriginalFilename());
			gadd.setG_img3(report3.getOriginalFilename());
			// 첨부파일 저장
			if (report1 != null && !report1.equals("")) {
				saveFile(report1, request);
			}
			if (report2 != null && !report2.equals("")) {
				saveFile(report2, request);
			}
			if (report3 != null && !report3.equals("")) {
				saveFile(report3, request);
			}

			report1.getOriginalFilename(); // 저장된 파일명을 vo에 set

			g.getM_id();
			int result = gService.insertGallery(gallery);
			int result2 = gService.insertGadd(gadd);
			if (result > 0 && result2 > 0) {
				mv.setViewName("redirect:gallery_list.do"); // insertBoard에 성공했다면 !!! View페이지로 이동하는 것이 아니라 컨트롤러 url 중
															// "게시글 리스트
				// select로
			}
		} catch (Exception e) {
			// 실패했다면
			mv.setViewName("errorPage"); // errorPage 페이지로 이동
			e.printStackTrace();
		}
		return mv;
	}
	// ** 게시판 삭제페이지  
	@RequestMapping(value = "/gallery_delete.do")
	public ModelAndView galleryDelete(@RequestParam(name = "gallery_num") int gallery_num, ModelAndView mv) {
	
		gService.deleteGallery(gallery_num);
		
		
		
		mv.setViewName("redirect:gallery_list.do"); 
		return mv;
	}
	private void saveFile(MultipartFile report, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/Gallery_uploadFiles";
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs(); // 폴더가 없다면 생성한다.
		}
		String filePath = null;
		try {
			// 파일 저장
			System.out.println(report.getOriginalFilename() + "을 저장합니다.");
			System.out.println("저장 경로 : " + savePath);

			filePath = folder + "/" + report.getOriginalFilename();
			report.transferTo(new File(filePath)); // 파일을 저장한다
			System.out.println("파일 명 : " + report.getOriginalFilename());
			System.out.println("파일 경로 : " + filePath);
			System.out.println("파일 전송이 완료되었습니다.");
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}
	}

	// ** 게시판 좋아요 누르기 
	@RequestMapping(value = "/gallery_like.do")
	public ModelAndView galleryLike(@RequestParam(name = "g_id") int gallery_num, ModelAndView mv, HttpServletRequest request) {
		GLike glike = new GLike();
		HttpSession session = request.getSession();
		
		glike.setG_id(gallery_num);
		glike.setM_id(String.valueOf(session.getAttribute("userID")));
		gService.likeGallery(gallery_num);
		
		gService.insertGLike(glike);

		mv.setViewName("redirect:gallery_list.do");
		return mv;
	}
	
	// ** 게시판 좋아요 해제 하기 
	@RequestMapping(value = "/gallery_unlike.do")
	public ModelAndView galleryUnlike(@RequestParam(name = "g_id") int gallery_num, ModelAndView mv, HttpServletRequest request) {

		GLike glike = new GLike();
		gService.unlikeGallery(gallery_num);
		HttpSession session = request.getSession();

		glike.setG_id(gallery_num);
		glike.setM_id(String.valueOf(session.getAttribute("userID")));
		gService.deleteGLike(glike);
		mv.setViewName("redirect:gallery_list.do");
		return mv;
	}
	
	
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
//	
//	/**
//	 * Simply selects the home view to render by returning its name.
//	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "gallery_list";
//		

}
