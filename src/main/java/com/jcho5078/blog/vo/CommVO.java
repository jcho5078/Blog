package com.jcho5078.blog.vo;

public class CommVO {
	private int bdnum;
	private String writer;
	private String boardComment;
	private int isUser;
	private int count_comm;
	private int pw;
	private int no;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPw() {
		return pw;
	}
	public void setPw(int pw) {
		this.pw = pw;
	}
	public int getCount_comm() {
		return count_comm;
	}
	public void setCount_comm(int count_comm) {
		this.count_comm = count_comm;
	}
	public int getBdnum() {
		return bdnum;
	}
	public void setBdnum(int bdnum) {
		this.bdnum = bdnum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getBoardComment() {
		return boardComment;
	}
	public void setBoardComment(String boardComment) {
		this.boardComment = boardComment;
	}
	public int getIsUser() {
		return isUser;
	}
	public void setIsUser(int isUser) {
		this.isUser = isUser;
	}
}
