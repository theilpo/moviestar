package moviestar.theater.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import moviestar.common.dao.AbstractDAO;

@Repository("theaterDAO")
public class TheaterDAO extends AbstractDAO{

	public void insertTheater(Map<String, Object> map) throws Exception{
		insert("theater.insertTheater", map);
	}

	public void insertFile(Map<String, Object> map) throws Exception{
		insert("theater.insertFile", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTheaterList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("theater.selectTheaterList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTheaterDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("theater.selectTheaterDetail", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAllTheaterList() throws Exception{
		return (List<Map<String, Object>>)selectList("theater.selectAllTheaterList");
	}
	
}
