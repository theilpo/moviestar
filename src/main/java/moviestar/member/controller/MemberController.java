package moviestar.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import moviestar.common.common.ArgumentMap;
import moviestar.member.service.MemberService;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	//회원가입 화면 이동
	@RequestMapping(value="/member/openMemberForm.do")
    public ModelAndView openMemberForm(ArgumentMap argumentMap) throws Exception{
        
        ModelAndView mv = new ModelAndView("/client/member/memberWrite");
        return mv;
    }
	
	//회원가입
	@RequestMapping(value="/member/insertMember.do")
    public ModelAndView insertMember(ArgumentMap argumentMap, HttpServletResponse response) throws Exception {
        
		ModelAndView mv = new ModelAndView("/client/member/memberWriteOK");
		memberService.insertMember(argumentMap.getMap());
        return mv;
    }
	
	//회원정보수정 화면 이동
	@RequestMapping(value="/member/openMemberUpdateForm.do")
    public ModelAndView openMemberUpdateForm(ArgumentMap argumentMap) throws Exception{
        
        ModelAndView mv = new ModelAndView("/client/member/memberUpdate");
        Map<String, Object> map = memberService.getMemgerInfo(argumentMap.getMap());
        mv.addObject("map", map);
        return mv;
    }
	
	//회원정보수정
	@RequestMapping(value="/member/updateMember.do")
	public ModelAndView updateMember(ArgumentMap argumentMap) throws Exception{
		
		ModelAndView mv = new ModelAndView("/client/member/memberUpdateOK");
		
		memberService.updateMember(argumentMap.getMap());
		return mv;
	}
	
	//비밀번호 변경
	@ResponseBody
	@RequestMapping(value="/member/changePW.do")
	public void changePW(ArgumentMap argumentMap, HttpServletRequest request) throws Exception {
		memberService.updateMemberPW(argumentMap.getMap());
		HttpSession session = request.getSession();
		String password = (String)argumentMap.getMap().get("PASSWORD");
		session.setAttribute("S_PASSWORD", password);
	}
	
	//회원삭제
	@ResponseBody
	@RequestMapping(value="/member/deleteMember.do")
	public void deleteMember(ArgumentMap argumentMap) throws Exception {
		memberService.deleteMember(argumentMap.getMap());
	}
	
	//회원구분 변경(회원 <-> 관리자)
	@ResponseBody
	@RequestMapping(value="/member/updateMemberGB.do")
	public void updateMemberGB(ArgumentMap argumentMap) throws Exception {
		memberService.updateMemberGB(argumentMap.getMap());
	}
	
	//ID 중복체크
	@ResponseBody
	@RequestMapping(value="/member/selectDuplicateIdCnt.do")
	public Map<String, Object> selectDuplicateIdCnt(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int cnt = memberService.getDuplicatedIdCnt(argumentMap.getMap());
		map.put("cnt", cnt);
		return map;
	}
}
