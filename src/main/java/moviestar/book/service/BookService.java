package moviestar.book.service;

import java.util.List;
import java.util.Map;

public interface BookService {

	List<Map<String, Object>> getSeatList(Map<String, Object> map) throws Exception;

	void insertBook(Map<String, Object> map) throws Exception;

	void cancleBook(Map<String, Object> map) throws Exception;

	Map<String, Object> getBookInfo(Map<String, Object> map) throws Exception;

}
