package moviestar.request.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import moviestar.common.util.PagingUtils;
import moviestar.request.dao.RequestDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("requestService")
public class RequestServiceImpl implements RequestService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="requestDAO")
	private RequestDAO requestDAO;

	@Override
	public void insertRequest(Map<String, Object> map) throws Exception {
		requestDAO.insertRequest(map);
	}

	@Override
	public Map<String, Object> getRequestList(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int totalCount = requestDAO.selectRequestListCnt();
		
		if(totalCount > 0) {
			PagingUtils.setPageInfo(map);
			List<Map<String, Object>> list = requestDAO.selectRequestList(map);
			resultMap.put("list", list);
			
			int currentPageNo = (Integer)map.get("currentPageNo");
			int countPerPage  = (Integer)map.get("countPerPage");
			
			resultMap.put("page", PagingUtils.getPageInfo(totalCount, countPerPage, 10, currentPageNo));
		}
		return resultMap;
	}

	@Override
	public Map<String, Object> getRequestDetail(Map<String, Object> map) throws Exception {
		return requestDAO.selectRequestDetail(map);
	}
	
	@Override
	public Map<String, Object> getAnswerDetail(Map<String, Object> map) throws Exception {		
		return requestDAO.selectAnswerDetail(map);
	}
	
	@Override
	public void insertRequestAnswer(Map<String, Object> map) throws Exception {
		requestDAO.insertRequestAnswer(map);
		requestDAO.updateAnswerGB(map);
	}
	
	
}
