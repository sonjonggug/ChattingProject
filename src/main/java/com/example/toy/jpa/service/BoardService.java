package com.example.toy.jpa.service;

import com.example.toy.jpa.entity.Login_User;
import com.example.toy.jpa.entity.board.Board;
import com.example.toy.jpa.entity.board.Reply;
import com.example.toy.jpa.repository.board.BoardRepository;
import com.example.toy.jpa.repository.LoginRepository;
import com.example.toy.jpa.repository.board.ReplyRepository;
import com.example.toy.vo.board.BoardDto;
import com.example.toy.vo.board.ReplyDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Slf4j // 로깅에 대한 추상 레이어를 제공하는 인터페이스의 모음.
@RequiredArgsConstructor
@Service
public class BoardService{

    private final BoardRepository boardRepository;
    private final LoginRepository loginRepository;

    private final ReplyRepository replyRepository;


    @Transactional
    public boolean boardWriteProc(BoardDto boardDto){
        SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        String Date = today.format(new Date());
        boardDto.setRegDate(Date);
        boardDto.setUpdateDate(Date);
        boardDto.setDeleteDate(Date);

        Login_User user = loginRepository.findByUserid(boardDto.getWriter()).get(); // 값 받아서 board에 저장

        Board board = new Board();
        board.boardProc(boardDto , user); // Writer가 Login_user FK라 저장

        log.info("게시판 글 등록" + boardRepository.save(board).getWriter());

        return true;
    }

    @Transactional(readOnly = true)
    public Page<Board> boardView(PageRequest pageable){
        return boardRepository.findAll(pageable);
    }
    @Transactional(readOnly = true)
    public Board boardMember(Long boardId){

        return boardRepository.findById(boardId).get();
    }

    @Transactional(readOnly = true)
    public List<Reply> boardReply(Long boardId){
        List<Reply> Result = new ArrayList<>();

        Result = replyRepository.findAllByBoard_BoardId(boardId);

        return Result;
    }

    @Transactional(readOnly = true)
    public int boardCount(){

        return Math.toIntExact(boardRepository.countAllBy());
    }

    @Transactional
    public Boolean boardReplySave(ReplyDto replyDto , Long boardId){
        SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        String Date = today.format(new Date());
        replyDto.setRegDate(Date);

        Board board = boardRepository.findById(boardId).get();

        Reply reply = new Reply();
        reply.replySave(replyDto,board);
        replyRepository.save(reply).getReplyId();
        return true;
    }
    }
