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
	//AuthenticationProvider 인터페이스는 화면에서 입력한 로그인 정보와 DB에서 가져온 사용자의 정보를 비교해주는 인터페이스이다.
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		//전역에 생성된 SecurityContextHolder를 이용해 사용자 정보 가져옴.
		String id = (String)authentication.getPrincipal();
		String pw = (String)authentication.getCredentials();
		
		CustomUserDetails user = (CustomUserDetails) userDetailsService.loadUserByUsername(id);
		
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
