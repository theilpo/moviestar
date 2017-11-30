package moviestar.point.service;

import java.util.Map;

import javax.annotation.Resource;

import moviestar.point.dao.PointDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("pointService")
public class PointServiceImpl implements PointService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="pointDAO")
	private PointDAO pointDAO;

	@Override
	public void insertPointByJoin(Map<String, Object> map) throws Exception {
		pointDAO.insertPointByJoin(map);
	}
	
	@Override
	public int insertPointByEvent(Map<String, Object> map) throws Exception {
		int cnt = pointDAO.selectMyEventPointCnt(map);
		
		if(cnt == 0) {
			pointDAO.insertPointByEvent(map);
		}
		return cnt;
	}

	@Override
	public int getMyPoint(Map<String, Object> map) throws Exception { 
		return pointDAO.selectMyPoint(map);
	}

}
