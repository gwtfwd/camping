package kr.green.camping.service.impl.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.green.camping.dao.user.BookingMapper;
import kr.green.camping.pagination.Criteria;
import kr.green.camping.service.user.BookingService;
import kr.green.camping.vo.user.BookingVO;
import kr.green.camping.vo.user.CampVO;
import kr.green.camping.vo.user.JoinVO;

@Service("bookingService")
public class BookingServiceImpl implements BookingService{

	@Resource(name="bookingMapper")
	private BookingMapper bookingMapper;
	
	
	@Override
	public void bookingInsert(BookingVO vo) throws Exception{
		bookingMapper.bookingInsert(vo);
	}
	
	@Override
	public List<BookingVO> getBookingById(JoinVO user,Criteria cri) throws Exception {
		return bookingMapper.getBookingById(user,cri);
	}
	@Override
	public Integer getBookingCount(JoinVO user) throws Exception {
		return bookingMapper.getBookingCount(user);
	}
	@Override
	public BookingVO getBooking(BookingVO vo) throws Exception{
		BookingVO resultVO = bookingMapper.getBooking(vo);
		
		return resultVO;
	}
	@Override
	public CampVO getCampByCampNo(Integer camp_no) throws Exception{
		CampVO resultVO = bookingMapper.getCampByCampNo(camp_no);
		
		return resultVO;
	}
	@Override
	public void modifyBooking(BookingVO vo) throws Exception {
		
		bookingMapper.modifyBooking(vo);
	}
	
	/*예약취소*/
	@Override
	public boolean setCancel(BookingVO vo) throws Exception {
			
		BookingVO booking = bookingMapper.getBooking(vo);
		
		if(booking != null) {
			booking.setBook_status(null);
			booking.setCan_status("취소대기");
			bookingMapper.modifyBooking(booking);
			return true;
		}
		return false;
	}
	
	
	
}
