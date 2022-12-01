package com.example.toy.jpa.entity.board;

import com.example.toy.vo.board.BoardDto;
import com.example.toy.vo.board.ReplyDto;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;
import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Entity
public class Reply implements Serializable {

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

    @Column(length = 50 , nullable = false)
    @ColumnDefault("0") //@ColumnDefault사용
    int replyMapping;


    public void replySave(ReplyDto replyDto , Board board) {
        this.board = board;
        this.writer = replyDto.getWriter();
        this.content = replyDto.getContent();
        this.regDate = replyDto.getRegDate();
    }
}
