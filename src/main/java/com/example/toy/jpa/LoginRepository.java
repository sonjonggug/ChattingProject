package com.example.toy.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Repository;

/**
 * 보통 ibatis나 MyBatis 등에서 Dao라고 불리는 DB Layer 접근자입니다.
   JPA에선 Repository라고 부르며 인터페이스로 생성합니다. 인터페이스 생성 후 JpaRepository<Entity 클래스, PK 타입>을 상속하면 기본적인 CRUD 메소드가 자동으로 생성된다.
   @Repository를 추가할 필요 없다.
   Entity 클래스와 기본 Entity Repository는 함께 위치해야 한다.
 */
@Repository
public interface LoginRepository extends JpaRepository <LoginUser, Long>{
//	  Optional<LoginEntity> findByUserId(String USER_ID);
	 	@Nullable
		LoginUser findByUserid(String userid);
	 	
//	 	 @Modifying // select 문이 아님을 나타낸다
//	     @Query("UPDATE user_cnt c SET c.user_cnt = ?1 WHERE p.id = ?2")
//	     int updateTitle(String title, Long id);
	 	
	 	@Modifying // select 문이 아님을 나타낸다
	 	@Query(value = "UPDATE user_cnt cnt set cnt.user_cnt= :cnt" , nativeQuery = true)
	 	void changecnt(@Param("cnt")int cnt) throws Exception;
}