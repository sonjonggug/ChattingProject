package com.example.toy.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.toy.jpa.ChattingService;
import com.example.toy.jpa.LoginController;
import com.example.toy.jpa.channel_info;
import com.example.toy.service.NaverApiService;
import com.example.toy.service.WebSocketChatService;

//@RestController
@Controller
public class ChattController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChattController.class);
	@Autowired
	NaverApiService NaverApiService;
	@Autowired
	ChattingService ChattingService;
	
	
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
		 System.out.println("---------------"+clientCnt);
		 
		 ChattingService.updateCnt(clientCnt,channel);
		 				
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
		return "chatting";
	}
    
	/**
	 * 네이버 API 사용 
	 * @param lang
	 * @return
	 */
	@RequestMapping(value = "/SearchEng", method = RequestMethod.GET)
	@ResponseBody
	public String SearchEng(@RequestParam(value ="lang")String lang){		
	 Map<String,Object> map = new HashMap<String,Object>();

	 String en=NaverApiService.Start(lang);
		return en;
	}
	/**
	 * 네이버 API 사용 
	 * @param lang
	 * @return
	 */
	@RequestMapping(value = "/SearchChi", method = RequestMethod.GET)
	@ResponseBody
	public String SearchChi(@RequestParam(value ="lang")String lang){		
	 Map<String,Object> map = new HashMap<String,Object>();
	 
	 String en=NaverApiService.ChinaStart(lang);
		return en;
	}
	
	@RequestMapping(value = "/SearchCnt", method = RequestMethod.GET)
	@ResponseBody
	public Long SearchCnt(@RequestParam(value ="channel")String channel) throws Exception {
			channel_info channelInfo= new channel_info();
			
			channelInfo = ChattingService.searchCnt(channel);
		 	System.out.println(channelInfo.getChannel_name());
		 	System.out.println(channelInfo.getUser_cnt());
		 	logger.info("30초 간격 사용자 체크");
		 		 
	        return channelInfo.getUser_cnt();
	}
}
