package com.example.toy.jpa;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.toy.jpa.entity.Channel_Info;

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
    /**
     * 접속자수 체크 ( 30초 간격 )
     * @param channel
     * @return
     * @throws Exception
     */
    public Channel_Info searchCnt(String channel) throws Exception {
    	Channel_Info Channel_Info= new Channel_Info();   	
    	Channel_Info = ChattingRepository.searchCnt(channel);
		return Channel_Info; 	   	   
     }
    /**
     * 전체 접속자 수   
     * @return
     * @throws Exception
     */
    public int sumCnt() throws Exception { 
    	Channel_Info Channel_Info= new Channel_Info();
    	Channel_Info  = ChattingRepository.sumCnt();
		return Channel_Info.getUser_cnt(); 	   	   
     }
    }