package moviestar.notice.dao;

import java.util.List;
import java.util.Map;

import moviestar.common.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO {

	public void insertNotice(Map<String, Object> map) throws Exception {
		insert("notice.insertNotice", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("notice.selectNoticeList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("notice.selectNoticeDetail", map);
	}

	public void updateNotice(Map<String, Object> map) throws Exception {
		update("notice.updateNotice", map);
	}

	public void deleteNotice(Map<String, Object> map) throws Exception {
		update("notice.deleteNotice", map);
	}

	public void updateHitCount(Map<String, Object> map) throws Exception {
		update("notice.updateHitCount", map);
	}

	public int selectNoticeListCnt() throws Exception {
		return (Integer)selectOne("notice.selectNoticeListCnt");
	}

}
