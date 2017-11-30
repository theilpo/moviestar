package moviestar.event.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import moviestar.common.common.ArgumentMap;
import moviestar.event.service.EventService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EventController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="eventService")
	private EventService eventService;
	
	//이벤트 등록
	@RequestMapping(value="/event/insertEvent.do")
	public ModelAndView insertEvent(ArgumentMap argumentMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/event/selectEventList.do");
		eventService.insertEvent(argumentMap.getMap(), request);
		return mv;
	}
	
	//이벤트 목록 조회
	@RequestMapping(value="/event/selectEventList.do")
	public ModelAndView selectEventList(ArgumentMap argumentMap) throws Exception {
		ModelAndView mv = new ModelAndView("/client/event/eventList");
		List<Map<String, Object>> list = eventService.getEventList();
		mv.addObject("list", list);
		return mv;
	}
	
	//이벤트 상세 조회
	@RequestMapping(value="/event/selectEventDetail.do")
	public ModelAndView selectEventDetail(ArgumentMap argumentMap) throws Exception {
		ModelAndView mv = new ModelAndView("/client/event/eventDetail");
		Map<String, Object> map = eventService.getEventDetail(argumentMap.getMap());
		mv.addObject("map", map);
		return mv;
	}
	
}
