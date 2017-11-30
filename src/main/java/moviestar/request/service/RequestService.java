package moviestar.request.service;

import java.util.Map;

public interface RequestService {

	void insertRequest(Map<String, Object> map) throws Exception;

	Map<String, Object> getRequestList(Map<String, Object> map) throws Exception;

	Map<String, Object> getRequestDetail(Map<String, Object> map) throws Exception;

	void insertRequestAnswer(Map<String, Object> map) throws Exception;

	Map<String, Object> getAnswerDetail(Map<String, Object> map) throws Exception;

}
