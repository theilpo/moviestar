package moviestar.common.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import moviestar.common.common.ArgumentMap;
import moviestar.common.service.CommonService;
import moviestar.member.service.MemberService;
import moviestar.notice.service.NoticeService;
import moviestar.request.service.RequestService;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommonController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Value("#{upload['upload.path']}")
	private String filePath;
	
	@Resource(name = "commonService")
	private CommonService commonService;

	@Resource(name = "memberService")
	private MemberService memberService;

	@Resource(name = "noticeService")
	private NoticeService noticeService;

	@Resource(name = "requestService")
	private RequestService requestService;

	// 로그 인터셉트 테스트
	@ResponseBody
	@RequestMapping(value = "/common/logInterceptor.do")
	public void logInterceptor() throws Exception {
		log.debug("log Interceptor test...");
	}
	
	//argumentResolver 테스트(/common/testMapArgumentResolver.do?a=1&b=2)
	@ResponseBody
	@RequestMapping(value="/common/testMapArgumentResolver.do")
	public void testMapArgumentResolver(ArgumentMap argumentMap) throws Exception {	    
	    if(argumentMap.isEmpty() == false){
	        Iterator<Entry<String,Object>> iterator = argumentMap.getMap().entrySet().iterator();
	        Entry<String,Object> entry = null;
	        while(iterator.hasNext()){
	            entry = iterator.next();
	            log.debug("key : "+entry.getKey()+", value : "+entry.getValue());
	        }
	    }
	}
	
	// 메인화면 이동
	@RequestMapping(value = "/")
	public String index() throws Exception {
		return "index";
	}

	// 로그인
	@ResponseBody
	@RequestMapping("/common/login.do")
	public Map<String, Object> login(ArgumentMap argumentMap, HttpSession session) throws Exception {

		String inputID = (String)argumentMap.get("ID");
		String inputPW = (String)argumentMap.get("PASSWORD");
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();

		Map<String, Object> map = commonService.selectMemberInfo(argumentMap.getMap());

		if (map != null && !map.isEmpty()) {
			if (inputID.equals(map.get("ID")) && inputPW.equals(map.get("PASSWORD"))) {
				session.setAttribute("S_ID", map.get("ID"));
				session.setAttribute("S_PASSWORD", map.get("PASSWORD"));
				session.setAttribute("S_NAME_KO", map.get("NAME_KO"));
				session.setAttribute("S_MEM_GB", map.get("MEM_GB"));
			} else {
				rtnMap.put("CODE", "1"); // 비밀번호 틀림
				return rtnMap;
			}
		} else {
			rtnMap.put("CODE", "2"); // 없는계정(ID가 없거나 탈퇴된 ID)
			return rtnMap;
		}
		
		rtnMap.put("CODE", "0"); // 정상 로그인
		return rtnMap;
	}

	// 로그아웃
	@ResponseBody
	@RequestMapping("/common/logout.do")
	public void logout(HttpSession session) throws Exception {
		session.invalidate();
	}

	// 파일정보 조회
	@RequestMapping(value = "/common/downloadFile.do")
	public void downloadFile(ArgumentMap argumentMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = commonService.selectFileInfo(argumentMap.getMap());
		String storedFileName = (String) map.get("STORED_FILE_NAME");
		String originalFileName = (String) map.get("ORIGINAL_FILE_NAME");
		
    	byte fileByte[] = FileUtils.readFileToByteArray(new File(filePath + storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);

		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

	// 관리자 화면 메뉴 분기
	@RequestMapping(value = "/common/admin.do")
	public ModelAndView admin(ArgumentMap argumentMap) throws Exception {

		ModelAndView mv = new ModelAndView("/admin/admin-index");
		String MENU_GB = (String) argumentMap.get("MENU_GB");

		// DEFAULT MENU : 회원관리
		if (MENU_GB == null) {
			MENU_GB = "HR";
		}

		/** 회원 관리 **/
		if (MENU_GB.equals("HR")) { 	// 회원 목록
			Map<String, Object> map = memberService.getMemberList(argumentMap.getMap());
			mv.addObject("list", map.get("list"));
			mv.addObject("page", map.get("page"));
			mv.addObject("contentPage", "member/memberList.jsp");
			mv.addObject("menuIdx", 0);
		}

		/** 고객센터 문의 **/
		else if (MENU_GB.equals("RL")) { 		// 문의 목록
			Map<String, Object> map = requestService.getRequestList(argumentMap.getMap());
			mv.addObject("list", map.get("list"));
			mv.addObject("page", map.get("page"));
			mv.addObject("contentPage", "request/requestList.jsp");
			mv.addObject("menuIdx", 1);
		} 
		else if (MENU_GB.equals("RI")) { 		// 문의 답변작성
			Map<String, Object> map = requestService.getRequestDetail(argumentMap.getMap());
			mv.addObject("map", map);
			mv.addObject("contentPage", "request/requestWrite.jsp");
			mv.addObject("menuIdx", 1);
		} 
		else if (MENU_GB.equals("RS")) { 		// 문의 답변상세
			Map<String, Object> map = requestService.getAnswerDetail(argumentMap.getMap());
			mv.addObject("map", map);
			mv.addObject("contentPage", "request/requestDetail.jsp");
			mv.addObject("menuIdx", 1);
		}

		/** 영화 관리 **/
		else if (MENU_GB.equals("MI")) { 		// 영화 등록
			mv.addObject("contentPage", "movie/movieWrite.jsp");
			mv.addObject("menuIdx", 2);
		}
		else if (MENU_GB.equals("TI")) { 		// 영화관 등록
			mv.addObject("contentPage", "theater/theaterWrite.jsp");
			mv.addObject("menuIdx", 2);
		}
		else if (MENU_GB.equals("HI")) { 		// 상영관 등록
			mv.addObject("contentPage", "hall/hallWrite.jsp");
			mv.addObject("menuIdx", 2);
		}
		else if (MENU_GB.equals("VTI")) { 		// 상영시간 등록
			mv.addObject("contentPage", "time/timeWrite.jsp");
			mv.addObject("menuIdx", 2);
		}

		/** 이벤트 관리 **/
		else if (MENU_GB.equals("EI")) { 		// 이벤트 등록
			mv.addObject("contentPage", "event/eventWrite.jsp");
			mv.addObject("menuIdx", 3);
		}

		/** 공지사항 **/
		else if (MENU_GB.equals("NI")) { 		// 공지사항 등록
			mv.addObject("contentPage", "notice/noticeWrite.jsp");
			mv.addObject("menuIdx", 4);
		} 
		else if (MENU_GB.equals("NL")) { 		// 공지사항 목록
			Map<String, Object> map = noticeService.getNoticeList(argumentMap.getMap());
			mv.addObject("list", map.get("list"));
			mv.addObject("page", map.get("page"));
			mv.addObject("contentPage", "notice/noticeList.jsp");
			mv.addObject("menuIdx", 4);
		} 
		else if (MENU_GB.equals("NS")) { 		// 공지사항 상세
			Map<String, Object> map = noticeService.getNoticeDetail(argumentMap.getMap());
			mv.addObject("map", map);
			mv.addObject("contentPage", "notice/noticeDetail.jsp");
			mv.addObject("menuIdx", 4);
		} 
		else if (MENU_GB.equals("NU")) { 		// 공지사항 수정
			Map<String, Object> map = noticeService.getNoticeDetail(argumentMap.getMap());
			mv.addObject("map", map);
			mv.addObject("contentPage", "notice/noticeUpdate.jsp");
			mv.addObject("menuIdx", 4);
		}
		return mv;
	}

	// 메인 - 최신 공지조회
	@ResponseBody
	@RequestMapping(value = "/common/selectLatestNoticeList.do")
	public Map<String, Object> selectLatestNoticeList(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = commonService.getLatestNoticeList();
		map.put("list", list);
		return map;
	}

	// 메인 - 최신 이벤트 조회
	@ResponseBody
	@RequestMapping(value = "/common/selectLatestEventList.do")
	public Map<String, Object> selectLatestEventList(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = commonService.getLatestEventList();
		map.put("list", list);
		return map;
	}

	// 메인 - 최신개봉작, 상영예정작 조회
	@ResponseBody
	@RequestMapping(value = "/common/selectMovieList.do")
	public Map<String, Object> selectMovieList(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = commonService.getMovieList(argumentMap.getMap());
		map.put("list", list);
		return map;
	}
}
