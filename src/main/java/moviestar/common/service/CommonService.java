package moviestar.common.service;

import java.util.List;
import java.util.Map;

public interface CommonService {

	Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> getLatestNoticeList() throws Exception;

	List<Map<String, Object>> getLatestEventList() throws Exception;

	List<Map<String, Object>> getMovieList(Map<String, Object> map) throws Exception;
	
}
