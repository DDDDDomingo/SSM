package studio.fw.service;

import studio.fw.entity.UserInfo;

public interface UserService {
	UserInfo selectByPrimaryKey(int id);
	
	UserInfo login(UserInfo userInfo);
	
	void updateLoginTime(UserInfo userInfo);
	
	boolean register(UserInfo userInfo);
	
	UserInfo updateByPrimaryKeySelective(UserInfo userInfo);
	
}
