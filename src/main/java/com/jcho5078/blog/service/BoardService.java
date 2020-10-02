package com.jcho5078.blog.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jcho5078.blog.vo.BoardNumVO;
import com.jcho5078.blog.vo.BoardVO;
import com.jcho5078.blog.vo.CommVO;
import com.jcho5078.blog.vo.PageVO;

public interface BoardService {

	//게시판 리스트 출력
	public List<BoardVO> BoardList(BoardNumVO vo);
	//게시글 카운팅
	public int getCount();
	//선택한 게시판 내용 출력
	public BoardVO selectBoard(int bdnum);
	//게시글 작성
	public void insertBoard(BoardVO vo, MultipartHttpServletRequest fileRequest) throws Exception;
	//게시글 삭제(유저)
	public void deleteBoardUser(BoardVO vo);
	//게시글 삭제(게스트)
	public void deleteBoard(BoardVO vo);
	//댓글 리스트 출력
	public List<CommVO> CommList(int bdnum);
	//댓글 카운트
	public int countComm(int bdnum);
	//댓글 작성
	public void insertComm(CommVO vo);
	//게시글 댓글갯수 카운트
	public void insertBoardCommCount(int bdnum);
	//댓글 삭제(게스트)
	public void deleteComm(CommVO vo);
	//댓글 삭제(유저)
	public void deleteCommUser(CommVO vo);
}
