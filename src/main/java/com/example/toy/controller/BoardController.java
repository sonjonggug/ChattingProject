package com.example.toy.controller;

import com.example.toy.jpa.entity.board.Board;
import com.example.toy.jpa.entity.board.Reply;
import com.example.toy.jpa.service.BoardService;
import com.example.toy.service.NaverApiService;
import com.example.toy.vo.board.BoardDto;
import com.example.toy.vo.board.ReplyDto;
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
		 Board boardMember = boardService.boardMember(boardDto.getBoardId());
		List<Reply> replyResult = boardService.boardReply(boardDto.getBoardId());
		System.out.println("답변"+replyResult);
		model.addAttribute("boardMember" ,boardMember);
		model.addAttribute("replyResult" ,replyResult);
		return "user/board/boardMember";
	}

	@PostMapping("/boardReply")
	public String boardReply(@ModelAttribute ReplyDto replyDto ,@RequestParam Long boardId , Model model ){

		boolean boardReplySave = boardService.boardReplySave(replyDto,boardId);

		if(boardReplySave == true){
			System.out.println("성공");
		}else{
			System.out.println("실패");
		}

		Board boardMember = boardService.boardMember(boardId);
		List<Reply> replyResult = boardService.boardReply(boardId);
		System.out.println("답변"+replyResult);
		model.addAttribute("boardMember" ,boardMember);
		model.addAttribute("replyResult" ,replyResult);
		return "user/board/boardMember";
	}

	@PostMapping("/boardMemberReply")
	public String boardMemberReply(@ModelAttribute ReplyDto replyDto ,@RequestParam(required = false) Long boardId , Model model ){
		System.out.println(replyDto.getReplyMapping());
		System.out.println(replyDto.getContent());
		System.out.println(replyDto.getWriter());
		System.out.println(boardId);

		Board boardMember = boardService.boardMember(boardId);
		List<Reply> replyResult = boardService.boardReply(boardId);
		System.out.println("답변"+replyResult);
		model.addAttribute("boardMember" ,boardMember);
		model.addAttribute("replyResult" ,replyResult);

		return "redirect:boardMember";
	}
}
