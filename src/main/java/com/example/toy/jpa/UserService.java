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
    	  	
//        LoginUser LoginUser =LoginRepository.findByUserid(userid);
       
//        if (LoginUser.getUserid().equals(userid)){
//        	System.out.println(LoginUser);
//            return 0;
//        }else {
//        	 return 1; 	
//        }      
    }	
    
    
    //회원가입
    public boolean insertUser(LoginUser User){
        LoginUser user = new LoginUser();
        if( User.getUserid()!=null && User.getUser_name()!=null &&
        	User.getUser_pw()!=null && User.getUser_sex()!=null) {
        	
        // 현재 시간
//        LocalTime now = LocalTime.now();
        // 포맷 정의하기        
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-DD a HH:mm:ss");  
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
        LoginRepository.save(user);
        
        return true ;
   	 } else {
   		 
   	 }
		return false;
    } 
   
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
   