package moviestar.notice.service;

import java.util.Map;

public interface NoticeService {

	void insertNotice(Map<String, Object> map) throws Exception;

	Map<String, Object> getNoticeList(Map<String, Object> map) throws Exception;

	Map<String, Object> getNoticeDetail(Map<String, Object> map) throws Exception;

	void updateNotice(Map<String, Object> map) throws Exception;

	void deleteNotice(Map<String, Object> map) throws Exception;

}
