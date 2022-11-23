package com.example.toy.controller;

import com.example.toy.jpa.entity.board.Board;
import com.example.toy.jpa.service.BoardService;
import com.example.toy.service.NaverApiService;
import com.example.toy.vo.board.BoardDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	@GetMapping("/board")
	public String boardView(Model model){
		log.info("게시판");
		List<Board> boardList = boardService.boardView();

		model.addAttribute("boardList" ,boardList);
		return "user/board/board";
	}
	@GetMapping("/boardWrite")
	public String boardWrite(){
		log.info("글쓰기");
		return "user/board/boardWrite";
	}
	@PostMapping("/boardWriteProc")
	public String boardWriteProc(@ModelAttribute BoardDto boardDto , Model model){

		boolean YN = boardService.boardWriteProc(boardDto);
		List<Board> boardList = boardService.boardView();

		model.addAttribute("boardList" ,boardList);
		return "user/board/board";
	}
}
