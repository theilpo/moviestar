package moviestar.my.service;

import java.util.Map;

public interface MyService {

	Map<String, Object> getMyRequestList(Map<String, Object> map) throws Exception;

	void updateMyRequest(Map<String, Object> map) throws Exception;

	void deleteMyRequest(Map<String, Object> map) throws Exception;

	Map<String, Object> getMyCommentList(Map<String, Object> map) throws Exception;

	Map<String, Object> getMyPointList(Map<String, Object> map) throws Exception;

	Map<String, Object> getMyBookList(Map<String, Object> map) throws Exception;

}
