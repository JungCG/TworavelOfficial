package com.kh.tworavel.controller;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tworavel.model.domain.ChatJoin;
import com.kh.tworavel.model.domain.ChatMessage;
import com.kh.tworavel.model.service.ChatService;

@Controller
public class ChatController {
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	private ChatJoin chatJn;
	@Autowired
	private ChatMessage chatMsg;
	@Autowired
	private ChatService chService;
	
	// 채팅방 목록 페이지
	@RequestMapping(value = "/Chat.do", method = { RequestMethod.GET})
	public ModelAndView getChatlist(HttpServletRequest request, ModelAndView mv) {
		try {
			String userID = (String) request.getSession().getAttribute("userID");
			
			//로그인 아이디의 채팅방 목록 불러오기
			mv.addObject("chatGrouplist", chService.selectChatGroup(userID));
			mv.setViewName("mypage_chat");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
	// 채팅방으로 초대 (insert)
	@ResponseBody
	@RequestMapping(value = "/inviteChat.do", method = { RequestMethod.GET})
	public void inviteChat(@RequestParam int c_id, @RequestParam String m_id2, HttpServletRequest request, ModelAndView mv) {
		try {
			//수락자 (채팅방 table insert)
			String userID = (String) request.getSession().getAttribute("userID");
			chatJn.setM_id(userID);
			chatJn.setC_id(c_id);
			int result01 = chService.checkChatJoin(chatJn);
			if(result01>0) {
//				System.out.println("글 작성자가 이미 채팅방에 있음");
			}else {
				int result02 = chService.insertChatJoin(chatJn);
				chatMsg.setM_sender(userID);
				chatMsg.setC_id(c_id);
				chatMsg.setM_receiver(m_id2);
				chatMsg.setCh_content("["+ userID + "]님이 입장했습니다.");
				chService.inviteChatMessage(chatMsg);
			}
			//신청자 (채팅방 table insert)
			chatJn.setM_id(m_id2);
			int result03 = chService.checkChatJoin(chatJn);
			if(result01>0) {
//				System.out.println("글 작성자가 이미 채팅방에 있음");
			}else {
				int result04 = chService.insertChatJoin(chatJn);
				chatMsg.setM_sender(m_id2);
				chatMsg.setC_id(c_id);
				chatMsg.setM_receiver(userID);
				chatMsg.setCh_content("["+ m_id2 + "]님이 입장했습니다.");
				chService.inviteChatMessage(chatMsg);
			}
			//로그인 아이디의 채팅방 목록 불러오기
			mv.setViewName("redirect:Chat.do");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 채팅방 메세지  (insert)
	@ResponseBody
	@RequestMapping(value = "/insertChat.do", method = { RequestMethod.GET})
	public void insertChat(@RequestParam int c_id, @RequestParam String ch_content, HttpServletRequest request,
			ModelAndView mv) {
		// (로그인한)작성자
		String userID = (String) request.getSession().getAttribute("userID");
		chatMsg.setC_id(c_id);
		chatMsg.setM_sender(userID);
		chatMsg.setCh_content(ch_content);
		try {
			// 강은 채팅방 사람들 조회
			List<ChatJoin> userlist = new ArrayList<ChatJoin>();
			userlist = chService.selectSameRoom(c_id);
			for (int i = 0; i < userlist.size(); i++) {
				if (userlist.get(i).getM_id() != userID) {
					chatMsg.setM_receiver(userlist.get(i).getM_id());
					// 해당 채팅방 하나 생성 (insert)
					int result = chService.insertChatMessage(chatMsg);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//채팅방 입장
	@ResponseBody
	@RequestMapping(value = "/ChatDetail.do", method = RequestMethod.GET)
	public ModelAndView ChatDetail(HttpServletRequest request, @RequestParam int c_id, ModelAndView mv) {
		String userID = (String) request.getSession().getAttribute("userID");
		chatMsg.setM_sender(userID);
		chatMsg.setC_id(c_id);
		chatMsg.setM_receiver(userID);
		chatMsg.setM_id(userID);
		try {
			mv.addObject("chatGrouplist", chService.selectChatGroup(userID));
			mv.addObject("chatList", chService.selectBeforeChat(chatMsg));
			mv.addObject("c_id", c_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("mypage_chat");
		return mv;
	}
	
	//채팅방 나가기
	@RequestMapping(value = "/updateChatOut.do", method = RequestMethod.GET)
	public ModelAndView updateChatOut(HttpServletRequest request, @RequestParam int c_id, ModelAndView mv) {
		try {
			String userID = (String) request.getSession().getAttribute("userID");
			chatJn.setM_id(userID);
			chatJn.setC_id(c_id);
			
			int result = chService.updateChatOut(chatJn);
			if(result>0) {
				mv.setViewName("redirect:Chat.do");
			}else {
				//System.out.println("채팅방 나가기 실패!");
				mv.setViewName("redirect:Chat.do");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
