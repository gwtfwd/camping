package kr.green.camping.vo.user;

import java.util.Date;

public class BookingVO {

	private Integer no;
	private String user_name;
	private String user_id;
	private String camp_name;
	private Integer camp_no;
	private String booking_at;
	private Integer people;
	private Date registered_at;
	private Date updated_at;
	private String camp_registered_id;
	private String book_status;
	private String can_status;
	
	
	
	public String getBook_status() {
		return book_status;
	}
	public void setBook_status(String book_status) {
		this.book_status = book_status;
	}
	public String getCan_status() {
		return can_status;
	}
	public void setCan_status(String can_status) {
		this.can_status = can_status;
	}
	public String getCamp_registered_id() {
		return camp_registered_id;
	}
	public void setCamp_registered_id(String camp_registered_id) {
		this.camp_registered_id = camp_registered_id;
	}
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
	public Integer getCamp_no() {
		return camp_no;
	}
	public void setCamp_no(Integer camp_no) {
		this.camp_no = camp_no;
	}
	public String getBooking_at() {
		return booking_at;
	}
	public void setBooking_at(String booking_at) {
		this.booking_at = booking_at;
	}
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCamp_name() {
		return camp_name;
	}
	public void setCamp_name(String camp_name) {
		this.camp_name = camp_name;
	}
	public Integer getPeople() {
		return people;
	}
	public void setPeople(Integer people) {
		this.people = people;
	}
}
