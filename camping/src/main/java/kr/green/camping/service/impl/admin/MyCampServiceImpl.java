package kr.green.camping.service.impl.admin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.green.camping.dao.admin.AdminMemberMapper;
import kr.green.camping.dao.admin.MyCampMapper;
import kr.green.camping.pagination.Criteria;
import kr.green.camping.service.admin.MyCampService;
import kr.green.camping.vo.admin.AdminJoinVO;
import kr.green.camping.vo.user.CampVO;

@Service("myCampService")
public class MyCampServiceImpl implements MyCampService{

	@Resource(name="myCampMapper")
	private MyCampMapper myCampMapper;
	@Resource(name="adminMemberMapper")
	private AdminMemberMapper adminMemberMapper;
	
	@Override
	public List<CampVO> getMyCampByNo(AdminJoinVO admin,Criteria cri) throws Exception {
		return myCampMapper.getMyCampByNo(admin, cri);
	}
	@Override
	public Integer getMyCampCount(AdminJoinVO admin) throws Exception {
		return myCampMapper.getMyCampCount(admin);
	}
	@Override
	public CampVO getMyCamp(CampVO vo) throws Exception{
		CampVO resultVO = myCampMapper.getMyCamp(vo);
		
		return resultVO;
	}
	@Override
	public void modifyMyCamp(CampVO vo) throws Exception {
		
		myCampMapper.modifyMyCamp(vo);
	}
	/*@Override
	public void writeMyCamp(CampVO vo) throws Exception {
		
		myCampMapper.writeMyCamp(vo);
		
	}*/
	@Override
	public void writeMyCamp(CampVO vo, AdminJoinVO adminJoin) throws Exception {
		
		myCampMapper.writeMyCamp(vo);
		
		adminJoin.setCamp_name(vo.getCamp_name());
		adminJoin.setCamp_no(vo.getNo());
		
		adminMemberMapper.modifyJoin(adminJoin);
		
	}

	
	
}
