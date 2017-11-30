package moviestar.comment.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import moviestar.common.dao.AbstractDAO;

@Repository("commentDAO")
public class CommentDAO extends AbstractDAO{

	public void insertComment(Map<String, Object> map) throws Exception {
		insert("comment.insertComment", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCommentList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("comment.selectCommentList", map);
	}

	public int selectMyCommentCnt(Map<String, Object> map) throws Exception {
		return (Integer)selectOne("comment.selectMyCommentCnt", map);
	}

	public int selectCommentListCnt(Map<String, Object> map) throws Exception {
		return (Integer)selectOne("comment.selectCommentListCnt", map);
	}
	
}
