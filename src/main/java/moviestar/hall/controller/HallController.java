package moviestar.hall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import moviestar.common.common.ArgumentMap;
import moviestar.hall.service.HallService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HallController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="hallService")
	private HallService hallService;
	
	//상영관 저장
	@ResponseBody
	@RequestMapping(value="/hall/insertHall.do")
	public void insertHall(ArgumentMap argumentMap) throws Exception {
		hallService.insertHall(argumentMap.getMap());
	}
	
	//상영관 조회
	@ResponseBody
	@RequestMapping(value="/hall/selectHallList.do")
	public Map<String, Object> selectHallList(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = hallService.getHallList(argumentMap.getMap());
		map.put("list", list);
		return map;
	}
	
}
