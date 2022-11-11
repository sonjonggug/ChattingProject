package com.example.toy.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
/*@IdClass(Login_UserPK.class)   PK 2개 이상 사용할때 사용*/
/**
 * @Entity 테이블과 링크될 클래스 , 기본값으로 클래스의 카멜케이스 이름을 언더 스커어 네이밍(_)으로 테이블 이름을 매칠한다.
 *  Entity 클래스에서는 절대 Setter 메소드를 만들지 않는다.
 */


public class LoginUserDto {

    private Long userNum;

    private String userid;

    private String userPw;

    private String userName;

    private String userAuth;

    private String userSex;

    private String loginDate;

    private String joinDate;

}
