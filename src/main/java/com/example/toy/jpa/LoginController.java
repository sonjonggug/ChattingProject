package com.example.toy.jpa;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.toy.service.WebSocketChatService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	UserService UserService; 
	
	private LoginRepository login;
  	
	public LoginController(LoginRepository login) {
		this.login = login;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String root() {
				
		return "Login";
	}
	@RequestMapping(value = "/Login", method = RequestMethod.POST)
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
	    public String signupo(HttpServletRequest request , HttpServletResponse response) throws IOException {
		 response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			LoginUser User = new LoginUser();
			User.setUserid(request.getParameter("userid"));
			User.setUser_pw(request.getParameter("user_pw"));
			User.setUser_name(request.getParameter("user_name"));
			User.setUser_sex(request.getParameter("user_sex"));
			logger.info("회원가입 진입 전");
	        if(UserService.insertUser(User)==(true)) {
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
	    public String userAccess(Model model, Authentication authentication ,  HttpSession Session) {
	        //Authentication 객체를 통해 유저 정보를 가져올 수 있다.
		 UserDetails LoginUser = (UserDetails) authentication.getPrincipal();  //userDetail 객체를 가져옴
	        model.addAttribute("info", LoginUser.getUsername() +"의 "+ LoginUser.getUsername()+ "님");      //유저 아이디
	        logger.info(LoginUser.getUsername()+" 접속");
	        Session.setAttribute("id",LoginUser.getUsername());
	        return "redirect:mychatt";
	    }
	@RequestMapping(value = "/access_denied", method = RequestMethod.GET)
	public String access_denied() {
		logger.info("access_denied");		
		return "access_denied";
	}
	
	@RequestMapping(value = "/checkid", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> checkid(@RequestParam(value ="userid")String userid) throws Exception {
		logger.info("아이디 체크");		
		
		 int count ;
	        Map<Object, Object> map = new HashMap<Object, Object>();
	 
	        count = UserService.checkid(userid);
	        
	        map.put("count", count);
	 
	        return map;
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
	
		return "user/index";
	}
}
