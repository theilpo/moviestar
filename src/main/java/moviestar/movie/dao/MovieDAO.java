package moviestar.movie.dao;

import java.util.List;
import java.util.Map;

import moviestar.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("movieDAO")
public class MovieDAO extends AbstractDAO{

	public void insertMovie(Map<String, Object> map) throws Exception {
		insert("movie.insertMovie", map);
	}

	public void insertFile(Map<String, Object> map) throws Exception {
		insert("movie.insertFile", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMovieList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("movie.selectMovieList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMovieDetail(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("movie.selectMovieDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAllMovieList() throws Exception{ 
		return (List<Map<String, Object>>)selectList("movie.selectAllMovieList");
	}
	
}
