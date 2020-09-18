package com.jcho5078.blog.vo;

public class BoardNumVO {

	private int page;
	private int maxNum;
	private int startNum;
	private int endNum;
	
	public BoardNumVO() {
		this.page = 1;
		this.maxNum = 8;
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <= 0) {
			page = 1;
		}
		this.page = page;
	}

	public int getMaxNum() {
		return maxNum;
	}

	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}

	public int getStartNum() {
		startNum = ((page - 1) * maxNum) + 1;
		
		return startNum;
	}

	public int getEndNum() {
		endNum = startNum + maxNum - 1;
		
		return endNum;
	}

}
