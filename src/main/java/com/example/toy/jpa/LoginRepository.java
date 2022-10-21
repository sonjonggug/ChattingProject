package com.example.toy.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Repository;

import com.example.toy.jpa.entity.Login_User;

/**
 * 보통 ibatis나 MyBatis 등에서 Dao라고 불리는 DB Layer 접근자입니다.
   JPA에선 Repository라고 부르며 인터페이스로 생성합니다. 인터페이스 생성 후 JpaRepository<Entity 클래스, PK 타입>을 상속하면 기본적인 CRUD 메소드가 자동으로 생성된다.
   @Repository를 추가할 필요 없다.
   Entity 클래스와 기본 Entity Repository는 함께 위치해야 한다.
 */
@Repository
public interface LoginRepository extends JpaRepository <Login_User, Long>{
	 
	 	@Nullable
		Login_User findByUserid(String userid);
	 	
	 	@Modifying // select 문이 아님을 나타낸다	 	
	 	@Query(value = "UPDATE LOGIN_USER set LOGIN_DATE = :date WHERE USERID =:userid" , nativeQuery = true)
	 	void updateDate(@Param("date")String date , @Param("userid")String userid) throws Exception;
	
}