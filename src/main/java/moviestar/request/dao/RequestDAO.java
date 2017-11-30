package moviestar.request.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import moviestar.common.dao.AbstractDAO;

@Repository("requestDAO")
public class RequestDAO extends AbstractDAO{

	public void insertRequest(Map<String, Object> map) throws Exception{
		insert("request.insertRequest", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRequestList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("request.selectRequestList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectRequestDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("request.selectRequestDetail", map);
	}

	public void insertRequestAnswer(Map<String, Object> map) throws Exception{
		insert("request.insertRequestAnswer", map);
	}

	public void updateAnswerGB(Map<String, Object> map) throws Exception{
		update("request.updateAnswerGB", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectAnswerDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("request.selectAnswerDetail", map);
	}

	public int selectRequestListCnt() throws Exception{
		return (Integer)selectOne("request.selectRequestListCnt");
	}
	
}
