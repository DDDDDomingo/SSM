package studio.fw.mapper;

import studio.fw.entity.UserInfo;

public interface UserInfoMapper {
	
	UserInfo selectByPrimaryKey(int id);
	
	UserInfo login(UserInfo record);

	int register(UserInfo record);

	void updateLoginTime(UserInfo record);
	
	int updateByPrimaryKeySelective(UserInfo record);
	
}