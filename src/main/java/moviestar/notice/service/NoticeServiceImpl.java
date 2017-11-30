package moviestar.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import moviestar.common.util.PagingUtils;
import moviestar.notice.dao.NoticeDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeDAO")
	private NoticeDAO noticeDAO;

	@Override
	public void insertNotice(Map<String, Object> map) throws Exception {
		noticeDAO.insertNotice(map);
	}

	@Override
	public Map<String, Object> getNoticeList(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int totalCount = noticeDAO.selectNoticeListCnt();
		
		if(totalCount > 0) {

			PagingUtils.setPageInfo(map);
			List<Map<String, Object>> list = noticeDAO.selectNoticeList(map);
			resultMap.put("list", list);
			
			int currentPageNo = (Integer)map.get("currentPageNo");
			int countPerPage  = (Integer)map.get("countPerPage");
			
			resultMap.put("page", PagingUtils.getPageInfo(totalCount, countPerPage, 10, currentPageNo));
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> getNoticeDetail(Map<String, Object> map) throws Exception {
		
		//client가 조회할 경우 조회수 증가 
		if(map.get("HIT_GB").equals("C")) {
			noticeDAO.updateHitCount(map);
		}
		return noticeDAO.selectNoticeDetail(map);
	}

	@Override
	public void updateNotice(Map<String, Object> map) throws Exception {
		noticeDAO.updateNotice(map);
	}

	@Override
	public void deleteNotice(Map<String, Object> map) throws Exception {
		noticeDAO.deleteNotice(map);
	}
	
}
