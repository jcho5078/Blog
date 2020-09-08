package com.jcho5078.blog.user;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String id = (String)authentication.getPrincipal();
		String pw = (String)authentication.getCredentials();
		
		CustomUserDetails user = (CustomUserDetails) userDetailsService.loadUserByUsername(id);
		
		System.out.println("ID: "+ user.getUsername());
		System.out.println("Name: "+ user.getName());
		
		System.out.println("row pw: "+pw);
		System.out.println("enc pw: "+user.getPassword());
		
		if(passwordEncoder.matches(pw, user.getPassword())) {
			System.out.println("비밀번호 일치!!!!");
		}else {
			throw new BadCredentialsException("비밀번호 불일치!!!");
		}
		
		if(!user.isEnabled()) {
			throw new BadCredentialsException(id);
		}
		
		//해당유저 권한 부여. UserDetailsService 사용.
		UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(id, pw, user.getAuthorities());
		
		result.setDetails(userDetailsService);
		
		return result;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
}