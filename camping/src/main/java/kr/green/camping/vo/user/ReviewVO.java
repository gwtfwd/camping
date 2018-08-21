package kr.green.camping.vo.user;

import java.util.Date;

public class ReviewVO {

	private Integer no;
	private String subject;
	private String contents;
	private String user_id;
	private String user_name;
	private String filepath;
	private Integer view;
	private Date registered_at;
	private Date updated_at;
	private Integer reply_cnt;
	
	
	
	public Date getRegistered_at() {
		return registered_at;
	}
	public void setRegistered_at(Date registered_at) {
		this.registered_at = registered_at;
	}
	public Date getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}
	public Integer getReply_cnt() {
		return reply_cnt;
	}
	public void setReply_cnt(Integer reply_cnt) {
		this.reply_cnt = reply_cnt;
	}
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Integer getView() {
		return view;
	}
	public void setView(Integer view) {
		this.view = view;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
