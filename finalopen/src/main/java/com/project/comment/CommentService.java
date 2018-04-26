package com.project.comment;

import java.util.HashMap;
import java.util.List;

public interface CommentService {
	
	public int commentCount(String bno);
	public List<Comment> commentList(String bno);
	public void commentInsert(Comment comment);
	public List<Comment> selectBno(String bno);
	public void delete(String cno);
	public void update(HashMap<String, Object> map);

}
