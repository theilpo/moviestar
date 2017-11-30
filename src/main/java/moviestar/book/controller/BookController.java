package moviestar.book.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import moviestar.book.service.BookService;
import moviestar.common.common.ArgumentMap;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BookController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="bookService")
	private BookService bookService;
	
	//예매하기 화면
	@RequestMapping(value="/book/openBookForm.do")
	public ModelAndView openBookForm(ArgumentMap argumentMap) throws Exception {
		ModelAndView mv = new ModelAndView("/client/book/bookLvl-1");
		return mv;
	}
	
	//좌석선택 화면
	@RequestMapping(value="/book/openBookSeatForm.do")
	public ModelAndView openBookSeatForm(ArgumentMap argumentMap) throws Exception {
		ModelAndView mv = new ModelAndView("/client/book/bookLvl-2");
		List<Map<String, Object>> list = bookService.getSeatList(argumentMap.getMap());
		mv.addObject("list", list);
		return mv;
	}
	
	//결제하기 화면
	@RequestMapping(value="/book/openBookPayForm.do")
	public ModelAndView openBookPayForm(ArgumentMap argumentMap) throws Exception {
		ModelAndView mv = new ModelAndView("/client/book/bookLvl-3");
		mv.addObject("map", argumentMap.getMap());
		return mv;
	}
	
	//결제하기(예매하기)
	@ResponseBody
	@RequestMapping(value="/book/insertBook.do")
	public Map<String, Object> insertBook(ArgumentMap argumentMap) throws Exception {
		bookService.insertBook(argumentMap.getMap());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("BOOK_NO", argumentMap.getMap().get("BOOK_NO"));
		return map;
	}
	
	//결제취소(예매취소)
	@ResponseBody
	@RequestMapping(value="/book/cancleBook.do")
	public void cancleBook(ArgumentMap argumentMap) throws Exception {
		bookService.cancleBook(argumentMap.getMap());
	}
	
	//결제완료 화면
	@RequestMapping(value="/book/openBookCompleteForm.do")
	public ModelAndView openBookCompleteForm(ArgumentMap argumentMap) throws Exception {
		ModelAndView mv = new ModelAndView("/client/book/bookLvl-4");
		Map<String, Object> map = bookService.getBookInfo(argumentMap.getMap());
		mv.addObject("map", map);
		return mv;
	}
}
