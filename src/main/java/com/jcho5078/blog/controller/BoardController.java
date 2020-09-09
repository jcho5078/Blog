package com.jcho5078.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jcho5078.blog.service.BoardService;
import com.jcho5078.blog.vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	//HomeController에 메인화면 게시글 출력란 존재.
	
	//게시글 조회
	@RequestMapping(value="board/readboard", method = RequestMethod.GET)
	public String selectBoard(Model model, BoardVO vo) {
		
		model.addAttribute("viewBoard", boardService.selectBoard(vo.getBdnum()));
		
		return "board/boardView";
	}
}
