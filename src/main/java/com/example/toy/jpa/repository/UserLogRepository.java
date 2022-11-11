package com.example.toy.jpa.repository;

import com.example.toy.jpa.entity.User_Talk_Log;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * 보통 ibatis나 MyBatis 등에서 Dao라고 불리는 DB Layer 접근자입니다.
   JPA에선 Repository라고 부르며 인터페이스로 생성합니다. 인터페이스 생성 후 JpaRepository<Entity 클래스, PK 타입>을 상속하면 기본적인 CRUD 메소드가 자동으로 생성된다.
   @Repository를 추가할 필요 없다.
   Entity 클래스와 기본 Entity Repository는 함께 위치해야 한다.
 */
@Repository
public interface UserLogRepository extends JpaRepository <User_Talk_Log, Long>{



     



}