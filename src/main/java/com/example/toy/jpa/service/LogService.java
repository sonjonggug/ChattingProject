package com.example.toy.jpa.service;

import com.example.toy.jpa.entity.Login_User;
import com.example.toy.jpa.entity.Talk_Bot_Log;
import com.example.toy.jpa.repository.BotRepository;
import com.example.toy.jpa.repository.LoginRepository;
import com.example.toy.vo.TalkBotLogDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@RequiredArgsConstructor // final이 붙거나 @NotNull 이 붙은 필드의 생성자를 자동 생성해주는 롬복 어노테이션
@Service
public class LogService {
    private final BotRepository botRepository;

    public void talkBotSave(TalkBotLogDto talkBotLogDto){

        SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        String Date = today.format(new Date());
        talkBotLogDto.setSend_date(Date);

        Talk_Bot_Log talk_bot_log = new Talk_Bot_Log();
        talk_bot_log.logSave(talkBotLogDto);
        botRepository.save(talk_bot_log);

    }

    }
