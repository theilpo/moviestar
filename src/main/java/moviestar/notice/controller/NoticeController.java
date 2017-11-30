package moviestar.notice.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import moviestar.common.common.ArgumentMap;
import moviestar.notice.service.NoticeService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	//공지사항 등록
	@ResponseBody
	@RequestMapping(value="/notice/insertNotice.do")
	public void insertNotice(ArgumentMap argumentMap) throws Exception {
		noticeService.insertNotice(argumentMap.getMap());
	}
	
	//공지사항 수정
	@ResponseBody
	@RequestMapping(value="/notice/updateNotice.do")
	public void updateNotice(ArgumentMap argumentMap) throws Exception {
		noticeService.updateNotice(argumentMap.getMap());
	}
	
	//공지사항 삭제
	@ResponseBody
	@RequestMapping(value="/notice/deleteNotice.do")
	public void deleteNotice(ArgumentMap argumentMap) throws Exception {
		noticeService.deleteNotice(argumentMap.getMap());
	}
	
	//공지사항 다중 삭제
	@ResponseBody
	@RequestMapping(value="/notice/multiDeleteNotice.do")
	public void multiDeleteNotice(ArgumentMap argumentMap) throws Exception {
		
		String[] IDX = argumentMap.get("CHK_IDX").toString().split(",");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		for(int i=0; i<IDX.length; i++) {
			paramMap.put("IDX", IDX[i]);
			noticeService.deleteNotice(paramMap);
		}
	}
	
	//공지사항 목록 조회
	@RequestMapping(value="/notice/selectNoticeList.do")
	public ModelAndView selectNoticeList(ArgumentMap argumentMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("/client/notice/noticeList");
		Map<String, Object> map = noticeService.getNoticeList(argumentMap.getMap());
		mv.addObject("list", map.get("list"));
		mv.addObject("page", map.get("page"));
		return mv;
	}
	
	//공지사항 상세내역 조회
	@RequestMapping(value="/notice/selectNoticeDetail.do")
	public ModelAndView selectNoticeDetail(ArgumentMap argumentMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("/client/notice/noticeDetail");
		Map<String, Object> map = noticeService.getNoticeDetail(argumentMap.getMap());
		mv.addObject("map", map);
		return mv;
	}
	
}
