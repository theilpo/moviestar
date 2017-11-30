package moviestar.common.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import moviestar.common.dao.CommonDAO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("commonService")
public class CommonServiceImpl implements CommonService{
	
Logger log = Logger.getLogger(this.getClass());
    
    @Resource(name="commonDAO")
    private CommonDAO commonDAO;

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		 return commonDAO.selectFileInfo(map);
	}

	@Override
	public Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception {
		return commonDAO.selectMemberInfo(map);
	}

	@Override
	public List<Map<String, Object>> getLatestNoticeList() throws Exception {
		return commonDAO.selectLatestNoticeList();
	}

	@Override
	public List<Map<String, Object>> getLatestEventList() throws Exception {
		return commonDAO.selectLatestEventList();
	}

	@Override
	public List<Map<String, Object>> getMovieList(Map<String, Object> map) throws Exception {
		return commonDAO.selectMovieList(map);
	}
	
}
