package com.project.mybatis;

import java.util.HashMap;
import java.util.List;

import com.project.refri.Refri;


public interface RefriMapper {
	
	public void create(String id);
	public void create_seq(String id);
	public String selectR_num(String id, String num);
	public void insertIngre(HashMap<String ,Object> map);
	public List<Refri> selectAll(String refri_num);
	public void deleteItem(HashMap<String, Object> map);
	public Refri selectOneRef(HashMap<String, Object> map);
	public void updateRef(HashMap<String, Object> map);
	public void updateTime(HashMap<String, Object> map);
}