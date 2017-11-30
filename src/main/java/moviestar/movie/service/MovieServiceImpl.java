package moviestar.movie.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import moviestar.common.util.FileUtils;
import moviestar.movie.dao.MovieDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("movieService")
public class MovieServiceImpl implements MovieService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="movieDAO")
	private MovieDAO movieDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public void insertMovie(Map<String, Object> map, HttpServletRequest request) throws Exception {
		movieDAO.insertMovie(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++){
			movieDAO.insertFile(list.get(i));
		}
	}

	@Override
	public List<Map<String, Object>> getMovieList(Map<String, Object> map) throws Exception {
		return movieDAO.selectMovieList(map);
	}

	@Override
	public List<Map<String, Object>> getMovieDetail(Map<String, Object> map) throws Exception {
		return movieDAO.selectMovieDetail(map);
	}

	@Override
	public List<Map<String, Object>> getAllMovieList() throws Exception { 
		return movieDAO.selectAllMovieList();
	}
	
}
