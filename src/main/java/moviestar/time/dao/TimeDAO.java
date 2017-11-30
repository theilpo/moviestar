package moviestar.time.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import moviestar.common.dao.AbstractDAO;

@Repository("timeDAO")
public class TimeDAO extends AbstractDAO {

	public void insertTime(Map<String, Object> map) throws Exception{
		insert("time.insertTime", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getTimeList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("time.selectTimeList", map);
	}
	
	public void insertSeat(Map<String, Object> map) throws Exception {
		insert("time.insertSeat", map);
	}
	
}
