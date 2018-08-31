package kr.green.camping.vo.user;

import java.util.Date;

public class CampVO {

	private Integer no;						// �Ϸù�ȣ
	private String camp_type_no;			// �߿��� ���� �Ϸù�ȣ
	private String camp_type;			// �߿��� ���� �Ϸù�ȣ
	private String camp_name;				// �߿����
	private String address_road;			// ������ ���θ� �ּ�
	private String address_jibun;			// ������ ���� �ּ�
	private Integer address_code;			// ������ ���� �ּ�
	private String camp_tel;				// �߿��� ��ȭ��ȣ
	private Double latitude;				// ����
	private Double longitude;				// �浵
	private Integer area;					// ��������
	private String man_agency_tel;			// ������� ��ȭ��ȣ
	private String man_agency_name;			// ���������
	private String registered_id;			// �����id
	private String updated_id;				// ������id
	private Date registered_at;				// ����Ͻ�
	private Date updated_at;				// �����Ͻ�
	private String region_code;					// ���ƿ�
	private Integer max_people;
	private Integer parking;
	private String convenience;
	private String safety;
	private String etc;
	private String time;
	private String charge;
	
	
	
	public String getCamp_type() {
		return camp_type;
	}
	public void setCamp_type(String camp_type) {
		this.camp_type = camp_type;
	}
	public Integer getMax_people() {
		return max_people;
	}
	public void setMax_people(Integer max_people) {
		this.max_people = max_people;
	}
	public Integer getParking() {
		return parking;
	}
	public void setParking(Integer parking) {
		this.parking = parking;
	}
	public String getConvenience() {
		return convenience;
	}
	public void setConvenience(String convenience) {
		this.convenience = convenience;
	}
	public String getSafety() {
		return safety;
	}
	public void setSafety(String safety) {
		this.safety = safety;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getCharge() {
		return charge;
	}
	public void setCharge(String charge) {
		this.charge = charge;
	}
	public String getRegion_code() {
		return region_code;
	}
	public void setRegion_code(String region_code) {
		this.region_code = region_code;
	}
	public Integer getAddress_code() {
		return address_code;
	}
	public void setAddress_code(Integer address_code) {
		this.address_code = address_code;
	}
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getCamp_type_no() {
		return camp_type_no;
	}
	public void setCamp_type_no(String camp_type_no) {
		this.camp_type_no = camp_type_no;
	}
	public String getCamp_name() {
		return camp_name;
	}
	public void setCamp_name(String camp_name) {
		this.camp_name = camp_name;
	}
	public String getAddress_road() {
		return address_road;
	}
	public void setAddress_road(String address_road) {
		this.address_road = address_road;
	}
	public String getAddress_jibun() {
		return address_jibun;
	}
	public void setAddress_jibun(String address_jibun) {
		this.address_jibun = address_jibun;
	}
	public String getCamp_tel() {
		return camp_tel;
	}
	public void setCamp_tel(String camp_tel) {
		this.camp_tel = camp_tel;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	public Integer getArea() {
		return area;
	}
	public void setArea(Integer area) {
		this.area = area;
	}
	public String getMan_agency_tel() {
		return man_agency_tel;
	}
	public void setMan_agency_tel(String man_agency_tel) {
		this.man_agency_tel = man_agency_tel;
	}
	public String getMan_agency_name() {
		return man_agency_name;
	}
	public void setMan_agency_name(String man_agency_name) {
		this.man_agency_name = man_agency_name;
	}
	public String getRegistered_id() {
		return registered_id;
	}
	public void setRegistered_id(String registered_id) {
		this.registered_id = registered_id;
	}
	public String getUpdated_id() {
		return updated_id;
	}
	public void setUpdated_id(String updated_id) {
		this.updated_id = updated_id;
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
	
	
}
