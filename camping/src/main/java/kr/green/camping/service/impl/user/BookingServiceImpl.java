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
	public List<BookingVO> getBookingByNo(JoinVO user,Criteria cri) throws Exception {
		return bookingMapper.getBookingByNo(user,cri);
	}
	@Override
	public Integer getBookingCount(JoinVO user) throws Exception {
		return bookingMapper.getBookingCount(user);
	}
	
	public BookingVO getBooking(BookingVO vo) throws Exception{
		BookingVO resultVO = bookingMapper.getBooking(vo);
		
		return resultVO;
	}
	
	public CampVO getBookingByCampNo(Integer camp_no) throws Exception{
		CampVO resultVO = bookingMapper.getBookingByCampNo(camp_no);
		
		return resultVO;
	}
	
}
