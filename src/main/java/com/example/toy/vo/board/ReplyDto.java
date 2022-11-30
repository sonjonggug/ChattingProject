package com.example.toy.vo.board;

import com.example.toy.jpa.entity.board.Board;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class ReplyDto {

    Long replyId;
    Long board;
    String writer;
    String content;
    String regDate;


}
