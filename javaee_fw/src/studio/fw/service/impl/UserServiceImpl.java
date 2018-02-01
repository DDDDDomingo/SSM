package studio.fw.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studio.fw.entity.UserInfo;
import studio.fw.mapper.UserInfoMapper;
import studio.fw.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserInfoMapper userInfoMapper;
	
	//用户登陆并更新最后一次登陆时间
	public UserInfo login(UserInfo userInfo){
		if(!userInfo.getUserAccount().equals("") || !userInfo.getUserPwd().equals("")){
			return userInfoMapper.login(userInfo);
		}
		return null;
	}
	
	public boolean register(UserInfo userInfo){
		if(userInfo.getUserName()!=null){
			userInfoMapper.register(userInfo);
			return true;
		}else {
			return false;
		}
	}

	@Override
	public void updateLoginTime(UserInfo userInfo) {
		userInfoMapper.updateLoginTime(userInfo);
	}

	@Override
	public UserInfo selectByPrimaryKey(int id) {
		return userInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public UserInfo updateByPrimaryKeySelective(UserInfo info) {
		int id = info.getUserId();
		userInfoMapper.updateByPrimaryKeySelective(info);
		return userInfoMapper.selectByPrimaryKey(id);
	}

}
