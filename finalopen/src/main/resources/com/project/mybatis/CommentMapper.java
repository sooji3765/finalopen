package com.project.mybatis;

import java.util.HashMap;
import java.util.List;

import com.project.comment.Comment;

public interface CommentMapper {

	public int commentCount(String bno);
	public List<Comment> commentList(String bno);
	public void commentInsert(Comment comment);
	public void commentUpdate(HashMap<String, Object> map);
	public void commentDelete(String cno);
	public List<Comment> selectBno(String bno);
}
