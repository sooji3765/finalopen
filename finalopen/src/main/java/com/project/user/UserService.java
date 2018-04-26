package com.project.user;

import java.util.HashMap;
import java.util.List;

public interface UserService {
	
	public void insert(User user);
	public String checkMember(String id);
	public User selectUser(String id);
	public void modifyUser(User user);
	public int selectRefId(String id);
	public String checkRef(String id);
	public void modifyRef(HashMap<String, Object> map);
	public void regUpdate(User user);
	public int countRef(String refId);
	public List<User> selectAllRef(String refId);
	public int count(String id);
	public int checkUser(HashMap<String, Object> map);
	public int countNick(String nickname);
	public String searchNick(String nickname);
	public int searchPass(HashMap<String, Object> map);
	public void changePass(HashMap<String, Object> map);
	
}
