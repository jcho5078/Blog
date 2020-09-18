package com.jcho5078.blog.dao;

import java.util.List;

import com.jcho5078.blog.user.CustomUserDetails;
import com.jcho5078.blog.vo.UserVO;

public interface UserDAO {
	
	//로그인
	public CustomUserDetails login(String id);
	//enable 추출
	public UserVO getEnabled(String id);
	//회원 가입
	public void insertUser(UserVO vo);
	//회원 탈퇴
	public void deleteUser(UserVO vo);
	//회원 정보 수정 폼으로 이동시 데이터 추출
	public UserVO getUserForm(String id);
	//회원 정보 수정 폼으로 이동시 데이터 추출(vo로 리턴)
	public UserVO getUserFormForUserDetail(String id) throws Exception;
	//유저의 개인 정보 수정
	public void updatePrivateUser(UserVO vo);
	//관리자가 선택한 회원 정보 수정.
	public void updateUser(UserVO vo);
	//관리자의 모든 회원 정보 조회
	public List<UserVO> selectUser(UserVO vo);
	//스프링 시큐리티의 principal에서 id를 통해 닉네임 가져오기
	public UserVO getName(String id);
}
