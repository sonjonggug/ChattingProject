package com.example.toy.jpa.entity;

import com.example.toy.vo.TalkBotLogDto;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.lang.Nullable;

import javax.persistence.*;


@Getter
@Setter
@AllArgsConstructor //생성자 자동완성
@NoArgsConstructor  // 해당 클래스의 기본 생성자를 생성해 주는 어노테이션입니다.
/**
 * @Entity 테이블과 링크될 클래스 , 기본값으로 클래스의 카멜케이스 이름을 언더 스커어 네이밍(_)으로 테이블 이름을 매칠한다.
 *  Entity 클래스에서는 절대 Setter 메소드를 만들지 않는다.
 */
@Table(name = "TALK_BOT_LOG")
@Entity // 기본적으로 클래스명(Camel Case)을 테이블명(Snake Case)으로 매핑합니다.  EX : user_role이라는 테이블은 UserRole이라는 이름
public class Talk_Bot_Log  {
	 /**
	 * @Id  해당 테이블의 PK 필드를 나타낸다.
     * @GeneratedValue PK 생성 규칙 , GenerationType.IDENTITY 옵션을 추가해야만 auto_increment
     * @Column 테이블의 컬럼을 나타내며 굳이 선언하지 않더라고 해당 클래스의 필드는 모두 컬럼이 된다.
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Nullable
    private Long botNum;
    
    @Column(length = 20 , nullable = false)
    @Nullable  
    private String userMsg;
    
    @Column(length = 20, nullable = false)
    @Nullable  
    private String userid;
    
    @Column(length = 500, nullable = false)
    @Nullable  
    private String result; 
      
    @Column(length = 5, nullable = false)
    @Nullable  
    private int promptTokens;
    
    @Column(length = 5, nullable = false)
    @Nullable  
    private int generatedTokens;
    
    @Column(length = 50, nullable = false)
    @Nullable  
    private String sendDate;

    @Column(length = 50, nullable = false)
    @Nullable
    private String userSendDate;


    public void logSave(TalkBotLogDto talkBotLogDto) {

        this.userid = talkBotLogDto.getUserid();
        this.result = talkBotLogDto.getResult();
        this.promptTokens = talkBotLogDto.getPromptTokens();
        this.generatedTokens = talkBotLogDto.getGeneratedTokens();
        this.sendDate = talkBotLogDto.getSendDate();
        this.userMsg = talkBotLogDto.getUserMsg();
        this.userSendDate = talkBotLogDto.getUserSendDate();
    }
}
