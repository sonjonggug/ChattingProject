package com.example.toy.jpa;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
@Builder
@Getter
@Setter
@AllArgsConstructor //생성자 자동완성
@NoArgsConstructor  // 해당 클래스의 기본 생성자를 생성해 주는 어노테이션입니다.
/**
 * @Entity 테이블과 링크될 클래스 , 기본값으로 클래스의 카멜케이스 이름을 언더 스커어 네이밍(_)으로 테이블 이름을 매칠한다.
 *  Entity 클래스에서는 절대 Setter 메소드를 만들지 않는다.
 */
@Table(name = "login_user")
@Entity // 기본적으로 클래스명(Camel Case)을 테이블명(Snake Case)으로 매핑합니다.  EX : user_role이라는 테이블은 UserRole이라는 이름
public class LoginUser  {
	 /**
	 * @Id  해당 테이블의 PK 필드를 나타낸다.
     * @GeneratedValue PK 생성 규칙 , GenerationType.IDENTITY 옵션을 추가해야만 auto_increment
     * @Column 테이블의 컬럼을 나타내며 굳이 선언하지 않더라고 해당 클래스의 필드는 모두 컬럼이 된다.
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long user_no;
    
    
    @Column(length = 15 , nullable = false)
    private String userid;
    
  
    @Column(length = 100, nullable = false)
    private String user_pw;
    
   
    @Column(length = 5, nullable = false)
    private String user_name;
    
    
    @Column(length = 10, nullable = false)
    private String user_auth;
    
    @Column(length = 1, nullable = false)
    private String user_sex;
    
   
    @Column(length = 50, nullable = false)
    private String login_date;
    
   
    @Column(length = 50, nullable = false)
    private String join_date;

	
      
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
