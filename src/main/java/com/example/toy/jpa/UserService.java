package com.example.toy.jpa;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class UserService implements UserDetailsService{
	private final LoginRepository LoginRepository;
    
    @Autowired
    PasswordEncoder passwordEncoder;
    
    
    
    
    
    /**
     * id를 매개변수로 받아서 아이디 조회 아이디 있으면 0 리턴 , 없거나 null 이면 1 리턴
     * @param userid
     * @return LoginController/checkId
     * @throws Exception
     */
    public int checkid(String userid) throws Exception{
    	
        //여기서 받은 유저 패스워드와 비교하여 로그인 인증       
    	System.out.println(userid);
    	
    	try {
    		 LoginUser LoginUser =LoginRepository.findByUserid(userid);
    		  if (LoginUser.getUserid()==null || !LoginUser.getUserid().equals(userid)){
    		      
    	        	 return 1; 
    	        }else {
    	        	return 0;
    	        }   
    	} catch (NullPointerException e) {
    		return 1; 
    	}
    	  	
    }	
    
    
    /**
     * 회원가입 , 비밀번호를 인코딩하여 DB에 저장
     * @param User
     * @return
     * @throws Exception
     */
    public boolean insertUser(LoginUser User){
        LoginUser user = new LoginUser();
        if( User.getUserid()!=null && User.getUser_name()!=null &&
        	User.getUser_pw()!=null && User.getUser_sex()!=null) {
        	
        SimpleDateFormat sDate2 = new SimpleDateFormat("yyyy-MM-dd hh:mm");

        System.out.println(sDate2.format(new Date()));
        
        String password=passwordEncoder.encode(User.getUser_pw());

        user.setUserid(User.getUserid());
        user.setUser_name(User.getUser_name());
        user.setUser_pw(password); 
        user.setJoin_date(sDate2.format(new Date()));
        user.setLogin_date(sDate2.format(new Date()));
        user.setUser_auth("USER");
        user.setUser_sex(User.getUser_sex());
        //DB에 저장
        LoginRepository.save(user); // 기본으로 제공하는 메서드
        
        return true ;
   	 } else {
   		 
   	 }
		return false;
    } 
    
    /**
     * 시큐리티 로그인 인증
     * 시큐리티에서 제공하는 메서드 loadUserByUsername 재정의하여 사용
     * 매개변수로 넘긴 userid값으로 조회한 아이디와 패스워드를 Input 값과 비교 
     */
    @Override
    public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
        //여기서 받은 유저 패스워드와 비교하여 로그인 인증       
        LoginUser LoginUser =LoginRepository.findByUserid(userid);
        if (LoginUser == null){
            throw new UsernameNotFoundException("User not authorized.");
        }
        return User.builder()        		
        		.username(LoginUser.getUserid())
        		.password(LoginUser.getUser_pw())
        		.roles(LoginUser.getUser_auth())        		
        		.build();
    }	
    }
   