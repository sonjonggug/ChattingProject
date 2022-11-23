package com.example.toy.jpa.entity.board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Entity
public class Reply {

    @Id // 해당 테이블의 PK 필드를 나타낸다.
    @GeneratedValue(strategy = GenerationType.IDENTITY) //
    Long replyId;

    @ManyToOne
    @JoinColumn(name = "board_id")
    Board board;

    @Column(length = 50 , nullable = false)
    String writer;

    @Column(length = 100 , nullable = false)
    String content;

    @Column(length = 50 , nullable = false)
    String regDate;


}
