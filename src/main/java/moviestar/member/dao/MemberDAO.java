package moviestar.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import moviestar.common.dao.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO{

	public void insertMember(Map<String, Object> map) throws Exception{
		insert("member.insertMember", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getMemberInfo(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("member.selectMemberInfo", map);
	}

	public void updateMember(Map<String, Object> map) throws Exception{
		update("member.updateMember", map);
	}

	public void updateMemberPW(Map<String, Object> map) throws Exception{
		update("member.updateMemberPW", map);
	}

	public void deleteMember(Map<String, Object> map) throws Exception{
		update("member.deleteMember", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getMemberList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("member.selectMemberList", map);
	}

	public void updateMemberGB(Map<String, Object> map) throws Exception{
		update("member.updateMemberGB", map);
	}

	public int getMemberListCnt() throws Exception {
		return (Integer)selectOne("member.selectMemberListCnt");
	}

	public int getDuplicatedIdCnt(Map<String, Object> map) throws Exception {
		return (Integer)selectOne("member.selectDuplicatedIdCnt", map);
	}
	
}
