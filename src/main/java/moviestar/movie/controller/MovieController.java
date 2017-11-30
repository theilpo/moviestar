package moviestar.movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import moviestar.common.common.ArgumentMap;
import moviestar.movie.service.MovieService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MovieController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="movieService")
	private MovieService movieService;
	
	//영화 등록
	@RequestMapping(value="/movie/insertMovie.do")
	public ModelAndView insertMovie(ArgumentMap argumentMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/");
		movieService.insertMovie(argumentMap.getMap(), request);
		return mv;
	}
	
	//영화 목록화면
	@RequestMapping(value="/movie/openMovieList.do")
	public ModelAndView openMovieList(ArgumentMap argumentMap) throws Exception {
		ModelAndView mv = new ModelAndView("/client/movie/movieList");
		List<Map<String, Object>> list = movieService.getMovieList(argumentMap.getMap());
		mv.addObject("list", list);
		return mv;
	}
	
	//최신개봉작, 상영예정작 목록조회
	@ResponseBody
	@RequestMapping(value="/movie/selectMovieList.do")
	public Map<String, Object> selectMovieList(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = movieService.getMovieList(argumentMap.getMap());
		map.put("list", list);		
		return map;
	}
	
	//영화 상세보기
	@RequestMapping(value="/movie/selectMovieDetail.do")
	public ModelAndView selectMovieDetail(ArgumentMap argumentMap) throws Exception {
		ModelAndView mv = new ModelAndView("/client/movie/movieDetail");
		List<Map<String, Object>> list = movieService.getMovieDetail(argumentMap.getMap());
		mv.addObject("list", list);
		return mv;
	}
	
	//ADMIN - 영화 목록조회
	@ResponseBody
	@RequestMapping(value="/movie/selectAllMovieList.do")
	public Map<String, Object> selectAllMovieList(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = movieService.getAllMovieList();
		map.put("list", list);
		return map;
	}
}
