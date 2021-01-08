package com.kh.tworavel.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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
	@RequestMapping(value = "board_list.do")
	public ModelAndView fBoardListService(ModelAndView mv, @RequestParam(name = "page", defaultValue = "1") int page,
		@RequestParam(name = "keyword", required = false) String keyword,
		@RequestParam(name = "type", defaultValue = "G",required = false) char b_type) {
		int listCount=0;
		int currentBlock = page%4==0 ? page/4:(page/4)+1;
		int startPage =0;
		int endPage=0;
		/*
		 * System.out.println(currentBlock);
		 */		
		System.out.println((page/5)*5 +1);
		
		if(page%5==0) {
			
			startPage = (page/5 -1)*5+1;
			endPage= (page/5)*5;
		}else if(page%5!=0) {
			
			startPage = (page/5)*5 +1;
			endPage=(page/5 + 1)*5;
		}
		
		/*
		 * <c:set var="startPage" value="${(currentPage/5 -1)*5+1}"/> <c:set
		 * var="endPage" value="${(currentPage/5)*5 }"/> </c:if> <c:if
		 * test="${(currentPage%5) != 0}"> <c:set var="startPage"
		 * value="${(currentPage/5)*5 +1 }"/> <c:set var="endPage"
		 * value="${(currentPage/5 + 1)*5 }"/> </c:if>
		 * 
		 * 
		 */
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			String type = String.valueOf(b_type);
			if(type!="S") {
				listCount = bService.totalCount(type);
			}
			if (keyword != null && !keyword.equals("")) {
				listCount = bService.totalSearchCount(keyword);
				type ="S";
			}
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			if (keyword != null && !keyword.equals("")) {
				mv.addObject("list", bService.selectSearch(keyword,currentPage,LIMIT));
			}
			else {
				
				mv.addObject("list", bService.selectList(currentPage, LIMIT, type));
			}
			mv.addObject("startPage",startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.addObject("type", type);
			mv.addObject("currentblock", currentBlock);
			mv.addObject("keyword",keyword);
			mv.setViewName("board_list");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		mv.addObject("hotlist", bService.selectHotViewList());
		return mv;
	}

	// 게시글 상세페이지
	@RequestMapping(value = "board_detail.do")
	public ModelAndView boardDetailService(ModelAndView mv, @RequestParam(name = "b_id") int b_id) {
		try {
			mv.addObject("blist", bService.selectBoard(b_id));
			mv.addObject("clist", bService.selectComment(b_id));
			mv.setViewName("board_detail");

		} catch (Exception e) {

			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "board_write.do")
	public ModelAndView fBoardwriteService(ModelAndView mv,
			@RequestParam(name = "b_type", required = false, defaultValue = "G") String b_type) {
		mv.addObject("b_type", b_type);
		mv.setViewName("board_write");
		return mv;
	}

	// 댓글 등록
	@RequestMapping(value = "commentInsert.do", method = RequestMethod.POST)
	public ModelAndView commentInsertService(ModelAndView mv, Board vo, HttpServletRequest request) {
		System.out.println(vo.getB_id());
		
		try {
			
			
			vo.setB_ref(vo.getB_id());
			bService.commentInsert(vo);
		}catch(Exception e) {
			
			mv.addObject("msg","댓글 작성에 실패하셨습니다 다시 시도해주세요");
			 mv.setViewName("alertMsg");
			return mv;
			
		}
		 mv.addObject("msg","댓글 작성에 성공하였습니다."
		 		+ "5포인트가 적립되었습니다");
		 mv.addObject("url","/board_detail.do?b_id="+vo.getB_ref());
		 mv.setViewName("alertMsg");
		return mv;
	}
	// 대댓글 등록

	@RequestMapping(value = "recommentInsert.do", method = RequestMethod.POST)
	public ModelAndView recommentInsertService(ModelAndView mv, Board vo, HttpServletRequest request) {
		vo.setB_ref(vo.getB_id());
		System.out.println("aucd" + vo.getB_id());
		HashMap<String, Integer> blist = new HashMap<String, Integer>();
		try {
			blist.put("b_ref", vo.getB_id());
			blist.put("b_re_step", vo.getB_re_step());
			bService.recommentInsert(vo, blist);
			
		}catch(Exception e) {
			
			mv.addObject("msg", "댓글작성에 실패하셨습니다");
			 mv.setViewName("alertMsg");
			 return mv;
		}
		
		 mv.addObject("msg","댓글 작성에 성공하였습니다."
		 		+ "5포인트가 적립되었습니다");
		 mv.addObject("url","/board_detail.do?b_id="+vo.getB_ref());
		 mv.setViewName("alertMsg");
		return mv;
	}

	// 게시글 등록
	@RequestMapping(value = "boardinsert.do", method = RequestMethod.POST)
	public ModelAndView BoardInsertService(@RequestParam(name = "b_content") String b_content,
		@RequestParam(name = "b_title") String b_title, @RequestParam("b_type") String b_type,
		@RequestParam(name = "m_id") String m_id, @RequestParam(name = "b_secret") String b_secret,
		@RequestParam(name = "b_secretnumber", defaultValue = "0") int b_secretnumber, ModelAndView mv,
		HttpServletRequest request) {
		Board b = new Board();
		b_content.replace("\"", "'");
		
		
		try {
			b.setB_content(b_content);
			b.setM_id(m_id);
			b.setB_type(b_type);
			b.setB_title(b_title);
			b.setB_secret(b_secret);
			b.setB_secretnumber(b_secretnumber);
			bService.insertBoard(b);
			
			
		}catch(Exception e) {
			 mv.addObject("msg","글작성에 실패하셨습니다.");
			 mv.addObject("url","/board_list.do");
			 mv.setViewName("alertMsg");
			return mv;
			
		}
		 mv.addObject("msg","글작성에 성공하였습니다. 10포인트가 적립되었습니다");
		 mv.addObject("url","/board_list.do");
		 mv.setViewName("alertMsg");
		return mv;
	}
	@RequestMapping(value = "boarddelete.do", method = RequestMethod.GET)
	public ModelAndView BoardDeleteService(@RequestParam(name = "b_id") int b_id, ModelAndView mv,
			HttpServletRequest request) {
		
		
	try {
		
		bService.deleteBoard(b_id);
	}catch(Exception e) {
		 mv.addObject("msg","글 삭제에 실패하셨습니다");
		 mv.addObject("url","/board_list.do");
		 mv.setViewName("alertMsg");
		return mv;
	}
	mv.addObject("msg","글 삭제에 성공하셨습니다");
	 mv.addObject("url","/board_list.do");
	 mv.setViewName("alertMsg");
		return mv;
	}

	@RequestMapping(value = "deleteComment.do", method = RequestMethod.GET)
	public ModelAndView commentDeleteService(@RequestParam(name = "b_id") int b_id,
			@RequestParam(name = "rb_id") int rb_id, @RequestParam(name = "b_re_step") int b_re_step, ModelAndView mv,
			HttpServletRequest request) {
		int commentCount = 0;
		HashMap<String, Integer> commentinfo = new HashMap<String, Integer>();
		
		try {
			
			
			commentinfo.put("b_ref", rb_id);
			commentinfo.put("b_re_step", b_re_step);
			commentCount = bService.selectCommentCount(commentinfo);
			System.out.println(commentCount);
			if (commentCount == 1) {
				bService.deleteComment(b_id);
			} else {
				bService.deleteCommentB(b_id);
			}
			
		}catch(Exception e) {
			
			 mv.addObject("msg","댓글 삭제에 실패하셨습니다");
			 mv.addObject("url","/board_detail.do?b_id="+ rb_id);
			 mv.setViewName("alertMsg");
		}
		 mv.addObject("msg","댓글 삭제에 성공 하셨습니다");
		 mv.addObject("url","/board_detail.do?b_id="+rb_id);
		 mv.setViewName("alertMsg");
		
		
		return mv;
	}

@RequestMapping(value = "deleteRecomment.do", method = RequestMethod.GET)
	public ModelAndView recommentDeleteService(@RequestParam(name = "b_id") int b_id,
			@RequestParam(name = "rb_id") int rb_id, @RequestParam(name = "b_re_step") int b_re_step, ModelAndView mv,
			HttpServletRequest request) {
		Board vo = new Board();
		
		try {
			
			vo.setB_id(rb_id);
			vo.setB_re_step(b_re_step);
			
			int count = bService.selectRecommentCount(vo);
			String commentcontent = bService.selectCommentContent(vo);
			System.out.println(commentcontent);
			if (count == 2 && commentcontent.equals("삭제된 댓글입니다")) {
				bService.deleteCommentC(vo);
			} else {
				bService.deleteRecomment(b_id);
			}
			
		}catch(Exception e) {
			
			
		}

		mv.setViewName("redirect:board_detail.do?b_id=" + rb_id);
		return mv;
	}


	@RequestMapping(value = "commentupdate.do", method = RequestMethod.POST)
	public ModelAndView commentUpdateService(ModelAndView mv, @RequestParam(name = "b_id") int b_id,
			@RequestParam(name = "b_content") String b_content, @RequestParam(name = "b_ref") int b_ref,
			HttpServletRequest request) {
		Board vo = new Board();
		
		try {
			
			
			vo.setB_content(b_content);
			vo.setB_id(b_id);
			bService.updateComment(vo);
		}catch(Exception e) {
			
			
		}
		mv.setViewName("redirect:/board_detail.do?b_id=" + b_ref);
		return mv;
	}

	@RequestMapping(value = "board_updateform.do")
	public ModelAndView boardupdate(ModelAndView mv, @RequestParam(name = "b_id") int b_id) {

		mv.addObject("blist", bService.selectBoard(b_id));
		mv.setViewName("board_update");
		return mv;
	}

	@RequestMapping(value = "updateboard.do", method = RequestMethod.POST)
	public ModelAndView boardupdateService(ModelAndView mv, @RequestParam(name = "b_content") String b_content,
			@RequestParam(name = "b_title") String b_title, @RequestParam(name = "b_secret") String b_secret,
			@RequestParam(name = "b_secretnumber") int b_secretnumber, @RequestParam(name = "b_id") int b_id,
			@RequestParam(name = "b_type") String b_type) {
		Board vo = new Board();
		
		try {
			vo.setB_content(b_content);
			vo.setB_id(b_id);
			vo.setB_secret(b_secret);
			vo.setB_secretnumber(b_secretnumber);
			vo.setB_type(b_type);
			vo.setB_title(b_title);
			bService.updateBoard(vo);
			
		}catch(Exception e) {
			
			
		}
		
		mv.setViewName("redirect:/board_detail.do?b_id=" + b_id);
		return mv;
	}

	@RequestMapping(value = "board_like.do")
	public void boardlike(ModelAndView mv, @RequestParam(name = "b_id") int b_id,
			@RequestParam(name = "m_id") String m_id, @RequestParam(name = "chc") int chc, HttpServletRequest request,
			HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			Board vo = new Board();
			vo.setB_id(b_id);
			vo.setM_id(m_id);
			System.out.println(chc);
			if (chc == 1) {
				System.out.println("실행");
				bService.deleteLike(vo);
				bService.updateLikeMinus(b_id);
			} else {
				bService.updateLikePlus(b_id);
				bService.insertLike(vo);
			}
			int LikeCount = 0;
			LikeCount = bService.selectLikeCount(b_id);
			out.print(LikeCount);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "board_likecheck.do")
	public void boardlikecheck(ModelAndView mv, @RequestParam(name = "b_id") int b_id,
			@RequestParam(name = "m_id") String m_id, HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out;
		try {
			out = response.getWriter();
			int checkid = 0;
			Board vo = new Board();
			vo.setM_id(m_id);
			vo.setB_id(b_id);
			checkid = bService.selectLikeMid(vo);
			out.print(checkid);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 파일 업로드
	@RequestMapping("/fileupload.do")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 파일정보
			String sFileInfo = "";
			// 파일명을 받는다 - 일반 원본파일명

			String filename = request.getHeader("file-name");

			// 파일 확장자

			String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);

			// 확장자를소문자로 변경

			filename_ext = filename_ext.toLowerCase();

			// 파일 기본경로

			String dftFilePath = request.getSession().getServletContext().getRealPath("/");

			// 파일 기본경로 _ 상세경로

			String filePath = dftFilePath + "resources" + File.separator + "board_photo_upload" + File.separator;

			System.out.println(filePath);

			File file = new File(filePath);

			if (!file.exists()) {

				file.mkdirs();
			}
			String realFileNm = "";

			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");

			String today = formatter.format(new java.util.Date());

			realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));

			String rlFileNm = filePath + realFileNm;

			///////////////// 서버에 파일쓰기 /////////////////

			InputStream is = request.getInputStream();

			OutputStream os = new FileOutputStream(rlFileNm);

			int numRead;

			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];

			while ((numRead = is.read(b, 0, b.length)) != -1) {

				os.write(b, 0, numRead);

			}

			if (is != null) {

				is.close();

			}

			os.flush();

			os.close();

			///////////////// 서버에 파일쓰기 /////////////////

			// 정보 출력

			sFileInfo += "&bNewLine=true";

			// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함

			sFileInfo += "&sFileName=" + filename;
			;

			sFileInfo += "&sFileURL=" + "/tworavel/resources/board_photo_upload/" + realFileNm;

			PrintWriter print = response.getWriter();

		         print.print(sFileInfo);

		         print.flush();

		         print.close();

		    } catch (Exception e) {

		        e.printStackTrace();

		    }

		}



}
