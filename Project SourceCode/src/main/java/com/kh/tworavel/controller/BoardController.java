package com.kh.tworavel.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tworavel.model.domain.Board;
import com.kh.tworavel.model.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	public static final int LIMIT = 10;
	
	
	// 게시판 리스트
	@RequestMapping(value="board_list.do")
	public ModelAndView fBoardListService(ModelAndView mv,@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword,@RequestParam(name="type",defaultValue="G")char b_type
			){
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
		String type=String.valueOf(b_type);
			int listCount = bService.totalCount(type);
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			if (keyword != null && !keyword.equals(""))
				mv.addObject("list", bService.selectSearch(keyword));
			else
			mv.addObject("list", bService.selectList(currentPage, LIMIT,type));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.addObject("type",type);
			mv.setViewName("board_list");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	// 게시글 상세페이지
	@RequestMapping(value="board_detail.do")
	public ModelAndView boardDetailService(ModelAndView mv,@RequestParam(name="b_id")int b_id) {
		try {
			mv.addObject("blist",bService.selectBoard(b_id));
			mv.addObject("clist",bService.selectComment(b_id));
			mv.setViewName("board_detail");
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		return mv;
	}
	@RequestMapping(value="board_write.do")
	public ModelAndView fBoardwriteService(ModelAndView mv) {
		
		
		mv.setViewName("board_write");
		return mv;
	}
	//댓글 등록
	@RequestMapping(value="commentInsert.do",method=RequestMethod.POST)
	public ModelAndView commentInsertService(ModelAndView mv,Board vo,HttpServletRequest request) {
		System.out.println(vo.getB_id());
	vo.setB_ref(vo.getB_id());	
	System.out.println(vo.getB_ref());
	bService.commentInsert(vo);
	mv.setViewName("redirect:/board_detail.do?b_id="+vo.getB_ref());
	return mv;
	}	
	// 대댓글 등록
	
	@RequestMapping(value="recommentInsert.do",method=RequestMethod.POST)
	public ModelAndView recommentInsertService(ModelAndView mv,Board vo,HttpServletRequest request) {
	vo.setB_ref(vo.getB_id());	
	System.out.println("aucd"+vo.getB_id());
	HashMap<String, Integer>blist = new HashMap<String, Integer>();
	blist.put("b_ref",vo.getB_id());
	blist.put("b_re_step",vo.getB_re_step());
	bService.recommentInsert(vo,blist);
	mv.setViewName("redirect:/board_detail.do?b_id="+vo.getB_ref());
	return mv;
	}	
	// 게시글 등록
	@RequestMapping(value="boardinsert.do",method=RequestMethod.POST)
	public ModelAndView BoardInsertService(@RequestParam(name="b_content")String b_content,@RequestParam(name="b_title")String b_title,@RequestParam("b_type")String b_type,@RequestParam(name="m_id")String m_id,@RequestParam(name="b_secret")String b_secret,@RequestParam(name="b_secretnumber",defaultValue = "0")int b_secretnumber,ModelAndView mv,HttpServletRequest request) {
		System.out.println("실행됨");
		Board b = new Board();
		b.setB_content(b_content);
		b.setM_id(m_id);
		b.setB_type(b_type);
		b.setB_title(b_title);
		b.setB_secret(b_secret);
		b.setB_secretnumber(b_secretnumber);
		bService.insertBoard(b);
		mv.setViewName("redirect:board_list.do");
		return mv;
	}
	
	// 파일 업로드
	 @RequestMapping("/fileupload.do")
	 public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){

		    try {
		         //파일정보
		         String sFileInfo = "";
		         //파일명을 받는다 - 일반 원본파일명

		         String filename = request.getHeader("file-name");

		         //파일 확장자

		         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);

		         //확장자를소문자로 변경

		         filename_ext = filename_ext.toLowerCase();

		         //파일 기본경로

		         String dftFilePath = request.getSession().getServletContext().getRealPath("/");

		         //파일 기본경로 _ 상세경로

		         String filePath = dftFilePath + "resources" + File.separator + "photo_upload" + File.separator;

		         System.out.println(filePath);

		         File file = new File(filePath);

		         if(!file.exists()) {

		            file.mkdirs();
		         }

		         String realFileNm = "";

		         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");

		         String today= formatter.format(new java.util.Date());

		         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));

		         String rlFileNm = filePath + realFileNm;

		         ///////////////// 서버에 파일쓰기 ///////////////// 

		         InputStream is = request.getInputStream();

		         OutputStream os=new FileOutputStream(rlFileNm);

		         int numRead;

		         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];

		         while((numRead = is.read(b,0,b.length)) != -1){

		            os.write(b,0,numRead);

		         }

		         if(is != null) {

		            is.close();

		         }

		         os.flush();

		         os.close();

		         ///////////////// 서버에 파일쓰기 /////////////////

		         // 정보 출력

		         sFileInfo += "&bNewLine=true";

		         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함

		         sFileInfo += "&sFileName="+ filename;;

		         sFileInfo += "&sFileURL="+"/tworavel/resources/photo_upload/"+realFileNm;

		         PrintWriter print = response.getWriter();

		         print.print(sFileInfo);

		         print.flush();

		         print.close();

		    } catch (Exception e) {

		        e.printStackTrace();

		    }

		}



}
