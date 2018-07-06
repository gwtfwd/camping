package kr.green.camping.vo.user;

import java.util.Date;

public class NoticeVO {

	private Integer no;				// 일련번호
	private String name;			// 이름
	private String subject;			// 제목
	private String contents;		// 내용
	private Date registered_at;		// 등록일시
	private String  registered_id;	// 등록자id
	private Date updated_at;		// 수정일시
	private String  updated_id;		// 수정자id
	private Integer view;			// 조회수
	
	
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
	public Date getRegistered_at() {
		return registered_at;
	}
	public void setRegistered_at(Date registered_at) {
		this.registered_at = registered_at;
	}
	public String getRegistered_id() {
		return registered_id;
	}
	public void setRegistered_id(String registered_id) {
		this.registered_id = registered_id;
	}
	public Date getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}
	public String getUpdated_id() {
		return updated_id;
	}
	public void setUpdated_id(String updated_id) {
		this.updated_id = updated_id;
	}
	public Integer getView() {
		return view;
	}
	public void setView(Integer view) {
		this.view = view;
	}
	
	
}





