package com.example.toy.vo.board;

import com.example.toy.jpa.entity.Login_User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter


public class BoardDto {

    Long boardId;
    String writer;
    String title;
    String content;
    String regDate;
    String updateDate;
    String deleteDate;

}
