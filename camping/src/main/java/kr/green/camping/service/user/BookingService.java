package kr.green.camping.service.user;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.BookingVO;
import kr.green.camping.vo.user.CampVO;
import kr.green.camping.vo.user.JoinVO;

@Service
public interface BookingService {

	public void bookingInsert(BookingVO vo) throws Exception;
	public List<BookingVO> getBookingById(JoinVO user,Criteria cri) throws Exception;
	public Integer getBookingCount(JoinVO user) throws Exception;
	public BookingVO getBooking(BookingVO vo) throws Exception;
	public CampVO getCampByCampNo(Integer camp_no) throws Exception;
	public void modifyBooking(BookingVO vo) throws Exception;
	
	public boolean setCancel(BookingVO vo) throws Exception;
	
}
