package moviestar.comment.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import moviestar.comment.dao.CommentDAO;
import moviestar.common.util.PagingUtils;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("commentService")
public class CommentServiceImpl implements CommentService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commentDAO")
	private CommentDAO commentDAO;

	@Override
	public void insertComment(Map<String, Object> map) throws Exception {
		commentDAO.insertComment(map);
	}

	@Override
	public Map<String, Object> getCommentList(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int totalCount = commentDAO.selectCommentListCnt(map);
		
		if(totalCount > 0) {
			PagingUtils.setPageInfo(map);
			List<Map<String, Object>> list = commentDAO.selectCommentList(map);
			resultMap.put("list", list);
			
			int currentPageNo = (Integer)map.get("currentPageNo");
			int countPerPage  = (Integer)map.get("countPerPage");
			
			resultMap.put("page", PagingUtils.getPageInfo(totalCount, countPerPage, 10, currentPageNo));
		}
		return resultMap;
	}

	@Override
	public int getMyCommentCnt(Map<String, Object> map) throws Exception {
		return commentDAO.selectMyCommentCnt(map);
	}
	
	
}
