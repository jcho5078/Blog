package com.jcho5078.blog.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jcho5078.blog.dao.UserDAO;
import com.jcho5078.blog.service.BoardService;
import com.jcho5078.blog.user.CustomUserDetails;
import com.jcho5078.blog.vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private BoardService boardService;
	@Autowired
	private CustomUserDetails user;
	
	//HomeController에 메인화면 게시글 출력란 존재.
	
	//게시글 조회
	@RequestMapping(value="board/readboard", method = RequestMethod.GET)
	public String selectBoard(Model model, BoardVO vo, Principal principal) {
		
		if(principal != null) {//유저가 조회했을 경우
			user = userDAO.login(principal.getName());
			
			String writer = user.getName();
			model.addAttribute("writer", writer);
		}
		model.addAttribute("bdnum", vo.getBdnum());
		model.addAttribute("viewBoard", boardService.selectBoard(vo.getBdnum()));
		
		return "board/boardView";
	}
	
	//게시글 작성
	@RequestMapping(value = "board/insert")
	public String insertBoard(BoardVO vo, Principal principal,
			@RequestParam String title, @RequestParam String content, HttpServletRequest request) {
		
		String am_pw = request.getParameter("am_pw");
		String am_writer = request.getParameter("am_writer");
		String writer = request.getParameter("writer");
		
		if(principal == null) {//비회원 글쓰기
			System.out.println("principle is null!!");
			
			vo.setWriter(am_writer);
			vo.setPw(am_pw);
			vo.setIsuser(0);
		}else {//회원 글쓰기
			
			vo.setIsuser(1);
			vo.setWriter(writer);
			vo.setPw("user");
		}
		
		vo.setTitle(title);
		vo.setContent(content);
		
		boardService.insertBoard(vo);
		
		System.out.println("냥: "+vo.getBdnum());
		
		String url = "redirect:/board/readboard?bdnum="+vo.getBdnum();
		
		return url;
	}
	
	//게시글 삭제(유저)
	@RequestMapping(value = "board/deleteUser", method = RequestMethod.POST)
	public String deleteBoardUser(BoardVO vo) {
		
		boardService.deleteBoardUser(vo);
		
		return "redirect:/";
	}
	
	//게시글 삭제(게스트)
		@RequestMapping(value = "board/delete", method = RequestMethod.POST)
		public String deleteBoard(BoardVO vo) {
			
			boardService.deleteBoard(vo);
			
			return "redirect:/";
		}
}
