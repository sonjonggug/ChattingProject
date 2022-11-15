package com.example.toy.vo;

import lombok.*;
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

public class TalkBotLogDto {
	 /**
	 * @Id  해당 테이블의 PK 필드를 나타낸다.
     * @GeneratedValue PK 생성 규칙 , GenerationType.IDENTITY 옵션을 추가해야만 auto_increment
     * @Column 테이블의 컬럼을 나타내며 굳이 선언하지 않더라고 해당 클래스의 필드는 모두 컬럼이 된다.
     */
    private Long bot_no;
    private int userNum;
    private String userid;
    private String result;
    private int prompt_tokens;
    private int generated_tokens;
    private String send_date;
   
}
