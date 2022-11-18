package com.example.toy.jpa;

import com.example.toy.jpa.entity.Channel_Info;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * 보통 ibatis나 MyBatis 등에서 Dao라고 불리는 DB Layer 접근자입니다.
   JPA에선 Repository라고 부르며 인터페이스로 생성합니다. 인터페이스 생성 후 JpaRepository<Entity 클래스, PK 타입>을 상속하면 기본적인 CRUD 메소드가 자동으로 생성된다.
   @Repository를 추가할 필요 없다.
   Entity 클래스와 기본 Entity Repository는 함께 위치해야 한다.
 */
@Repository
public interface ChattingRepository extends JpaRepository <Channel_Info, String>{


	 	@Query(value = "SELECT SUM(user_cnt) user_cnt , channel_name FROM CHANNEL_INFO c", nativeQuery = true)
	 	Channel_Info sumCnt() throws Exception;
}