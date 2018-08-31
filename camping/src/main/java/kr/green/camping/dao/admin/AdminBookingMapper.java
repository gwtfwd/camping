package kr.green.camping.dao.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.admin.AdminJoinVO;
import kr.green.camping.vo.user.BookingVO;

public interface AdminBookingMapper {

	public List<BookingVO> getBookingById(@Param("admin") AdminJoinVO admin,@Param("cri")Criteria cri) throws Exception;
	public Integer getBookingCount(@Param("admin") AdminJoinVO admin) throws Exception;
	public void updateBooking(BookingVO vo)throws Exception;
	public BookingVO bookingByNo(@Param("no") Integer no)throws Exception;
}
