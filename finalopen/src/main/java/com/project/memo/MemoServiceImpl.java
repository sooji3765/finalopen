package com.project.memo;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mybatis.MemoMapper;

@Service
public class MemoServiceImpl implements MemoService{

	@Autowired
	private MemoMapper memoMapper;
	
	@Override
	public void create(String refId) {
		
		memoMapper.create(refId);
	}

	@Override
	public List<Memo> selectAll(String refId) {
		// TODO Auto-generated method stub
		return memoMapper.selectAll(refId);
	}

	@Override
	public void insert(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		memoMapper.insert(map);
	}

	@Override
	public void create_seq(String refId) {
		// TODO Auto-generated method stub
		memoMapper.create_seq(refId);
	}
	

}
