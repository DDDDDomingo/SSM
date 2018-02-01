package studio.fw.service;

import studio.fw.entity.AdminInfo;

public interface AdminService {
	//登陆验证
	AdminInfo loginCheck(AdminInfo adminInfo);
}
