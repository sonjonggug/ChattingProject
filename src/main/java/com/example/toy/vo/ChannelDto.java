package com.example.toy.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor //생성자 자동완성
@NoArgsConstructor  // 해당 클래스의 기본 생성자를 생성해 주는 어노테이션입니다.
/**
 * @Entity 테이블과 링크될 클래스 , 기본값으로 클래스의 카멜케이스 이름을 언더 스커어 네이밍(_)으로 테이블 이름을 매칠한다.
 *  Entity 클래스에서는 절대 Setter 메소드를 만들지 않는다.
 */

public class ChannelDto {


    private String channelName;
    private int userCnt;

    
   
    
   
}
