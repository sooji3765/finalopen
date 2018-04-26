package com.project.user;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mybatis.UserMapper;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public void insert(User user) {
		// TODO Auto-generated method stub
		userMapper.insert(user);
	}

	@Override
	public String checkMember(String id) {
		// TODO Auto-generated method stub
		return userMapper.checkMember(id);
	}

	@Override
	public User selectUser(String id) {
		// TODO Auto-generated method stub
		return userMapper.selectUser(id);
	}

	@Override
	public void modifyUser(User user) {
		
		userMapper.modifyUser(user);		
	}

	@Override
	public int selectRefId(String id) {
		// TODO Auto-generated method stub
		return userMapper.selectRefId(id);
	}

	@Override
	public String checkRef(String id) {
		// TODO Auto-generated method stub
		return userMapper.checkRef(id);
	}

	@Override
	public void modifyRef(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		userMapper.modifyRef(map);
	}

	@Override
	public void regUpdate(User user) {
		// TODO Auto-generated method stub
		userMapper.regUpdate(user);
	}

	@Override
	public int countRef(String refId) {
		// TODO Auto-generated method stub
		return userMapper.countRef(refId);
	}

	@Override
	public List<User> selectAllRef(String refId) {
		// TODO Auto-generated method stub
		return userMapper.selectAllRef(refId);
	}

	@Override
	public int count(String id) {
		// TODO Auto-generated method stub
		return userMapper.count(id);
	}

	@Override
	public int checkUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.checkUser(map);
	}

	@Override
	public int countNick(String nickname) {
		// TODO Auto-generated method stub
		return userMapper.countNick(nickname);
	}

	@Override
	public String searchNick(String nickname) {
		// TODO Auto-generated method stub
		
		return userMapper.searchNick(nickname);
	}

	@Override
	public int searchPass(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.searchPass(map);
	}

	@Override
	public void changePass(HashMap<String, Object> map) {
		
		userMapper.changePass(map);
		
	}
}
