package com.jcho5078.blog;

import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jcho5078.blog.dao.BoardDAO;
import com.jcho5078.blog.dao.UserDAO;
import com.jcho5078.blog.service.BoardService;
import com.jcho5078.blog.vo.BoardNumVO;
import com.jcho5078.blog.vo.PageVO;

@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private BoardService boardService;
	
	//메인화면 로그인 네임 및 게시글 리스트 출력
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Principal principal, PageVO pageVO, BoardNumVO boardNumVO) {
		
		if(principal != null) {
			String id = principal.getName();
			
			String name = userDAO.getName(id).getName();
			
			model.addAttribute("name", name);
		}
		pageVO.setCount(boardService.getCount());
		pageVO.setBoardNumVO(boardNumVO);
		
		model.addAttribute("BoardList", boardService.BoardList(boardNumVO));
		model.addAttribute("BoardPage", pageVO);
		
		return "home";
	}
	
}
