package com.example.toy.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.toy.jpa.ChattingService;
import com.example.toy.jpa.entity.Channel_Info;
import com.example.toy.jpa.entity.Talk_Bot_Log;
import com.example.toy.jpa.entity.User_Talk_Log;
import com.example.toy.service.KaKaoApiService;
import com.example.toy.service.NaverApiService;
import com.example.toy.service.UserManagementService;
import com.example.toy.service.WebSocketChatService;

//@RestController
@Controller
public class ChattController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChattController.class);
	@Autowired
	NaverApiService NaverApiService;
	@Autowired
	ChattingService ChattingService;
	@Autowired
	KaKaoApiService kaKaoApiService;
	@Autowired
	UserManagementService userManagementService;
	
	/**
	 * 정적 변수로 저장된 client 값을 가져옴 
	 * Controller가 @ServerEndpoint보다 빨리 받기에 처음 값은 +1을 한다.   
	 * @param request
	 * @param Session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mychatt")
	public String chatt(HttpServletRequest request ,  HttpSession Session) throws Exception {
		
		WebSocketChatService WebSocketChatService = new WebSocketChatService();
		 int clientCnt = WebSocketChatService.clients.size()+1;
		 String channel = "channel_A";
		 	 
		 ChattingService.updateCnt(clientCnt,channel);
		 logger.info("채팅창 진입 시 접속자 수 업데이트");			
		String ip = request.getHeader("X-Forwarded-For");
		if(ip == null || ip.length()==0||"unknown".equalsIgnoreCase(ip)) {
			ip=request.getHeader("Proxy-Client-IP");
		}
		if(ip == null || ip.length()==0||"unknown".equalsIgnoreCase(ip)) {
			ip=request.getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null || ip.length()==0||"unknown".equalsIgnoreCase(ip)) {
			ip=request.getHeader("HTTP_CLIENT_IP");
		}
		if(ip == null || ip.length()==0||"unknown".equalsIgnoreCase(ip)) {
			ip=request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if(ip == null || ip.length()==0||"unknown".equalsIgnoreCase(ip)) {
			ip=request.getRemoteAddr();
		}	
		Session.setAttribute("IP", ip);
		Session.setAttribute("Port", request.getRemotePort());
		Session.setAttribute("channel", channel);
		return "user/chatting";
	}
    
	/**
	 * 네이버 API 영어 번역
	 * @param lang
	 * @return
	 */
	@RequestMapping(value = "/SearchEng", method = RequestMethod.GET)
	@ResponseBody
	public String SearchEng(@RequestParam(value ="lang")String lang){	
		
	 String en=NaverApiService.Start(lang);
	 logger.info("Naver API 영어 번역");
		return en;
	}
	/**
	 * 네이버 API 중국어 번역 
	 * @param lang
	 * @return
	 */
	@RequestMapping(value = "/SearchChi", method = RequestMethod.GET)
	@ResponseBody
	public String SearchChi(@RequestParam(value ="lang")String lang){		
		 
	 String en=NaverApiService.ChinaStart(lang);
	 logger.info("Naver API 중국어 번역");
		return en;
	}
	
	@RequestMapping(value = "/SearchCnt", method = RequestMethod.GET)
	@ResponseBody
	public int SearchCnt(@RequestParam(value ="channel")String channel) throws Exception {
			Channel_Info channelInfo= new Channel_Info();
			
			channelInfo = ChattingService.searchCnt(channel);
		 	System.out.println(channelInfo.getChannel_name());
		 	System.out.println(channelInfo.getUser_cnt());
		 	logger.info("접속자 수 체크");
		 		 
	        return channelInfo.getUser_cnt();
	}
	
	
	@RequestMapping(value = "/talkBot", method = RequestMethod.GET)
	@ResponseBody
	public String talkBot(@RequestParam(value ="QA")String QA ,  @ModelAttribute User_Talk_Log userTalk) throws Exception {	
		SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd hh:mm");   	 	
   	 	userTalk.setSend_date(today.format(new Date())); 	 	
   	 	 int user_no = userManagementService.UserTalkLog(userTalk);
		 String en= kaKaoApiService.Start(QA);
		 System.out.println("user_no ---------------------------" + user_no);
		 logger.info(en);	  


		  
			return en;
	}
	@RequestMapping(value = "/talkBotSave", method = RequestMethod.GET)
	@ResponseBody
	public void talkBotSave(@ModelAttribute Talk_Bot_Log botTalk) throws Exception {	
		SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd hh:mm");   	 	
		botTalk.setSend_date(today.format(new Date()));
   	 	
   	 	  userManagementService.talkBotSave(botTalk);
		 	  

	}
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String user(Model model) throws Exception {
		
		return "user/user";			
	}
}
