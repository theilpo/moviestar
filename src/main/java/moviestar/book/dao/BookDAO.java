package moviestar.book.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import moviestar.common.dao.AbstractDAO;

@Repository("bookDAO")
public class BookDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSeatList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("book.selectSeatList", map);
	}

	public void insertBook(Map<String, Object> map) throws Exception {
		insert("book.insertBook", map);
	}

	public void updateSeat(Map<String, Object> map) throws Exception {
		update("book.updateSeat", map);
	}

	public void cancleBook(Map<String, Object> map) throws Exception {
		update("book.cancleBook", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getBookInfo(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("book.selectBookInfo", map);
	}
}
