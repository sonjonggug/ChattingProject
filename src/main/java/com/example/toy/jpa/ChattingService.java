package com.example.toy.jpa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;

//@RequiredArgsConstructor : final이 붙거나 @NotNull 이 붙은 필드의 생성자를 자동 생성해주는 롬복 어노테이션
@RequiredArgsConstructor    
@Service
public class ChattingService {
	private final ChattingRepository ChattingRepository;
    
    @Autowired
    PasswordEncoder passwordEncoder;
    
    
    /**
     * 접속자 수 업데이트 , update,delete 같은 경우  @Transactional 처리를 해줘야한다
     * @param cnt
     * @param channel
     * @throws Exception
     */    
    @Transactional
   public void updateCnt(int cnt , String channel) throws Exception {
	 
    	ChattingRepository.updateCnt(cnt,channel);
	   	   
   }
    
    public Long searchCnt(String channel) throws Exception {
    	UserCnt UserCnt= new UserCnt();
    	UserCnt = ChattingRepository.searchCnt(channel);
		return UserCnt.getUser_cnt();
  	   	   
     }
    }