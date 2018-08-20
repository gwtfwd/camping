package kr.green.camping.vo.user;


public class BookingVO {

	private Integer no;
	private String user_name;
	private String user_id;
	private String camp_name;
	private Integer camp_no;
	private String booking_at;
	private Integer people;
	
	
	
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
