package moviestar.point.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import moviestar.common.dao.AbstractDAO;

@Repository("pointDAO")
public class PointDAO extends AbstractDAO{

	public void insertPointByJoin(Map<String, Object> map) throws Exception {
		insert("point.insertPointByJoin", map);
	}

	public int selectMyEventPointCnt(Map<String, Object> map) throws Exception {
		return (Integer)selectOne("point.selectMyEventPointCnt", map);
	}

	public void insertPointByEvent(Map<String, Object> map) throws Exception {
		insert("point.insertPointByEvent", map);
	}
	
	public void insertPointByBook(Map<String, Object> map) throws Exception {
		insert("point.insertPointByBook", map);
	}

	public Integer selectMyPoint(Map<String, Object> map) throws Exception { 
		return (Integer)selectOne("point.selectMyPoint", map);
	}

	public void insertPointByBookCancle(Map<String, Object> map) throws Exception {
		insert("point.insertPointByBookCancle", map);
	}

}
