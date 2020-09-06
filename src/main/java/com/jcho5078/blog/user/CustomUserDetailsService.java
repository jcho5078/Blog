package com.jcho5078.blog.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.jcho5078.blog.dao.UserDAO;

public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException, BadCredentialsException {
		
		CustomUserDetails user = userDAO.login(id);
		
		user.setEnabled(userDAO.getEnabled(id).getEnabled());//enabled DB에서 가져옴
		
		if(id == null) {
			throw new UsernameNotFoundException(id);
		}
		
		return user;
	}
	
	//회원가입시 pw 암호화해서 리턴
	public String EncodingPw(String pw) {
		
		String encPassword = passwordEncoder.encode(pw);
		
		System.out.println("회원가입 pw 인코딩: "+ encPassword);
		
		return encPassword;
	}

}