package com.example.toy.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * 보통 ibatis나 MyBatis 등에서 Dao라고 불리는 DB Layer 접근자입니다.
   JPA에선 Repository라고 부르며 인터페이스로 생성합니다. 인터페이스 생성 후 JpaRepository<Entity 클래스, PK 타입>을 상속하면 기본적인 CRUD 메소드가 자동으로 생성된다.
   @Repository를 추가할 필요 없다.
   Entity 클래스와 기본 Entity Repository는 함께 위치해야 한다.
 */
@Repository
public interface ChattingRepository extends JpaRepository <channel_info, Long>{
 	
	 	@Modifying // select 문이 아님을 나타낸다	 	
	 	@Query(value = "UPDATE channel_info set user_cnt= :cnt WHERE channel_name=:channel" , nativeQuery = true)
	 	void updateCnt(@Param("cnt")int cnt , @Param("channel")String channel) throws Exception;
	 	

	 	@Query(value = "SELECT * FROM channel_info c WHERE c.channel_name=:channel", nativeQuery = true)
	 	channel_info searchCnt(@Param("channel")String channel) throws Exception;
}