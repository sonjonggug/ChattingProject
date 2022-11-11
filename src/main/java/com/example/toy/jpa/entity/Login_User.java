package com.example.toy.jpa.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.lang.Nullable;

import javax.persistence.*;
import java.util.HashMap;

@DynamicUpdate  // 변경된 필드만 적용
@DynamicInsert  // 같음

@Getter
/*@AllArgsConstructor // 모든 필드를 매개변수로 받는 생성자 Setter 없이 사용할때*/
@NoArgsConstructor  // 해당 클래스의 기본 생성자를 생성해 주는 어노테이션입니다.
/*@IdClass(Login_UserPK.class)   PK 2개 이상 사용할때 사용*/
/**
 * @Entity 테이블과 링크될 클래스 , 기본값으로 클래스의 카멜케이스 이름을 언더 스커어 네이밍(_)으로 테이블 이름을 매칠한다.
 *  Entity 클래스에서는 절대 Setter 메소드를 만들지 않는다.
 */

@Entity
public class Login_User  {

    @Id // 해당 테이블의 PK 필드를 나타낸다.
    @GeneratedValue(strategy = GenerationType.IDENTITY) // PK 생성 규칙 , GenerationType.IDENTITY 옵션을 추가해야만 auto_increment
    @Nullable
    private Long userNum;
    

    @Column(length = 15 , nullable = false , unique = true) // 테이블의 컬럼을 나타내며 굳이 선언하지 않더라고 해당 클래스의 필드는 모두 컬럼이 된다.
    @Nullable
    private String userid;
    
  
    @Column(length = 100, nullable = false)
    @Nullable  
    private String userPw;
    
   
    @Column(length = 5, nullable = false)
    @Nullable  
    private String userName;
    
    
    @Column(length = 10, nullable = false)
    @Nullable  
    private String userAuth;
    
    @Column(length = 1, nullable = false)
    @Nullable  
    private String userSex;
    
   
    @Column(length = 50, nullable = false)
    @Nullable  
    private String loginDate;
    
   
    @Column(length = 50, nullable = false)
    @Nullable  
    private String joinDate;

    public void joinUser(HashMap map) {

        this.userid = (String) map.get("userId");
        this.userPw = (String) map.get("userPw");
        this.userName = (String) map.get("userName");
        this.userAuth = (String) map.get("userAuth");
        this.userSex = (String) map.get("userSex");
        this.loginDate = (String) map.get("loginDate");
        this.joinDate = (String) map.get("joinDate");
    }
    @Builder
	public void updateUser(Long userNum , String userName , String userAuth , String userSex){
        /*this.userid = loginUserDto.getUserid();*/
        this.userNum =  userNum;
        this.userName = userName;
        this.userAuth = userAuth;
        this.userSex = userSex;
    }
      
    /**
     * @Builder 해당 클래스의 빌더 패턴 클래스를 생성 , 생성자 상단에 선언 시 생성자에 포함된 필드만 빌더에 포함    
     */
//	public PostEntity(Long seq, String farm, String servicename, String ip, String port, String username,
//			String password, String hint) {
//		super();
//		this.seq = seq;
//		this.farm = farm;
//		this.servicename = servicename;
//		this.ip = ip;
//		this.port = port;
//		this.username = username;
//		this.password = password;
//		this.hint = hint;
//	}
    
   
}
