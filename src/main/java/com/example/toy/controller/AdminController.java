package com.example.toy.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.toy.jpa.ChattingService;
import com.example.toy.jpa.LoginController;
import com.example.toy.jpa.UserService;
import com.example.toy.service.UserManagementService;
@Controller
public class AdminController {

private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	UserService UserService; 
	@Autowired
	ChattingService ChattingService; 
	@Autowired
	UserManagementService UserManagementService;
	
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model) throws Exception {
		HashMap<String, String> integrated = new HashMap<String, String>();
		HashMap<String, String> Userincrease = new HashMap<String, String>();
		ArrayList<HashMap> showUser = new ArrayList<HashMap>();
		integrated = UserManagementService.UserSum();
        logger.info("통합 정보 " + integrated);
        
        Userincrease = UserManagementService.Userincrease();
        logger.info("사용자수 추이 " + Userincrease);
        
        showUser = UserManagementService.showUser();
        logger.info("사용자 검색" + showUser);
		 model.addAttribute("sumCnt",integrated.get("user_cnt"));
		 model.addAttribute("user",integrated.get("user"));
		 model.addAttribute("channel_name",integrated.get("channel_name"));
		 model.addAttribute("sex_man",integrated.get("sex_man"));
		 model.addAttribute("sex_woman",integrated.get("sex_woman"));
		 model.addAttribute("Userincrease",Userincrease);
		 model.addAttribute("showUser",showUser);
		return "user/index";			
	}
	
	@RequestMapping(value = "/searchUser", method = RequestMethod.GET)
	public String searchUser(Model model) throws Exception {
		ArrayList<HashMap> showUser = new ArrayList<HashMap>();
		
		showUser = UserManagementService.showUser();		
		logger.info("사용자 검색" + showUser);
		
		model.addAttribute("showUser",showUser);
		return "user/tables";			
	}
	@RequestMapping(value = "/selectUser", method = RequestMethod.GET)
	public String selectUser(HttpServletRequest request,Model model) throws Exception {
		HashMap<String, String> selectUser = new HashMap<String, String>();
		String userid = request.getParameter("userid");
		
		selectUser = UserManagementService.selectUser(userid);		
		logger.info("사용자 업데이트 검색" + selectUser);
		
		model.addAttribute("selectUser",selectUser);
		return "user/tables";			
	}
}
