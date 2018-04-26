package com.project.memo;

import java.util.HashMap;
import java.util.List;

public interface MemoService {
	public void create(String refId);
	public void create_seq(String refId);
	public List<Memo> selectAll(String refId);
	public void insert(HashMap<String,Object> map);
}
