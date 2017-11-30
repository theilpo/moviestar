package moviestar.my.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import moviestar.common.util.PagingUtils;
import moviestar.my.dao.MyDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("myService")
public class MyServiceImpl implements MyService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="myDAO")
	private MyDAO myDAO;

	@Override
	public Map<String, Object> getMyPointList(Map<String, Object> map) throws Exception {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int totalCount = myDAO.selectMyPointListCnt(map);
		
		if(totalCount > 0) {
			PagingUtils.setPageInfo(map);
			List<Map<String, Object>> list = myDAO.selectMyPointList(map);
			resultMap.put("list", list);
			
			int currentPageNo = (Integer)map.get("currentPageNo");
			int countPerPage  = (Integer)map.get("countPerPage");
			
			resultMap.put("page", PagingUtils.getPageInfo(totalCount, countPerPage, 10, currentPageNo));	
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> getMyRequestList(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int totalCount = myDAO.selectMyRequestListCnt(map);
		
		if(totalCount > 0) {
			PagingUtils.setPageInfo(map);
			List<Map<String, Object>> list = myDAO.selectMyRequestList(map);
			resultMap.put("list", list);
			
			int currentPageNo = (Integer)map.get("currentPageNo");
			int countPerPage  = (Integer)map.get("countPerPage");
			
			resultMap.put("page", PagingUtils.getPageInfo(totalCount, countPerPage, 10, currentPageNo));	
		}
		return resultMap;
	}

	@Override
	public void updateMyRequest(Map<String, Object> map) throws Exception {
		myDAO.updateMyRequest(map);
	}

	@Override
	public void deleteMyRequest(Map<String, Object> map) throws Exception {
		myDAO.deleteMyRequest(map);
	}

	@Override
	public Map<String, Object> getMyCommentList(Map<String, Object> map) throws Exception { 
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int totalCount = myDAO.selectMyCommentListCnt(map);
		
		if(totalCount > 0) {
			PagingUtils.setPageInfo(map);
			List<Map<String, Object>> list = myDAO.selectMyCommentList(map);
			resultMap.put("list", list);
			
			int currentPageNo = (Integer)map.get("currentPageNo");
			int countPerPage  = (Integer)map.get("countPerPage");
			
			resultMap.put("page", PagingUtils.getPageInfo(totalCount, countPerPage, 10, currentPageNo));
		}		
		return resultMap; 
	}

	@Override
	public Map<String, Object> getMyBookList(Map<String, Object> map) throws Exception {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int totalCount = myDAO.selectMyBookListCnt(map);
		
		if(totalCount > 0) {
			PagingUtils.setPageInfo(map);
			List<Map<String, Object>> list = myDAO.selectMyBookList(map);
			resultMap.put("list", list);
			
			int currentPageNo = (Integer)map.get("currentPageNo");
			int countPerPage  = (Integer)map.get("countPerPage");
			
			resultMap.put("page", PagingUtils.getPageInfo(totalCount, countPerPage, 10, currentPageNo));
		}		
		return resultMap; 
	}

}
