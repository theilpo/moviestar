package moviestar.hall.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import moviestar.hall.dao.HallDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("hallService")
public class HallServiceImpl implements HallService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="hallDAO")
	private HallDAO	hallDAO;

	@Override
	public void insertHall(Map<String, Object> map) throws Exception {
		hallDAO.insertHall(map);
	}

	@Override
	public List<Map<String, Object>> getHallList(Map<String, Object> map) throws Exception { 
		return hallDAO.selectHallList(map);
	}

}
