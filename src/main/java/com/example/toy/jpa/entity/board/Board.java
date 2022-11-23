package com.example.toy.jpa.entity.board;

import com.example.toy.jpa.entity.Login_User;
import com.example.toy.vo.board.BoardDto;
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

public class Board {

    @Id // 해당 테이블의 PK 필드를 나타낸다.
    @GeneratedValue(strategy = GenerationType.IDENTITY) //
    Long boardId;

    @ManyToOne
    @JoinColumn(name = "userid" , referencedColumnName = "userid")
    Login_User writer;

    @Column(length = 50 , nullable = false)
    String title;

    @Column(length = 100 , nullable = false)
    String content;

    @Column(length = 50 , nullable = false)
    String regDate;

    @Column(length = 50 , nullable = false)
    String updateDate;

    @Column(length = 50 , nullable = false)
    String deleteDate;

    public void boardProc(BoardDto boardDto , Login_User loginUser) {
        this.writer = loginUser;
        this.title = boardDto.getTitle();
        this.content = boardDto.getContent();
        this.regDate = boardDto.getRegDate();
        this.updateDate = boardDto.getUpdateDate();
        this.deleteDate = boardDto.getDeleteDate();
    }
}
