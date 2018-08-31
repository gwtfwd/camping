package kr.green.camping.vo.user;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ReplyVO {
	
	private Integer bno;					// 게시물번호
	private Integer reno;					// 댓글번호
	private String reid;					// 작성자
	private String recontent;					// 댓글내용
	private Date redate;					// 작성일자
	
	
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public Integer getReno() {
		return reno;
	}
	public void setReno(Integer reno) {
		this.reno = reno;
	}
	public String getReid() {
		return reid;
	}
	public void setReid(String reid) {
		this.reid = reid;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}
	public String getRedate() {
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");	// hh:mm
		return df.format(redate); 
	}
	public void setRedate(Date redate) {
		this.redate = redate;
	}
	
	

}
