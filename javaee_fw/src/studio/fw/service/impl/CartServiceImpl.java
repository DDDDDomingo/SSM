package studio.fw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studio.fw.entity.CartInfo;
import studio.fw.mapper.CartInfoMapper;
import studio.fw.service.CartService;
@Service
public class CartServiceImpl implements CartService {
	@Autowired
	CartInfoMapper cartInfoMapper;
	
	@Override
	public List<CartInfo> sList(Integer user_id) {
		// TODO Auto-generated method stub
		return cartInfoMapper.sList(user_id);
	}

	@Override
	public int deleteByPrimaryKey(Integer cartId) {
		// TODO Auto-generated method stub
		return cartInfoMapper.deleteByPrimaryKey(cartId);
	}

	@Override
	public int insertSelective(CartInfo record) {
		// TODO Auto-generated method stub
		return cartInfoMapper.insertSelective(record);
	}

}
