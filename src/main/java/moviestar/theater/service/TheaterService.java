package moviestar.theater.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface TheaterService {

	void insertTheater(Map<String, Object> map, HttpServletRequest request) throws Exception;

	List<Map<String, Object>> getTheaterList(Map<String, Object> map) throws Exception;

	Map<String, Object> getTheaterDetail(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> getAllTheaterList() throws Exception;

}
