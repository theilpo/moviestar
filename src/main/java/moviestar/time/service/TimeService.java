package moviestar.time.service;

import java.util.List;
import java.util.Map;

public interface TimeService {

	void insertTime(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> getTimeList(Map<String, Object> map) throws Exception;

}
