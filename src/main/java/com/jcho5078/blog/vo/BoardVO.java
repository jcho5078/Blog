package com.jcho5078.blog.vo;

public class BoardVO {
	
	private int bdnum;
	private String writer;
	private String pw;
	private String title;
	private String content;
	private String writedate;
	private int isuser; //게스트가 쓴 글인지, 유저가 쓴 글인지 확인용
	private int viewCount;//조회수
	
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getIsuser() {
		return isuser;
	}
	public void setIsuser(int isuser) {
		this.isuser = isuser;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public int getBdnum() {
		return bdnum;
	}
	public void setBdnum(int bdnum) {
		this.bdnum = bdnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
}
