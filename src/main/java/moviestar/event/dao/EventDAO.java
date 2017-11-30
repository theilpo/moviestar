package moviestar.event.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import moviestar.common.dao.AbstractDAO;

@Repository("eventDAO")
public class EventDAO extends AbstractDAO {

	public void insertEvent(Map<String, Object> map) throws Exception {
		insert("event.insertEvent", map);
	}

	public void insertFile(Map<String, Object> map) throws Exception {
		insert("event.insertFile", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectEventList() throws Exception {
		return (List<Map<String, Object>>)selectList("event.selectEventList");
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectEventDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("event.selectEventDetail", map);
	}
	
}
