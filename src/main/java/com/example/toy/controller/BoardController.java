package com.example.toy.controller;

import com.example.toy.jpa.entity.board.Board;
import com.example.toy.jpa.service.BoardService;
import com.example.toy.service.NaverApiService;
import com.example.toy.vo.board.BoardDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.awt.print.Pageable;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	@GetMapping("/board")
	public String boardView(@RequestParam(required = false) Integer page , Model model ){
		log.info("게시판");
		if(page == null || page.equals("")){
			page = 0;
		}
		int pageSize = 10;
		PageRequest pageRequest = PageRequest.of(page, pageSize);
		Page<Board> boardList1 = boardService.boardView(pageRequest);
		List<Board> boardList =boardList1.get().collect(Collectors.toList());
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

		return "redirect:board";
	}
	@GetMapping("/boardMember")
	public String boardMember(@ModelAttribute BoardDto boardDto , Model model ){
		System.out.println("값 넘김 " + boardDto.getBoardId());
		 Board boardMember = boardService.boardMember(boardDto.getBoardId());
		model.addAttribute("boardMember" ,boardMember);
		return "user/board/boardMember";
	}
}
