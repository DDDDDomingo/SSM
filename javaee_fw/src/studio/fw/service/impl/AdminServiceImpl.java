package studio.fw.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studio.fw.entity.AdminInfo;
import studio.fw.mapper.AdminInfoMapper;
import studio.fw.service.AdminService;
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminInfoMapper adminInfoMapper;
	@Override
	public AdminInfo loginCheck(AdminInfo adminInfo) {
		// TODO Auto-generated method stub
		return adminInfoMapper.loginCheck(adminInfo);
	}

}
