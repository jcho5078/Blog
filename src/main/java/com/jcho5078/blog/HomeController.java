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

import com.jcho5078.blog.dao.UserDAO;
import com.jcho5078.blog.service.BoardService;
import com.jcho5078.blog.user.CustomUserDetails;

@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Principal principal) {
		
		CustomUserDetails user = null;
		
		if(principal != null) {
			user = userDAO.login(principal.getName());
			model.addAttribute("name", user.getName());
		}
		
		model.addAttribute("BoardList", boardService.BoardList());
		
		return "home";
	}
	
}
