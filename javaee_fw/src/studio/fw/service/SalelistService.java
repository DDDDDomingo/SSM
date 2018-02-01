package studio.fw.service;

import java.util.List;

import studio.fw.entity.SalelistInfo;
import studio.fw.util.Page;

public interface SalelistService {
	int addSalelist(SalelistInfo salelistInfo);

	boolean delete(SalelistInfo salelistInfo);

	// 用户修改已发布商品信息
	int update(SalelistInfo salelistInfo);

	// 通过ID显示单个商品信息
	SalelistInfo selectByPrimaryKey(Integer saleId);

	// 通过买家ID显示单个商品信息
	List<SalelistInfo> selectByBuyId(Integer buyId);

	// 通过卖家ID显示所有出售的商品
	List<SalelistInfo> selectBySellerId(Integer userId);

	// 最新发布前6个
	List<SalelistInfo> showSix();

	// 最热发布前6个
	List<SalelistInfo> showHot();

	// 类别筛选
	List<SalelistInfo> show3ByCata(int saleCata);

	// 全部展示
	List<SalelistInfo> showByUser(Integer userId);
	
	int showByCateTotal(Integer saleCata);
	// 类别筛选
	List<SalelistInfo> showByCata(Integer saleCata,Integer start,Integer count);

	// 全部展示
	List<SalelistInfo> showAll();

	// 名字筛选 时间排列
	List<SalelistInfo> showByName(SalelistInfo record);

	// 价格降序排列
	List<SalelistInfo> showDesc(SalelistInfo record);

	// 价格升序排序
	List<SalelistInfo> showAsc(SalelistInfo record);
	
	int deleteByPrimaryKey(Integer id);
	
	int comfirmSale(SalelistInfo record);
}
