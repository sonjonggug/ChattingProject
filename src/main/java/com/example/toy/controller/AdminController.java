package com.example.toy.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.toy.jpa.ChattingService;
import com.example.toy.jpa.LoginController;
import com.example.toy.jpa.UserService;
import com.example.toy.jpa.entity.Login_User;
import com.example.toy.service.AdminService;
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
	@Autowired
	AdminService AdminService;
	
	
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
	

	@RequestMapping(value = "/selectUser", method = RequestMethod.POST)
	public String selectUser(@RequestParam(value ="user_no")String user_no , Model model) throws Exception {
		HashMap<String, String> selectUser = new HashMap<String, String>();
		
		selectUser = UserManagementService.selectUser(user_no);		
		logger.info("사용자 업데이트 정보" + selectUser);
		
		model.addAttribute("selectUser",selectUser);
		return "user/updateUser";			
	}
	
	@RequestMapping(value = "/infoUser", method = RequestMethod.POST)
	public String infoUser(@RequestParam(value ="user_no")String user_no , Model model) throws Exception {
		HashMap<String, String> selectUser = new HashMap<String, String>();
		
		selectUser = UserManagementService.selectUser(user_no);		
		logger.info("사용자 상세정보" + selectUser);
		
		model.addAttribute("selectUser",selectUser);
		return "user/infoUser";			
	}
	
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String updateUser(@RequestParam(value ="user_no")String user_no , @ModelAttribute Login_User login_User , Model model , HttpServletResponse response) throws Exception {
		HashMap<String, String> selectUser = new HashMap<String, String>();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter w = response.getWriter();
		boolean bool = AdminService.updateUser(login_User);
		
		if (bool==true) {
			selectUser = UserManagementService.selectUser(user_no);
			logger.info("사용자 업데이트 후 정보 " + selectUser);
			model.addAttribute("selectUser",selectUser);			
			w.write("<script>alert('업데이트가 완료되었습니다.');</script>");
			w.flush();
			
			return "user/updateUser";
			
		}else {
			w.write("<script>alert('업데이트에 실패하였습니다.');</script>");
			w.flush();
			
		return "user/updateUser";			
	}
	}
 
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	public String deleteUser(@RequestParam(value ="user_no")String user_no , @ModelAttribute Login_User login_User , Model model , HttpServletResponse response) throws Exception {
		HashMap<String, String> selectUser = new HashMap<String, String>();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter w = response.getWriter();
		boolean bool = AdminService.deleteUser(login_User);
		
		if (bool==true) {
			
			logger.info("사용자 삭제 성공 ");
						
			w.write("<script>alert('삭제가 완료되었습니다.');location.href='admin';</script>");
			w.flush();
			
			return "redirect:admin";
			
		}else {
			w.write("<script>alert('삭제에 실패하였습니다.');location.href='admin';</script>");
			w.flush();
			
		return  "redirect:admin";			
	}
	}
}
