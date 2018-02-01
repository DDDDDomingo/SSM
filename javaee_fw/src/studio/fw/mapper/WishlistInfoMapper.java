package studio.fw.mapper;

import java.util.List;

import studio.fw.entity.WishlistInfo;

public interface WishlistInfoMapper {
	// 未完成心愿
	List<WishlistInfo> listF(int id);

	// 完成的心愿
	List<WishlistInfo> listT(int id);
	
	// 增加心愿
	int insertSelective(WishlistInfo record);

	// 删除心愿
	int deleteByPrimaryKey(Integer wlistId);

	// selectById
	WishlistInfo selectByPrimaryKey(Integer wlistId);

	// 修改心愿
	int updateByPrimaryKeySelective(WishlistInfo record);
	// 完成心愿
	
	// 搜索求购
	List<WishlistInfo> listAll();
	List<WishlistInfo> listBySearch(WishlistInfo record);

	int insert(WishlistInfo record);

	int updateByPrimaryKeyWithBLOBs(WishlistInfo record);

	int updateByPrimaryKey(WishlistInfo record);

}