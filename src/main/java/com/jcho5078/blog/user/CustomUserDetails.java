package com.jcho5078.blog.user;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetails implements UserDetails{

	private String id;
	private String pw;
	private String name;
	private String authority;
	private boolean enabled;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(authority));
		
		return authorities;
	}

	@Override
	public String getPassword() {
		
		return pw;
	}

	@Override
	public String getUsername() {
		
		return id;
	}

	@Override
	public boolean isAccountNonExpired() {
		
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		
		return true;
	}

	@Override
	public boolean isEnabled() {//계정이 사용 가능한 계정인지 확인.
		
		return enabled;
	}
	
	public void setEnabled(int enabled) {
		this.enabled = (enabled != 0);
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public void setPassword(String pw) {
		this.pw = pw;
	}

}