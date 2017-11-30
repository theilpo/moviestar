package moviestar.point.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import moviestar.common.common.ArgumentMap;
import moviestar.point.service.PointService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PointController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="pointService")
	private PointService pointService;
	
	//포인트 내역 추가(이벤트)
	@ResponseBody
	@RequestMapping(value="/point/insertPointByEvent.do")
	public Map<String, Object> insertPointByEvent(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int cnt = pointService.insertPointByEvent(argumentMap.getMap());
		map.put("cnt", cnt);	
		return map;
	}
	
	//나의 가용 포인트 조회
	@ResponseBody
	@RequestMapping(value="/point/selectMyPoint")
	public Map<String, Object> selectMyPoint(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int point = pointService.getMyPoint(argumentMap.getMap());
		map.put("point", point);	
		return map;
	}
	
}
