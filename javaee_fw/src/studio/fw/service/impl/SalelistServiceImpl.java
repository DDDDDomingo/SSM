package studio.fw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import studio.fw.entity.SalelistInfo;
import studio.fw.mapper.SalelistInfoMapper;
import studio.fw.service.SalelistService;
import studio.fw.util.Page;

@Service
public class SalelistServiceImpl implements SalelistService {
	@Autowired
	SalelistInfoMapper salelistInfoMapper;

	@Override
	public int addSalelist(SalelistInfo salelistInfo) {
		// TODO Auto-generated method stub
		return salelistInfoMapper.insertSelective(salelistInfo);
	}

	@Override
	public boolean delete(SalelistInfo salelistInfo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int update(SalelistInfo salelistInfo) {
		return salelistInfoMapper.updateByPrimaryKeySelective(salelistInfo);
	}

	@Override
	public List<SalelistInfo> show3ByCata(int saleCata) {
		return salelistInfoMapper.list3ByCate(saleCata);
	}


	@Override
	public List<SalelistInfo> showByUser(Integer userId) {
		return salelistInfoMapper.showByUserId(userId);
	}

	@Override
	public SalelistInfo selectByPrimaryKey(Integer saleId) {
		return salelistInfoMapper.selectByPrimaryKey(saleId);
	}

	@Override
	public List<SalelistInfo> selectByBuyId(Integer buyId) {
		return salelistInfoMapper.showByBuyId(buyId);
	}

	@Override
	public List<SalelistInfo> selectBySellerId(Integer userId) {
		return salelistInfoMapper.showBySellerId(userId);
	}

	@Override
	public List<SalelistInfo> showSix() {
		return salelistInfoMapper.listSix();
	}

	@Override
	public List<SalelistInfo> showHot() {
		return salelistInfoMapper.listHot();
	}
	
	@Override
	public List<SalelistInfo> showAll() {
		// TODO Auto-generated method stub
		return salelistInfoMapper.listAll();
	}
	
	@Override
	public List<SalelistInfo> showByName(SalelistInfo record) {
		// TODO Auto-generated method stub
		return salelistInfoMapper.showByName(record);
	}

	@Override
	public List<SalelistInfo> showDesc(SalelistInfo record) {
		// TODO Auto-generated method stub
		return salelistInfoMapper.showDesc(record);
	}

	@Override
	public List<SalelistInfo> showAsc(SalelistInfo record) {
		// TODO Auto-generated method stub
		return salelistInfoMapper.showAsc(record);
	}

	@Override
	public int showByCateTotal(Integer saleCata) {
		return salelistInfoMapper.showByCateTotal(saleCata);
	}

	@Override
	public List<SalelistInfo> showByCata(Integer saleCata, Integer start,Integer count) {
		return salelistInfoMapper.listByCate(saleCata,start,count);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return salelistInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int comfirmSale(SalelistInfo record) {
		// TODO Auto-generated method stub
		return 0;
	}
}
