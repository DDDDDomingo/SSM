package studio.fw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studio.fw.entity.WishlistInfo;
import studio.fw.mapper.WishlistInfoMapper;
import studio.fw.service.WishlistService;

@Service
public class WishlistServiceImpl implements WishlistService {

	@Autowired
	WishlistInfoMapper wishlistInfoMapper;

	@Override
	public List<WishlistInfo> listF(Integer id) {
		// TODO Auto-generated method stub
		return wishlistInfoMapper.listF(id);
	}

	@Override
	public List<WishlistInfo> listT(Integer id) {
		// TODO Auto-generated method stub
		return wishlistInfoMapper.listT(id);
	}

	@Override
	public int insert(WishlistInfo wishlistInfo) {
		// TODO Auto-generated method stub
		return wishlistInfoMapper.insertSelective(wishlistInfo);
	}

	@Override
	public int deleteByPrimaryKey(Integer wlistId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(WishlistInfo record) {
		// TODO Auto-generated method stub
		return wishlistInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public WishlistInfo getById(Integer wishId) {
		return wishlistInfoMapper.selectByPrimaryKey(wishId);
	}

	@Override
	public List<WishlistInfo> listAll() {
		// TODO Auto-generated method stub
		return wishlistInfoMapper.listAll();
	}

	@Override
	public List<WishlistInfo> listBySearch(WishlistInfo record) {
		// TODO Auto-generated method stub
		return wishlistInfoMapper.listBySearch(record);
	}

}
