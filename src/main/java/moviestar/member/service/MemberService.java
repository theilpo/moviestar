package moviestar.member.service;

import java.util.Map;

public interface MemberService {

	void insertMember(Map<String, Object> map) throws Exception;

	Map<String, Object> getMemgerInfo(Map<String, Object> map) throws Exception;

	void updateMember(Map<String, Object> map) throws Exception;

	void updateMemberPW(Map<String, Object> map) throws Exception;

	void deleteMember(Map<String, Object> map) throws Exception;

	Map<String, Object> getMemberList(Map<String, Object> map) throws Exception;

	void updateMemberGB(Map<String, Object> map) throws Exception;

	int getDuplicatedIdCnt(Map<String, Object> map) throws Exception;

}
