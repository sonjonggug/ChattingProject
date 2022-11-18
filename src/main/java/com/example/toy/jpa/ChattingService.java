package com.example.toy.jpa;

import com.example.toy.jpa.entity.Channel_Info;
import com.example.toy.vo.ChannelDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
//@RequiredArgsConstructor : final이 붙거나 @NotNull 이 붙은 필드의 생성자를 자동 생성해주는 롬복 어노테이션
@RequiredArgsConstructor    
@Service
public class ChattingService {
	private final ChattingRepository ChattingRepository;
    
    @Autowired
    PasswordEncoder passwordEncoder;


    /**
     * 채널 유저수 업데이트
     * @param cnt
     * @param channelName
     * @throws Exception
     */
    @Transactional
   public void updateCnt(int cnt , String channelName) throws Exception {
        ChannelDto dto = new ChannelDto();
        Channel_Info channel = new Channel_Info();

        dto.setChannelName(channelName);
        dto.setUserCnt(cnt);

        channel.updateCnt(dto);

        ChattingRepository.save(channel);
        log.info("유저 수 업데이트 : " + channel.getUserCnt());
   } 
    /**
     * 접속자수 체크 ( 30초 간격 )
     * @param channel
     * @return
     * @throws Exception
     */
    public Channel_Info searchCnt(String channelName) throws Exception {

		return ChattingRepository.findById(channelName).get();
     }
    /**
     * 전체 접속자 수   
     * @return
     * @throws Exception
     */
    public int sumCnt() throws Exception { 
    	Channel_Info Channel_Info= new Channel_Info();
    	Channel_Info  = ChattingRepository.sumCnt();
		return Channel_Info.getUserCnt();
     }
    }