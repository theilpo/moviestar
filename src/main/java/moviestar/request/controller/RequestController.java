package moviestar.request.controller;

import javax.annotation.Resource;

import moviestar.common.common.ArgumentMap;
import moviestar.request.service.RequestService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RequestController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="requestService")
	private RequestService requestService;
	
	//고객센터 문의화면 이동
	@RequestMapping(value="/request/openRequestForm.do")
	public ModelAndView openRequestForm(ArgumentMap argumentMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("/client/request/requestWrite");
		return mv;
	}
	
	//문의내역 저장
	@RequestMapping(value="/request/insertRequest.do")
	public ModelAndView insertRequest(ArgumentMap argumentMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("/client/request/requestWriteOK");
		requestService.insertRequest(argumentMap.getMap());
		return mv;
	}
	
	//문의내역 답변
	@ResponseBody
	@RequestMapping(value="/request/insertRequestAnswer.do")
	public void insertRequestAnswer(ArgumentMap argumentMap) throws Exception {
		requestService.insertRequestAnswer(argumentMap.getMap());
	}
	
}
