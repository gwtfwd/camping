package kr.green.camping.service.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.admin.AdminJoinVO;
import kr.green.camping.vo.user.BookingVO;

@Service
public interface AdminBookingService {

	public List<BookingVO> getBookingById(AdminJoinVO admin,Criteria cri) throws Exception;
	public Integer getBookingCount(AdminJoinVO admin) throws Exception;
	public boolean setBooking(Integer no, String book_status)throws Exception;
	public boolean setCancel(Integer no, String can_status)throws Exception;
}
