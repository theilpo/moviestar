package moviestar.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import moviestar.common.util.PagingUtils;
import moviestar.member.dao.MemberDAO;
import moviestar.point.dao.PointDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	@Resource(name="pointDAO")
	private PointDAO pointDAO;
	
	@Override
	public void insertMember(Map<String, Object> map) throws Exception {
		memberDAO.insertMember(map);
		pointDAO.insertPointByJoin(map);
	}

	@Override
	public Map<String, Object> getMemgerInfo(Map<String, Object> map) throws Exception {
		return memberDAO.getMemberInfo(map);
	}

	@Override
	public void updateMember(Map<String, Object> map) throws Exception {
		memberDAO.updateMember(map);
	}

	@Override
	public void updateMemberPW(Map<String, Object> map) throws Exception {
		memberDAO.updateMemberPW(map);
	}

	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		memberDAO.deleteMember(map);
	}

	@Override
	public Map<String, Object> getMemberList(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int totalCount = memberDAO.getMemberListCnt();
		
		if(totalCount > 0) {
			
			PagingUtils.setPageInfo(map);
			List<Map<String, Object>> list = memberDAO.getMemberList(map);
			resultMap.put("list", list);
			
			int currentPageNo = (Integer)map.get("currentPageNo");
			int countPerPage  = (Integer)map.get("countPerPage");
			
			resultMap.put("page", PagingUtils.getPageInfo(totalCount, countPerPage, 10, currentPageNo));
		}
		
		return resultMap;
	}

	@Override
	public void updateMemberGB(Map<String, Object> map) throws Exception {
		memberDAO.updateMemberGB(map);
	}

	@Override
	public int getDuplicatedIdCnt(Map<String, Object> map) throws Exception {
		return memberDAO.getDuplicatedIdCnt(map);
	}

	
}
