package moviestar.comment.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import moviestar.comment.service.CommentService;
import moviestar.common.common.ArgumentMap;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommentController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commentService")
	private CommentService commentService;
	
	//한줄평 등록
	@ResponseBody
	@RequestMapping(value="/comment/insertComment.do")
	public void insertComment(ArgumentMap argumentMap) throws Exception {
		commentService.insertComment(argumentMap.getMap());
	}
	
	//한줄평 목록 조회
	@ResponseBody
	@RequestMapping(value="/comment/selectCommentList.do")
	public Map<String, Object> selectCommentList(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> rMap = commentService.getCommentList(argumentMap.getMap());
		map.put("list", rMap.get("list"));
		map.put("page", rMap.get("page"));
		return map;
	}
	
	//한줄평 중복체크
	@ResponseBody
	@RequestMapping(value="/comment/selectMyCommentCnt.do")
	public Map<String, Object> selectMyCommentCnt(ArgumentMap argumentMap) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int cnt = commentService.getMyCommentCnt(argumentMap.getMap());
		map.put("cnt", cnt);		
		return map;
	}
	
}
