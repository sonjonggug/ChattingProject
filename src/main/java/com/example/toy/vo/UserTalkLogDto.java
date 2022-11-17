package com.example.toy.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@AllArgsConstructor //생성자 자동완성
@NoArgsConstructor  // 해당 클래스의 기본 생성자를 생성해 주는 어노테이션입니다.

public class UserTalkLogDto {

    private Long userNum;
    private String userid;
    private String userName;
    private String userSex;
    private String send_date;
    private String userMsg;
          

   
}
