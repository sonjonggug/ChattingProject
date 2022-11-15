package com.example.toy.controller;

import com.example.toy.jpa.ChattingService;
import com.example.toy.jpa.UserService;
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
	UserService UserService; 
	@Autowired
	ChattingService ChattingService; 
	@Autowired
	UserManagementService UserManagementService;
	@Autowired
	AdminService AdminService;

	@Autowired
	JpaAdminService jpaAdminService;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model) throws Exception {
		HashMap<String, String> integrated = new HashMap<String, String>();
		HashMap<String, String> Userincrease = new HashMap<String, String>();
//		ArrayList<HashMap> showUser = new ArrayList<HashMap>();
		List<Login_User> showUser = new ArrayList<Login_User>();

		integrated = UserManagementService.UserSum();
        log.info("통합 정보 " + integrated);
        
        Userincrease = UserManagementService.Userincrease();
        log.info("사용자수 추이 " + Userincrease);
        
        showUser = jpaAdminService.ShowUser();
        log.info("사용자 검색" + showUser);
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
	public String selectUser(@RequestParam(value ="userNum")String userNum , Model model) throws Exception {

		Login_User selectUser = new Login_User();

		selectUser = jpaAdminService.selectUser(Long.valueOf(userNum));

		log.info("사용자 업데이트 정보" + selectUser);
		
		model.addAttribute("selectUser",selectUser);
		return "user/updateUser";			
	}
	
	@RequestMapping(value = "/infoUser", method = RequestMethod.POST)
	public String infoUser(@RequestParam(value ="userNum")String userNum , @RequestParam(value ="userid")String userid , Model model) throws Exception {

		ArrayList<HashMap> chattLog = new ArrayList<HashMap>();

		Login_User selectUser = new Login_User();
		selectUser = jpaAdminService.selectUser(Long.valueOf(userNum));

		chattLog = AdminService.chattLog(userid);	
		log.info("사용자 상세정보" + selectUser);
		log.info("채팅내역" + chattLog);
		model.addAttribute("selectUser",selectUser);
		model.addAttribute("chattLog",chattLog);
		return "user/infoUser";			
	}
	
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String updateUser(@RequestParam(value ="userNum")String userNum , @ModelAttribute LoginUserDto loginUserDto , Model model , HttpServletResponse response) throws Exception {
		/*HashMap<String, String> selectUser = new HashMap<String, String>();*/
		response.setContentType("text/html; charset=utf-8");
		PrintWriter w = response.getWriter();
		String updateMsg = UserService.updateUser(loginUserDto);


		if (updateMsg.equals("업데이트가 완료되었습니다.")) {

			Login_User selectUser = jpaAdminService.selectUser(Long.valueOf(userNum));
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
		/*HashMap<String, String> selectUser = new HashMap<String, String>();*/
		Login_User selectUser = new Login_User();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter w = response.getWriter();
		boolean bool = AdminService.deleteUser(loginUserDto);
		
		if (bool==true) {
			
			log.info("사용자 삭제 성공 ");
						
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
