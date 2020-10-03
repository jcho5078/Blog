package com.jcho5078.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jcho5078.blog.dao.BoardDAO;
import com.jcho5078.blog.service.BoardService;
import com.jcho5078.blog.util.FileUtil;
import com.jcho5078.blog.vo.BoardNumVO;
import com.jcho5078.blog.vo.BoardVO;
import com.jcho5078.blog.vo.CommVO;

public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;
	
	@Resource(name="FileUtil")
	private FileUtil fileUtil;//컴포넌트 스캔으로 추가한 FileUtil객체에 접근
	
	@Override
	public List<BoardVO> BoardList(BoardNumVO vo) {
		
		return boardDAO.BoardList(vo);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO selectBoard(int bdnum) {
		
		boardDAO.countView(bdnum);
		return boardDAO.selectBoard(bdnum);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public void insertBoard(BoardVO vo, MultipartHttpServletRequest fileRequest) throws Exception {
		
		boardDAO.insertBoard(vo);
		
		List<Map<String, Object>> list = fileUtil.parseInsertFileInfo(vo, fileRequest);
		
		System.out.println("갈: "+list);
		
		int size = list.size();
		System.out.println("갈: "+size);
		for(int i=0; i<size; i++) {
			System.out.println("갈: "+i);
			System.out.println("응애: "+ list.get(i));
			boardDAO.insertFile(list.get(i));//파일 정보를 Map의 List대로 하나씩 업로드
		}
	}

	@Override
	public void deleteBoardUser(BoardVO vo) {
		
		boardDAO.deleteBoardUser(vo);
	}
	@Override
	public void deleteBoard(BoardVO vo) {
		
		boardDAO.deleteBoard(vo);
	}

	@Override
	public int getCount() {
		
		return boardDAO.getCount();
	}

	@Override
	public List<CommVO> CommList(int bdnum) {
		
		return boardDAO.CommList(bdnum);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public void insertComm(CommVO vo) {
		
		int no = boardDAO.getMaxCommNo(vo.getBdnum()) + 1;
		
		vo.setNo(no);
		
		boardDAO.insertComm(vo);
	}

	@Override
	public int countComm(int bdnum) {
		
		return boardDAO.countComm(bdnum);
	}

	@Override
	public void insertBoardCommCount(int bdnum) {
		
		boardDAO.insertBoardCommCount(bdnum);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public void deleteComm(CommVO vo) {
		
		boardDAO.deleteComm(vo);
		boardDAO.insertBoardCommCountMin(vo.getBdnum());
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public void deleteCommUser(CommVO vo) {
		
		boardDAO.deleteCommUser(vo);
		boardDAO.insertBoardCommCountMin(vo.getBdnum());
	}

	@Override
	public List<Map<String, Object>> viewFile(int bdnum) throws Exception {
		
		return boardDAO.viewFile(bdnum);
	}

	@Override
	public Map<String, Object> downloadFile(Map<String, Object> map) throws Exception {
		
		return boardDAO.downloadFile(map);
	}
}
