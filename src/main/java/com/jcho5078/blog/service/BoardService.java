package com.jcho5078.blog.service;

import java.util.List;

import com.jcho5078.blog.vo.BoardVO;
import com.jcho5078.blog.vo.PageVO;

public interface BoardService {

	//게시판 리스트 출력
	public List<BoardVO> BoardList(PageVO vo);
	//선택한 게시판 내용 출력
	public BoardVO selectBoard(int bdnum);
	//게시글 작성
	public void insertBoard(BoardVO vo);
	//게시글 삭제(유저)
	public void deleteBoardUser(BoardVO vo);
	//게시글 삭제(게스트)
	public void deleteBoard(BoardVO vo);
}
