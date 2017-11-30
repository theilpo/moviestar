package moviestar.hall.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import moviestar.common.dao.AbstractDAO;

@Repository("hallDAO")
public class HallDAO extends AbstractDAO{

	public void insertHall(Map<String, Object> map) throws Exception {
		insert("hall.insertHall", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectHallList(Map<String, Object> map) throws Exception { 
		return (List<Map<String, Object>>)selectList("hall.selectHallList", map);
	}

}
