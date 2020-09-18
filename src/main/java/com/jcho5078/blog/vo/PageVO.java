package com.jcho5078.blog.vo;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageVO {

	private int page;
	private int startPage;
	private int endPage;
	private int count;
	private boolean nextPage;
	private boolean prevPage;
	private BoardNumVO boardNumVO;
	
	public void setBoardNumVO(BoardNumVO boardNumVO) {
		this.boardNumVO = boardNumVO;
	}
	public BoardNumVO getBoardNumVO() {
		return boardNumVO;
	}
	public boolean isNextPage() {
		return nextPage;
	}
	public void setNextPage(boolean nextPage) {
		this.nextPage = nextPage;
	}
	public boolean isPrevPage() {
		return prevPage;
	}
	public void setPrevPage(boolean prevPage) {
		this.prevPage = prevPage;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {//카운트 설정함과 동시에 페이지 생성
		this.count = count;
		makePage();
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	
	private void makePage() {
		
		if(count > 8) {//게시물 8개마다 페이지 생성
			setStartPage(1);
			setEndPage((int)(Math.ceil((double)count / (double)8)));
		}else {
			setStartPage(1);
			setEndPage(1);
		}
		
		setPrevPage(getPage() > 1 ? true : false);
		setNextPage(getPage() < getEndPage() ? true : false);
		
	}
	
	public String uriMaker(int page) {
		
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance().queryParam("page", page).build();
		
		return uriComponents.toUriString();
	}
}
