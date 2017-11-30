package moviestar.point.service;

import java.util.Map;

public interface PointService {

	void insertPointByJoin(Map<String, Object> map) throws Exception;
	
	int insertPointByEvent(Map<String, Object> map) throws Exception;

	int getMyPoint(Map<String, Object> map) throws Exception;

}
