package com.project.mybatis;

import java.util.HashMap;
import java.util.List;

import com.project.memo.Memo;

public interface MemoMapper {

	public void create(String refId);
	public List<Memo> selectAll(String refId);
	public void insert(HashMap<String, Object> map);
	public void create_seq(String refId);

}
