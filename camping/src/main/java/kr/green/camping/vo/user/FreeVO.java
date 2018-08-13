package kr.green.camping.vo.user;

import java.util.Date;

public class FreeVO {

	private Integer no;
	private String name;
	private String subject;
	private String contents;
	private String registered_id;
	private Date registered_at;
	private String updated_id;
	private Date updated_at;
	private Integer view;
	private Integer reply_cnt;
	
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getRegistered_id() {
		return registered_id;
	}
	public void setRegistered_id(String registered_id) {
		this.registered_id = registered_id;
	}
	public Date getRegistered_at() {
		return registered_at;
	}
	public void setRegistered_at(Date registered_at) {
		this.registered_at = registered_at;
	}
	public String getUpdated_id() {
		return updated_id;
	}
	public void setUpdated_id(String updated_id) {
		this.updated_id = updated_id;
	}
	public Date getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}
	public Integer getView() {
		return view;
	}
	public void setView(Integer view) {
		this.view = view;
	}
	
	
	
	
	
}
