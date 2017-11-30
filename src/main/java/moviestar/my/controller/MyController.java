package moviestar.my.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import moviestar.common.common.ArgumentMap;
import moviestar.my.service.MyService;
import moviestar.request.service.RequestService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="myService")
	private MyService myService;
	
	@Resource(name="requestService")
	private RequestService requestService;
	
	//마이페이지 화면 이동
	@RequestMapping(value="/my/openMypageForm.do")
    public ModelAndView openMypageForm(ArgumentMap argumentMap) throws Exception{
        
        ModelAndView mv = new ModelAndView("/client/my/mypage");
        return mv;
    }
	
	//나의 포인트 목록 조회
	@ResponseBody
	@RequestMapping(value="/my/selectMyPointList.do")
	public Map<String, Object> selectMyPointList(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> rMap = myService.getMyPointList(argumentMap.getMap());
		map.put("list", rMap.get("list"));
		map.put("page", rMap.get("page"));
		return map;
	}
	
	//나의문의 목록 조회
	@ResponseBody
	@RequestMapping(value="/my/selectMyRequestList.do")
	public Map<String, Object> selectMyRequestList(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> rMap = myService.getMyRequestList(argumentMap.getMap());
		map.put("list", rMap.get("list"));
		map.put("page", rMap.get("page"));
		return map;
	}
	
	//나의문의 상세내용 조회
	@RequestMapping(value="/my/selectMyRequestDetail.do")
	public ModelAndView selectMyRequestDetail(ArgumentMap argumentMap) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		String answerGB = (String)argumentMap.get("ANSWER_GB");
		String view = "";
		
		//답변대기중
		if(answerGB.equals("N")) {	
			view = "/client/request/requestDetail";
			map = requestService.getRequestDetail(argumentMap.getMap());
		}
		//답변완료
		else {	
			view = "/client/request/requestAnswer";
			map = requestService.getAnswerDetail(argumentMap.getMap());
		}

		ModelAndView mv = new ModelAndView(view);
		mv.addObject("map", map);
		return mv;
	}
	
	//나의문의 수정화면 이동
	@RequestMapping(value="/my/openRequestUpdateForm.do")
    public ModelAndView openRequestUpdateForm(ArgumentMap argumentMap) throws Exception{
        
        ModelAndView mv = new ModelAndView("/client/request/requestUpdate");
        Map<String, Object> map = requestService.getRequestDetail(argumentMap.getMap());
        mv.addObject("map", map);
        return mv;
    }
	
	//나의문의 수정
	@ResponseBody
	@RequestMapping(value="/my/updateMyRequest.do")
	public void updateMyRequest(ArgumentMap argumentMap) throws Exception {
		myService.updateMyRequest(argumentMap.getMap());
	}
	
	//나의문의 삭제
	@ResponseBody
	@RequestMapping(value="/my/deleteMyRequest.do")
	public void deleteMyRequest(ArgumentMap argumentMap) throws Exception {
		myService.deleteMyRequest(argumentMap.getMap());
	}
	
	//나의 한줄평 목록조회
	@ResponseBody
	@RequestMapping(value="/my/selectMyCommentList.do")
	public Map<String, Object> selectMyCommentList(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> rMap = myService.getMyCommentList(argumentMap.getMap());
		map.put("list", rMap.get("list"));
		map.put("page", rMap.get("page"));
		return map;
	}
	
	//나의 예매 목록 조회
	@ResponseBody
	@RequestMapping(value="/my/selectMyBookList.do")
	public Map<String, Object> selectMyBookList(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> rMap = myService.getMyBookList(argumentMap.getMap());
		map.put("list", rMap.get("list"));
		map.put("page", rMap.get("page"));
		return map;
	}
}
