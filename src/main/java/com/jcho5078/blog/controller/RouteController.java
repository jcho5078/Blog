package com.jcho5078.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RouteController {
	
	@RequestMapping("generic")
	public String moveGeneric() {
		
		return "generic";
	}
	
	@RequestMapping("gallery")
	public String moveGallery() {
		
		return "gallery";
	}
	
	@RequestMapping("login")
	public String moveLoginForm() {
		
		return "user/loginForm";
	}
	
	@RequestMapping("signUpPage")
	public String moveSignUpPage() {
		
		return "user/signUp";
	}
	
	@RequestMapping("404")
	public String moveError404() {
		
		return "error/error404";
	}
	
	@RequestMapping("500")
	public String moveError500() {
		
		return "error/error500";
	}
}
