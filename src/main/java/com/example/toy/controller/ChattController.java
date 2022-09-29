package com.example.toy.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.toy.service.NaverApiService;

//@RestController
@Controller
public class ChattController {
	@Autowired
	NaverApiService NaverApiService;
	
	
	@RequestMapping("/mychatt")
	public String chatt(HttpServletRequest request ,  HttpSession Session) {
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
		return "chatting";
	}

	@RequestMapping(value = "/SearchEng", method = RequestMethod.GET)
	@ResponseBody
	public String SearchEng(@RequestParam(value ="lang")String lang){		
	 Map<String,Object> map = new HashMap<String,Object>();

	 String en=NaverApiService.Start(lang);
		return en;
	}
	@RequestMapping(value = "/SearchChi", method = RequestMethod.GET)
	@ResponseBody
	public String SearchChi(@RequestParam(value ="lang")String lang){		
	 Map<String,Object> map = new HashMap<String,Object>();
	 
	 String en=NaverApiService.ChinaStart(lang);
		return en;
	}
}
