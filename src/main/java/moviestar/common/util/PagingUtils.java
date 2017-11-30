package moviestar.common.util;

import java.util.HashMap;
import java.util.Map;

public class PagingUtils {

	
	/**
	 * 페이지 시작 값, 끝 값 setting
	 *
	 * @return Map<String, Object>.
	 */
	public static Map<String, Object> setPageInfo(Map<String, Object> map) {
		
		int pageNo = 1; 
		int countPerPage = 10;
		
		if(map.get("pageNo") != null) {
			pageNo = Integer.parseInt(map.get("pageNo").toString());
		}
		
		if(map.get("countPerPage") != null) {
			countPerPage = Integer.parseInt(map.get("countPerPage").toString());
		}
		
		int first = ((pageNo - 1) * countPerPage) + 1;
		int last  = first + countPerPage - 1;
		
		map.put("first", first);
		map.put("last", last);
		map.put("currentPageNo", pageNo);
		map.put("countPerPage", countPerPage);
				
		return map;
	}
	
	/**
	 * 페이지 정보 return
	 *
	 * @param  totalCount    : 총 데이터 건수
	 *         countPerPage  : 페이지 당 보여줄 건수
	 *         pageNavSize   : 페이지 네비게이션 개수
	 *         currentPageNo : 현재 클릭한 페이지 번호
	 * @return Map<String, Object>.
	 */
	public static Map<String, Object> getPageInfo(int totalCount, int countPerPage, int pageNavSize, int currentPageNo) {
		
		int totalPage;
		
		if (totalCount % countPerPage == 0) {
			totalPage = totalCount / countPerPage;
		}
		totalPage = totalCount / countPerPage + 1;
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		rtnMap.put("currPage", 	  	Integer.valueOf(currentPageNo));
		rtnMap.put("countPerPage", 	Integer.valueOf(countPerPage));
		rtnMap.put("pageNavSize", 	Integer.valueOf(pageNavSize));
		rtnMap.put("totalCount", 	Integer.valueOf(totalCount));
		rtnMap.put("totalPage", 	Integer.valueOf(totalPage));
		
		return rtnMap;
	}

}
