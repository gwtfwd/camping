package kr.green.camping.service.impl.admin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.green.camping.dao.admin.AdminBookingMapper;
import kr.green.camping.pagination.Criteria;
import kr.green.camping.service.admin.AdminBookingService;
import kr.green.camping.vo.admin.AdminJoinVO;
import kr.green.camping.vo.user.BookingVO;

@Service("adminBookingService")
public class AdminBookingServiceImpl implements AdminBookingService{

	@Resource(name="adminBookingMapper")
	private AdminBookingMapper adminBookingMapper;
	
	@Override
	public List<BookingVO> getBookingById(AdminJoinVO admin,Criteria cri) throws Exception {
		return adminBookingMapper.getBookingById(admin,cri);
	}
	@Override
	public Integer getBookingCount(AdminJoinVO admin) throws Exception {
		return adminBookingMapper.getBookingCount(admin);
	}
	
	/*예약상태*/
	@Override
	public boolean setBooking(Integer no, String book_status)throws Exception{
			
		BookingVO booking = adminBookingMapper.bookingByNo(no);
		
		if(booking != null) {
			booking.setBook_status(book_status);
			adminBookingMapper.updateBooking(booking);
			return true;
		}
		return false;
	}
	
	// 취소상태
	@Override
	public boolean setCancel(Integer no, String can_status)throws Exception {
			
		BookingVO booking = adminBookingMapper.bookingByNo(no);
		
		if(booking != null) {
			booking.setCan_status(can_status);
			adminBookingMapper.updateBooking(booking);
			return true;
		}
		return false;
	}
	
}
