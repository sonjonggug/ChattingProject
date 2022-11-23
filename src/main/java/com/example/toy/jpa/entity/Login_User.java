package com.example.toy.jpa.entity;

import com.example.toy.vo.LoginUserDto;
import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.lang.Nullable;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashMap;


@Setter
@Getter
@AllArgsConstructor // 모든 필드를 매개변수로 받는 생성자 Setter 없이 사용할때
@NoArgsConstructor // 해당 클래스의 기본 생성자를 생성해 주는 어노테이션입니다.  PROCTECTED 로 설정하면 아무런 값도 갖지 않는 의미 없는 객체의 생성을 막게 됩니다.
/*@IdClass(Login_UserPK.class)   PK 2개 이상 사용할때 사용*/
/**
 * @Entity 테이블과 링크될 클래스 , 기본값으로 클래스의 카멜케이스 이름을 언더 스커어 네이밍(_)으로 테이블 이름을 매칠한다.
 *  Entity 클래스에서는 절대 Setter 메소드를 만들지 않는다.
 */

@Entity
public class Login_User implements Serializable {

    @Id // 해당 테이블의 PK 필드를 나타낸다.
    @GeneratedValue(strategy = GenerationType.IDENTITY) // PK 생성 규칙 , GenerationType.IDENTITY 옵션을 추가해야만 auto_increment
    @Nullable
    private Long userNum;


    @Column(length = 15 , nullable = false , name = "userid") // 테이블의 컬럼을 나타내며 굳이 선언하지 않더라고 해당 클래스의 필드는 모두 컬럼이 된다.
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

    public void joinUser(LoginUserDto loginUser) {

        this.userid = loginUser.getUserid();
        this.userPw = loginUser.getUserPw();
        this.userName = loginUser.getUserName();
        this.userAuth = loginUser.getUserAuth();
        this.userSex = loginUser.getUserSex();
        this.loginDate = loginUser.getLoginDate();
        this.joinDate = loginUser.getJoinDate();
    }
    @Builder
	public void updateUser(Long userNum ,String userid ,String userName , String userAuth , String userSex , String loginDate , String joinDate){
        this.userid = userid;
        this.userNum =  userNum;
        this.userName = userName;
        this.userAuth = userAuth;
        this.userSex = userSex;
        this.loginDate = loginDate;
        this.joinDate = joinDate ;
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
