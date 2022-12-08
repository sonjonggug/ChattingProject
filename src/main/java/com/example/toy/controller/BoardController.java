package com.example.toy.controller;

import com.example.toy.jpa.entity.board.Board;
import com.example.toy.jpa.entity.board.Reply;
import com.example.toy.jpa.service.BoardService;
import com.example.toy.service.NaverApiService;
import com.example.toy.vo.PageDto;
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

import javax.servlet.http.HttpServletRequest;
import java.awt.print.Pageable;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	@GetMapping("/board")
	public String boardView(HttpServletRequest request , Model model ){
		log.info("게시판");
		// 1. 화면전환 시에 조회하는 페이지번호 and 화면에 그려질 데이터개수 2개를 전달받음
		// 첫 페이지 경우
		int pageNum = 1;
		int pageSize = 10;

		// 페이지번호를 클릭하는 경우
		if(request.getParameter("pageNum") != null && request.getParameter("pageSize") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
		}
		int total = boardService.boardCount(); // 전체게시글수
		System.out.println("total 값   " + total);
		PageDto paging = new PageDto(pageNum, pageSize, total);


		PageRequest pageRequest = PageRequest.of(paging.getPageNum(), paging.getPageSize());
		Page<Board> boardList1 = boardService.boardView(pageRequest);
		List<Board> boardList =boardList1.get().collect(Collectors.toList());
		System.out.println(boardList);

		// 3. 페이지네이션을 화면에 전달
		model.addAttribute("paging" ,paging);
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
		System.out.println(replyDto.getReplyMapping());
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

	/*@PostMapping("/boardMemberReply")
	public String boardMemberReply(@ModelAttribute ReplyDto replyDto ,@RequestParam(required = false) Long boardId , Model model ){
		System.out.println(replyDto.getReplyMapping());
		System.out.println(replyDto.getContent());
		System.out.println(replyDto.getWriter());
		System.out.println(boardId);

		boolean boardReplySave = boardService.boardReplySave(replyDto,boardId);

		Board boardMember = boardService.boardMember(boardId);
		List<Reply> replyResult = boardService.boardReply(boardId);
		System.out.println("답변"+replyResult);
		model.addAttribute("boardMember" ,boardMember);
		model.addAttribute("replyResult" ,replyResult);

		return "user/board/boardMember";
	}*/
}
