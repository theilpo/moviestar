package moviestar.comment.service;

import java.util.Map;

public interface CommentService {

	void insertComment(Map<String, Object> map) throws Exception;

	Map<String, Object> getCommentList(Map<String, Object> map) throws Exception;

	int getMyCommentCnt(Map<String, Object> map) throws Exception;

}
