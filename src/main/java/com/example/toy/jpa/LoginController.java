package com.example.toy.jpa;

import com.example.toy.jpa.service.JpaAdminService;
import com.example.toy.service.UserManagementService;
import com.example.toy.vo.LoginUserDto;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
@Slf4j
@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	JpaAdminService jpaAdminService;
	@Autowired
	ChattingService ChattingService;
	@Autowired
	UserManagementService UserManagementService;
	@Autowired
	PasswordEncoder passwordEncoder;



	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String root() {

		return "Login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {

		return "Login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String Login() {
		logger.info("로그인 시도");
		return "Login";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup() {
		logger.info("회원가입 페이지");
		return "signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(@ModelAttribute LoginUserDto loginUserDto, HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter w = response.getWriter();

		String password = passwordEncoder.encode(loginUserDto.getUserPw());
		loginUserDto.setUserPw(password);

		String result = jpaAdminService.insertUser(loginUserDto);

		if (result.equals("회원가입에 성공하였습니다.")) {
			w.write("<script>alert('회원가입에 성공하였습니다.');</script>");
			w.flush();
			return "Login";
		} else if (result.equals("중복된 아이디 입니다.")) {
			w.write("<script>alert('중복된 아이디 입니다.');</script>");
			w.flush();
			return "signup";
		} else {
			w.write("<script>alert('회원가입에 실패하였습니다. 다시 시도해 주십시오.');</script>");
			w.flush();
			return "signup";
		}
	}
	 @GetMapping("/user_access")
	    public String userAccess(Model model, Authentication authentication ,  HttpSession Session) throws Exception {
		 logger.info("인증 성공");
	        //Authentication 객체를 통해 유저 정보를 가져올 수 있다.
		 UserDetails LoginUser = (UserDetails) authentication.getPrincipal();  //userDetail 객체를 가져옴
		 jpaAdminService.updateDate(LoginUser.getUsername());

		   if(LoginUser.getUsername().equals("Admin")) {
			 model.addAttribute("info", LoginUser.getUsername() +"의 "+ LoginUser.getUsername()+ "님");      //유저 아이디
		      logger.info("Admin 접속");
		      Session.setAttribute("Admin",LoginUser.getUsername()); 
		      	return "user/index";
		   	} else {
	        model.addAttribute("info", LoginUser.getUsername() +"의 "+ LoginUser.getUsername()+ "님");      //유저 아이디
	        logger.info(LoginUser.getUsername()+" 접속");
	        Session.setAttribute("id",LoginUser.getUsername());
	        return "redirect:mychatt";
		   }

	    }
	@RequestMapping(value = "/access_denied", method = RequestMethod.GET)
	public String access_denied(HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter w = response.getWriter();
		logger.info("로그인 실패");
		w.write("<script>alert('아이디 혹은 비밀번호가 틀렸습니다.');</script>");
		w.flush();
		return "Login";
	}
	
	@RequestMapping(value = "/checkid", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> checkid(@RequestParam(value ="userid")String userid) throws Exception {			
			int count ;
	        Map<Object, Object> map = new HashMap<Object, Object>();
	 
	        count = jpaAdminService.checkid(userid);
	        map.put("count", count);
	        logger.info("아이디 중복 체크");	
	        return map;
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(HttpSession Session) {
		if(Session.getAttribute("Admin").equals("Admin")) {
			
			return "user/index";
		}else {
		
			return  "redirect:mychatt";
		}		
	}
	
}
