package moviestar.event.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import moviestar.common.util.FileUtils;
import moviestar.event.dao.EventDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("eventService")
public class EventServicecImpl implements EventService{

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="eventDAO")
	private EventDAO eventDAO;
	
	@Resource(name="fileUtils")
    private FileUtils fileUtils;
	
	@Override
	public void insertEvent(Map<String, Object> map, HttpServletRequest request) throws Exception {
		eventDAO.insertEvent(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
        for(int i=0, size=list.size(); i<size; i++){
        	eventDAO.insertFile(list.get(i));
        }
	}

	@Override
	public List<Map<String, Object>> getEventList() throws Exception {
		return eventDAO.selectEventList();
	}

	@Override
	public Map<String, Object> getEventDetail(Map<String, Object> map) throws Exception {
		return eventDAO.selectEventDetail(map); 
	}
	
	
}
