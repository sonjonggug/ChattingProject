package com.example.toy.jpa;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.toy.jpa.entity.Channel_Info;

/**
 * 보통 ibatis나 MyBatis 등에서 Dao라고 불리는 DB Layer 접근자입니다.
   JPA에선 Repository라고 부르며 인터페이스로 생성합니다. 인터페이스 생성 후 JpaRepository<Entity 클래스, PK 타입>을 상속하면 기본적인 CRUD 메소드가 자동으로 생성된다.
   @Repository를 추가할 필요 없다.
   Entity 클래스와 기본 Entity Repository는 함께 위치해야 한다.
 */
@Repository
public interface ChattingRepository extends JpaRepository <Channel_Info, Long>{
 	
	 	@Modifying // select 문이 아님을 나타낸다	 	
	 	@Query(value = "UPDATE CHANNEL_INFO set user_cnt= :cnt WHERE channel_name=:channel" , nativeQuery = true)
	 	void updateCnt(@Param("cnt")int cnt , @Param("channel")String channel) throws Exception;
	 	

	 	@Query(value = "SELECT * FROM CHANNEL_INFO c WHERE c.channel_name=:channel", nativeQuery = true)
	 	Channel_Info searchCnt(@Param("channel")String channel) throws Exception;
	 	
	 	/**
	 	 * 조회하려는 컬럼보다 엔티티 컬럼이 많을때 No Such Column 에러가 발생한다. 그럴땐 당황하지 말고 
	 	 * 리턴 타입을 List<String> 으로 바꾸면 된다.	 	
	 	 */
//	 	@Query(value = "SELECT SUM(user_cnt) user_cnt FROM CHANNEL_INFO c", nativeQuery = true)
//	 	List<String> sumCnt() throws Exception;
	 	
	 	@Query(value = "SELECT SUM(user_cnt) user_cnt , channel_name FROM CHANNEL_INFO c", nativeQuery = true)
	 	Channel_Info sumCnt() throws Exception;
}