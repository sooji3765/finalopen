package com.project.alarm;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mybatis.AlarmMapper;


@Service
public class AlarmServiceImpl implements AlarmService{

	@Autowired
	private AlarmMapper alarmMapper;
	
	@Override
	public List<Alarm> selectAll(String id) {
		// TODO Auto-generated method stub
		return alarmMapper.selectAll(id);
	}

	@Override
	public void create(String id) {
		alarmMapper.create(id);
	}

	@Override
	public void deleteAlarm(HashMap<String, Object> map) {
		
		alarmMapper.deleteAlarm(map);
		
	}

	@Override
	public void insertAlarm(HashMap<String,Object> alMap) {
		alarmMapper.insertAlarm(alMap);
	}

	@Override
	public void create_seq(String id) {
		alarmMapper.create_seq(id);
		
	}

	@Override
	public int checkAlarm(HashMap<String, Object> alCheck) {
		return alarmMapper.checkAlarm(alCheck);
	}

	@Override
	public int selectCount(String id) {
		// TODO Auto-generated method stub
		return alarmMapper.selectCount(id);
	}

	@Override
	public void updateAlarm(HashMap<String, Object> alNum) {
		// TODO Auto-generated method stub
		alarmMapper.updateAlarm(alNum);
	}

	
}
