package com.project.mybatis;

import java.util.HashMap;
import java.util.List;

import com.project.alarm.Alarm;

public interface AlarmMapper {

	public List<Alarm> selectAll(String id);
	public void deleteAlarm(HashMap<String, Object> map);
	public void insertAlarm(HashMap<String,Object> alMap);
	public void create(String id);
	public void create_seq(String id);
	public int checkAlarm(HashMap<String, Object> alCheck);
	public int selectCount(String id);
	public void updateAlarm(HashMap<String, Object> alNum);
	
}
