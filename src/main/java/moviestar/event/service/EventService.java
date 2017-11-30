package moviestar.event.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface EventService {

	void insertEvent(Map<String, Object> map, HttpServletRequest request) throws Exception;

	List<Map<String, Object>> getEventList() throws Exception;

	Map<String, Object> getEventDetail(Map<String, Object> map) throws Exception;

}
