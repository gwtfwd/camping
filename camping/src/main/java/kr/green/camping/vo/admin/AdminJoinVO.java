package kr.green.camping.vo.admin;

public class AdminJoinVO {
	
	// jsp의 name의 이름과 같아야 함
	
	private String adminId;
	private String adminName;
	private String adminPw;
	private String adminPhone;
	private String adminEmail;
	private String admin;
	private String camp_name;
	private Integer camp_no;
	
	
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	public String getAdminPhone() {
		return adminPhone;
	}
	public void setAdminPhone(String adminPhone) {
		this.adminPhone = adminPhone;
	}
	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getCamp_name() {
		return camp_name;
	}
	public void setCamp_name(String camp_name) {
		this.camp_name = camp_name;
	}
	public Integer getCamp_no() {
		return camp_no;
	}
	public void setCamp_no(Integer camp_no) {
		this.camp_no = camp_no;
	}
	
	
	

}
