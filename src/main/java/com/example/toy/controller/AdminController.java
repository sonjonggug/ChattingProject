package com.example.toy.controller;

import com.example.toy.jpa.ChattingService;
import com.example.toy.jpa.entity.Talk_Bot_Log;
import com.example.toy.jpa.service.LogService;
import com.example.toy.jpa.entity.Login_User;
import com.example.toy.jpa.service.JpaAdminService;
import com.example.toy.service.AdminService;
import com.example.toy.service.UserManagementService;
import com.example.toy.vo.LoginUserDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
@Slf4j
@Controller
public class AdminController {


	

	@Autowired
	ChattingService ChattingService; 
	@Autowired
	UserManagementService UserManagementService;
	@Autowired
	AdminService AdminService;
	@Autowired
	JpaAdminService jpaAdminService;
	@Autowired
	LogService logService;
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model) throws Exception {
		HashMap<String, String> integrated = new HashMap<String, String>();
		HashMap<String, String> Userincrease = new HashMap<String, String>();

		List<Login_User> showUser = new ArrayList<Login_User>();

		integrated = UserManagementService.UserSum();
        log.info("통합 정보 " + integrated);
        
        Userincrease = UserManagementService.Userincrease();
        log.info("사용자수 추이 " + Userincrease);
        
        showUser = jpaAdminService.ShowUser();
        log.info("사용자 목록" + showUser);
		 model.addAttribute("sumCnt",integrated.get("user_cnt"));
		 model.addAttribute("user",integrated.get("user"));
		 model.addAttribute("talkResult",integrated.get("talkResult"));
		 model.addAttribute("sex_man",integrated.get("sex_man"));
		 model.addAttribute("sex_woman",integrated.get("sex_woman"));
		 model.addAttribute("Userincrease",Userincrease);
		 model.addAttribute("showUser",showUser);
		return "user/index";			
	}
	

	@RequestMapping(value = "/selectUser", method = RequestMethod.POST)
	public String selectUser(@RequestParam(value ="userNum")String userNum , Model model) throws Exception {

		Login_User selectUser = jpaAdminService.selectUser(Long.valueOf(userNum));

		log.info("사용자 상세 정보" + selectUser);
		
		model.addAttribute("selectUser",selectUser);
		return "user/updateUser";			
	}
	
	@RequestMapping(value = "/infoUser", method = RequestMethod.POST)
	public String infoUser(@ModelAttribute LoginUserDto userDto ,  Model model) throws Exception {

		Login_User selectUser = jpaAdminService.selectUser(userDto.getUserNum());

		List<Talk_Bot_Log> chattingLog = logService.chattingLog(userDto.getUserid().trim());


		log.info("채팅내역" + chattingLog);
		model.addAttribute("selectUser",selectUser);
		model.addAttribute("chattingLog",chattingLog);
		return "user/infoUser";			
	}
	
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String updateUser(@RequestParam(value ="userNum")String userNum , @ModelAttribute LoginUserDto loginUserDto , Model model , HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=utf-8");
		PrintWriter w = response.getWriter();

		String updateMsg = jpaAdminService.updateUser(loginUserDto);


		if (updateMsg.equals("업데이트가 완료되었습니다.")) {

			Login_User selectUser = jpaAdminService.selectUser(loginUserDto.getUserNum());
			log.info("사용자 업데이트 성공 " + selectUser);
			model.addAttribute("selectUser", selectUser);
			w.write("<script>alert('업데이트가 완료되었습니다.');</script>");
			w.flush();

			return "user/updateUser";

		} else if (updateMsg.equals("이미 존재하는 아이디입니다.")) {

			Login_User selectUser = jpaAdminService.selectUser(Long.valueOf(userNum));
			model.addAttribute("selectUser", selectUser);
			log.info("사용자 업데이트 실패 " + selectUser);
			w.write("<script>alert('이미 존재하는 아이디입니다.');</script>");
			w.flush();

			return "user/updateUser";
		} else {

			Login_User selectUser = jpaAdminService.selectUser(Long.valueOf(userNum));
			model.addAttribute("selectUser", selectUser);
			log.info("사용자 업데이트 실패 " + selectUser);
			w.write("<script>alert('업데이트에 실패 하였습니다');</script>");
			w.flush();
			return "user/updateUser";

		}
	}
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	public String deleteUser(@RequestParam(value ="userNum")String userNum , @ModelAttribute LoginUserDto loginUserDto , Model model , HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter w = response.getWriter();

		boolean deleteUserYN = jpaAdminService.deleteUser(loginUserDto.getUserNum());
		
		if (deleteUserYN==true) {
			
			log.info("사용자 삭제 성공 ");
						
			w.write("<script>alert('삭제가 완료되었습니다.');location.href='admin';</script>");

		}else {
			w.write("<script>alert('삭제에 실패하였습니다.');location.href='admin';</script>");

		}
		w.flush();
		return "redirect:admin";
	}
}
