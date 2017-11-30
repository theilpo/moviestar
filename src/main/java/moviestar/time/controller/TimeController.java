package moviestar.time.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import moviestar.common.common.ArgumentMap;
import moviestar.time.service.TimeService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TimeController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="timeService")
	private TimeService timeService;
	
	//상영시간 등록
	@ResponseBody
	@RequestMapping(value="/time/insertTime.do")
	public void insertTime(ArgumentMap argumentMap) throws Exception {
		timeService.insertTime(argumentMap.getMap());
	}
	
	//상영시간 조회
	@ResponseBody
	@RequestMapping(value="/time/selectTimeList.do")
	public Map<String, Object> selectTimeList(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = timeService.getTimeList(argumentMap.getMap());
		map.put("list", list);
		return map;
	}
	
}
