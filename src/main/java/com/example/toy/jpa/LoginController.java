package com.example.toy.jpa;

import com.example.toy.jpa.repository.LoginRepository;
import com.example.toy.service.UserManagementService;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
@Slf4j
@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	UserService UserService; 
	@Autowired
	ChattingService ChattingService; 
	@Autowired
	UserManagementService UserManagementService;
	@Autowired
	PasswordEncoder passwordEncoder;
	
	private LoginRepository login;
  	
	public LoginController(LoginRepository login) {
		this.login = login;
	}
	
	
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
	    public String signup(HttpServletRequest request , HttpServletResponse response) throws IOException {
		 response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			HashMap map = new HashMap();
		SimpleDateFormat sDate2 = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String password=passwordEncoder.encode(request.getParameter("userPw"));

			map.put("userId",request.getParameter("userid"));
			map.put("userPw",password);
			map.put("userName",request.getParameter("userName"));
			map.put("userSex",request.getParameter("userSex"));
			map.put("userAuth","USER");
			map.put("joinDate",sDate2.format(new Date()));
			map.put("loginDate",sDate2.format(new Date()));

			logger.info("회원가입 진입 전");
	        if(UserService.insertUser(map)==(true)) {
	        	logger.info("회원가입 성공");
	            return "Login";
	        } else {
	        	logger.info("회원가입 실패");
	        out.println("<script>alert('회원가입에 실패 하였습니다.'); </script>");
			out.flush();
			return "join";
	    }
	 }
	 @GetMapping("/user_access")
	    public String userAccess(Model model, Authentication authentication ,  HttpSession Session) throws Exception {
	        //Authentication 객체를 통해 유저 정보를 가져올 수 있다.
		 UserDetails LoginUser = (UserDetails) authentication.getPrincipal();  //userDetail 객체를 가져옴
		 UserService.updateDate(LoginUser.getUsername());
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
	public String access_denied() {
		logger.info("access_denied");		
		return "access_denied";
	}
	
	@RequestMapping(value = "/checkid", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> checkid(@RequestParam(value ="userid")String userid) throws Exception {			
			int count ;
	        Map<Object, Object> map = new HashMap<Object, Object>();
	 
	        count = UserService.checkid(userid);	        
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
