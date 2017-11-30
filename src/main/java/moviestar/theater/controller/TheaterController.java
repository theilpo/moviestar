package moviestar.theater.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import moviestar.common.common.ArgumentMap;
import moviestar.theater.service.TheaterService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TheaterController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="theaterService")
	private TheaterService theaterService;
	
	//영화관 등록
	@RequestMapping(value="/theater/insertTheater.do")
	public ModelAndView insertTheater(ArgumentMap argumentMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/theater/openTheaterList.do");
		theaterService.insertTheater(argumentMap.getMap(), request);
		return mv;
	}
	
	//영화관 목록화면 - default : 서울
	@RequestMapping(value="/theater/openTheaterList.do")
	public ModelAndView openTheaterList(ArgumentMap argumentMap) throws Exception {
		ModelAndView mv = new ModelAndView("/client/theater/theaterList");
		List<Map<String, Object>> list = theaterService.getTheaterList(argumentMap.getMap());
		mv.addObject("list", list);
		return mv;
	}
	
	//지역별 영화관 목록조회
	@ResponseBody
	@RequestMapping(value="/theater/selectTheaterList.do")
	public Map<String, Object> selectTheaterList(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = theaterService.getTheaterList(argumentMap.getMap());
		map.put("list", list);
		return map;
	}
	
	//영화관 상세조회
	@RequestMapping(value="/theater/selectTheaterDetail.do")
	public ModelAndView selectTheaterDetail(ArgumentMap argumentMap) throws Exception {
		ModelAndView mv = new ModelAndView("/client/theater/theaterDetail");
		Map<String, Object> map = theaterService.getTheaterDetail(argumentMap.getMap());
		mv.addObject("map", map);
		return mv;
	}
	
	//ADMIN - 영화관 목록조회
	@ResponseBody
	@RequestMapping(value="/theater/selectAllTheaterList.do")
	public Map<String, Object> selectAllTheaterList(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = theaterService.getAllTheaterList();
		map.put("list", list);
		return map;
	}
}
