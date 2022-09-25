//package com.example.toy.jpa;
//
//import java.text.SimpleDateFormat;
//import java.time.LocalTime;
//import java.time.format.DateTimeFormatter;
//import java.util.Date;
//
//import org.springframework.stereotype.Service;
//
//import lombok.RequiredArgsConstructor;
//
//
//@RequiredArgsConstructor
//@Service
//public class UserService1 {
//    private final LoginRepository LoginRepository;
//    
//    //회원가입
//    public boolean insertUser(User User){
//        User user = new User();
//        if( User.getUSER_ID()!=null && User.getUSER_NAME()!=null &&
//        	User.getUSER_PW()!=null ) {
//        	
//        // 현재 시간
////        LocalTime now = LocalTime.now();
//        // 포맷 정의하기        
////        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-DD a HH:mm:ss");  
//        SimpleDateFormat sDate2 = new SimpleDateFormat("yyyy-MM-dd hh:mm");
//
//        System.out.println(sDate2.format(new Date()));
//        
//        // 포맷 적용하기       
//// 		String formatedNow = now.format(formatter);
////        System.out.println(formatedNow);
//        //pw, salt를 user에 저장
//        user.setUSER_ID(User.getUSER_ID());
//        user.setUSER_NAME(User.getUSER_NAME());
//        user.setUSER_PW(User.getUSER_PW()); 
//        user.setJOIN_DATE(sDate2.format(new Date()));
//        user.setLOGIN_DATE(sDate2.format(new Date()));
//        user.setUSER_AUTH("User");
//        //DB에 저장
//        LoginRepository.save(user);
//        
//        return true ;
//   	 } else {
//   		 
//   	 }
//		return false;
//    } 
//   
//    	
//    }
//   