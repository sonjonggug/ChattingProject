package com.example.toy.jpa.service;

import com.example.toy.jpa.entity.Login_User;
import com.example.toy.jpa.entity.board.Board;
import com.example.toy.jpa.repository.BoardRepository;
import com.example.toy.jpa.repository.LoginRepository;
import com.example.toy.vo.board.BoardDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Slf4j // 로깅에 대한 추상 레이어를 제공하는 인터페이스의 모음.
@RequiredArgsConstructor
@Service
public class BoardService{

    private final BoardRepository boardRepository;
    private final LoginRepository loginRepository;
    private final EntityManager em;

    @Transactional
    public boolean boardWriteProc(BoardDto boardDto){
        SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        String Date = today.format(new Date());
        boardDto.setRegDate(Date);
        boardDto.setUpdateDate(Date);
        boardDto.setDeleteDate(Date);

        Login_User user = new Login_User(); // board FK가 Login_User userid 라 객체 생성
        user = loginRepository.findByUserid(boardDto.getWriter()).get(); // 값 받아서 board에 저장

        Board board = new Board();
        board.boardProc(boardDto , user); // Writer가 Login_user FK라 저장

        log.info("게시판 글 등록" + boardRepository.save(board).getWriter());

        return true;
    }
    public List<Board> boardView(){
        return boardRepository.findAll();
    }
    }
