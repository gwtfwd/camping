package kr.green.camping.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.BookingVO;
import kr.green.camping.vo.user.CampVO;
import kr.green.camping.vo.user.JoinVO;

public interface BookingMapper {

	public void bookingInsert(BookingVO vo) throws Exception;
	public List<BookingVO> getBookingByNo(@Param("user") JoinVO user,@Param("cri")Criteria cri) throws Exception;
	public Integer getBookingCount(@Param("user") JoinVO user) throws Exception;
	public BookingVO getBooking(BookingVO vo) throws Exception;
	public CampVO getBookingByCampNo(Integer camp_no) throws Exception;
	
	
	
	
	
	
}
