package com.jcho5078.blog;

import java.security.Principal;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jcho5078.blog.dao.UserDAO;
import com.jcho5078.blog.service.BoardService;
import com.jcho5078.blog.user.CustomUserDetails;
import com.jcho5078.blog.vo.PageVO;

@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private BoardService boardService;
	
	//메인화면 로그인 네임 및 게시글 리스트 출력
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Principal principal, PageVO vo) {
		
		CustomUserDetails user = null;
		
		if(principal != null) {
			user = userDAO.login(principal.getName());
			model.addAttribute("name", user.getName());
		}
		vo.setStartPage(1);
		vo.setEndPage(10);
		
		model.addAttribute("BoardList", boardService.BoardList(vo));
		
		return "home";
	}
	
}
