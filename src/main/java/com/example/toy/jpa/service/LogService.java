package com.example.toy.jpa.service;

import com.example.toy.jpa.entity.Talk_Bot_Log;
import com.example.toy.jpa.entity.User_Talk_Log;
import com.example.toy.jpa.repository.BotRepository;
import com.example.toy.jpa.repository.LoginRepository;
import com.example.toy.jpa.repository.UserLogRepository;
import com.example.toy.vo.TalkBotLogDto;
import com.example.toy.vo.UserTalkLogDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Slf4j
@RequiredArgsConstructor // final이 붙거나 @NotNull 이 붙은 필드의 생성자를 자동 생성해주는 롬복 어노테이션
@Service
public class LogService {
    private final BotRepository botRepository;

    private final UserLogRepository userLogRepository;

    private final LoginRepository loginRepository;






    public  List<Talk_Bot_Log> chattingLog(String userId){

        return botRepository.findByUserid(userId);
    }

    public void userTalkSave(UserTalkLogDto userTalk){
        SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd hh:mm");

        /*Optional<Login_User> result = loginRepository.findByUserid(userTalk.getUserid());*/
        // 메시지 저장하기 위해 먼저 유저 정보 받아오기  id 가 있으면 값 저장
        loginRepository.findByUserid(userTalk.getUserid()).ifPresent(item ->{
            userTalk.setUserid(item.getUserid());
            userTalk.setUserName(item.getUserName());
            userTalk.setUserSex(item.getUserSex());
        });

        User_Talk_Log user_talk_log = new User_Talk_Log(); //

        user_talk_log.logSave(userTalk);  // Entity 객체에 값 저장 후 save

        String saveDate = userLogRepository.save(user_talk_log).getSend_date();

        log.info("유저 메시지 저장 성공 " + saveDate);

    }

    public void talkBotSave(TalkBotLogDto talkBotLogDto){

        SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        String Date = today.format(new Date());
        talkBotLogDto.setSendDate(Date);

        Talk_Bot_Log talk_bot_log = new Talk_Bot_Log();

        talk_bot_log.logSave(talkBotLogDto);

        String saveDate = botRepository.save(talk_bot_log).getSendDate();

        log.info("답변 저장 " + saveDate);
    }

    }
