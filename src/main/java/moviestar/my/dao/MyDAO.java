package moviestar.my.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import moviestar.common.dao.AbstractDAO;

@Repository("myDAO")
public class MyDAO extends AbstractDAO{
	
	public int selectMyRequestListCnt(Map<String, Object> map) throws Exception {
		return (Integer)selectOne("my.selectMyRequestListCnt", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyRequestList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("my.selectMyRequestList", map);
	}

	public void updateMyRequest(Map<String, Object> map) throws Exception {
		update("my.updateMyRequest", map);
	}

	public void deleteMyRequest(Map<String, Object> map) throws Exception {
		delete("my.deleteMyRequest", map);
	}
	
	public int selectMyCommentListCnt(Map<String, Object> map) throws Exception {
		return (Integer)selectOne("my.selectMyCommentListCnt", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyCommentList(Map<String, Object> map) throws Exception { 
		return (List<Map<String, Object>>)selectList("my.selectMyCommentList", map);
	}

	public int selectMyPointListCnt(Map<String, Object> map) throws Exception {
		return (Integer)selectOne("my.selectMyPointListCnt", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyPointList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("my.selectMyPointList", map);
	}

	public int selectMyBookListCnt(Map<String, Object> map) throws Exception {
		return (Integer)selectOne("my.selectMyBookListCnt", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyBookList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("my.selectMyBookList", map);
	}
	
}
