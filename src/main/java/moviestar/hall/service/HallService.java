package moviestar.hall.service;

import java.util.List;
import java.util.Map;

public interface HallService {

	void insertHall(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> getHallList(Map<String, Object> map) throws Exception;

}
