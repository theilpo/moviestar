package moviestar.common.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("commonDAO")
public class CommonDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception{
		 return (Map<String, Object>)selectOne("common.selectFileInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("common.selectMemberInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectLatestNoticeList() throws Exception {
		return (List<Map<String, Object>>)selectList("common.selectLatestNoticeList");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectLatestEventList() throws Exception {
		return (List<Map<String, Object>>)selectList("common.selectLatestEventList");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMovieList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("common.selectMovieList", map);
	}

}
