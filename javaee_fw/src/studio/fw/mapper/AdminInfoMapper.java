package studio.fw.mapper;

import studio.fw.entity.AdminInfo;

public interface AdminInfoMapper {
    int deleteByPrimaryKey(Integer adminId);

    int insert(AdminInfo record);

    int insertSelective(AdminInfo record);

    AdminInfo selectByPrimaryKey(Integer adminId);

    int updateByPrimaryKeySelective(AdminInfo record);

    int updateByPrimaryKey(AdminInfo record);
    //管理员登陆验证
    AdminInfo loginCheck(AdminInfo record);
}