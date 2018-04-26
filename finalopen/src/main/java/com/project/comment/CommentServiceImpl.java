package com.project.comment;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mybatis.CommentMapper;


@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentMapper commentMapper;
	
	@Override
	public int commentCount(String bno) {

		// TODO Auto-generated method stub
		return commentMapper.commentCount(bno);
	}

	@Override
	public List<Comment> commentList(String bno) {
		// TODO Auto-generated method stub
		return commentMapper.commentList(bno);
	}

	@Override
	public void commentInsert(Comment comment) {
		// TODO Auto-generated method stub
		commentMapper.commentInsert(comment);
	}


	@Override
	public List<Comment> selectBno(String bno) {
		// TODO Auto-generated method stub
		return commentMapper.selectBno(bno);
	}

	@Override
	public void delete(String cno) {
		commentMapper.commentDelete(cno);
		
	}

	@Override
	public void update(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		commentMapper.commentUpdate(map);
	}

}
