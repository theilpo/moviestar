package moviestar.movie.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MovieService {

	void insertMovie(Map<String, Object> map, HttpServletRequest request) throws Exception;

	List<Map<String, Object>> getMovieList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> getMovieDetail(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> getAllMovieList() throws Exception;

}
