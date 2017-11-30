package moviestar.theater.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import moviestar.common.util.FileUtils;
import moviestar.theater.dao.TheaterDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


@Service("theaterService")
public class TheaterServiceImpl implements TheaterService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="theaterDAO")
	private TheaterDAO theaterDAO;
	
	@Resource(name="fileUtils")
    private FileUtils fileUtils;
	
	@Override
	public void insertTheater(Map<String, Object> map, HttpServletRequest request) throws Exception {
		theaterDAO.insertTheater(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
        for(int i=0, size=list.size(); i<size; i++){
        	theaterDAO.insertFile(list.get(i));
        }
	}

	@Override
	public List<Map<String, Object>> getTheaterList(Map<String, Object> map) throws Exception {
		
		//DEFAULT : 서울
		if(map.get("REGION") == null) {	
			map.put("REGION", "서울");
		}
		return theaterDAO.selectTheaterList(map);
	}

	@Override
	public Map<String, Object> getTheaterDetail(Map<String, Object> map) throws Exception {
		return theaterDAO.selectTheaterDetail(map);
	}

	@Override
	public List<Map<String, Object>> getAllTheaterList() throws Exception {
		return theaterDAO.selectAllTheaterList();
	}
	
}
