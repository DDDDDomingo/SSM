package studio.fw.service;

import java.util.List;

import studio.fw.entity.WishlistInfo;

public interface WishlistService {
	// 列出所有的wishF
	List<WishlistInfo> listF(Integer id);

	// 列出所有的wishT
	List<WishlistInfo> listT(Integer id);

	// 添加wish
	int insert(WishlistInfo wishlistInfo);

	// 不想要的wish删除
	int deleteByPrimaryKey(Integer wishId);

	// 修改用，getById
	WishlistInfo getById(Integer wishId);

	// wish想要修改还未完成的wish
	int updateByPrimaryKeySelective(WishlistInfo record);

	// wish已经完成，完成
	
	// 列出所有心愿
	List<WishlistInfo> listAll();
	List<WishlistInfo> listBySearch(WishlistInfo record);
}
