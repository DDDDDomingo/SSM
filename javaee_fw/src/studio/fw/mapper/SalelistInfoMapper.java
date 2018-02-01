package studio.fw.mapper;

import java.util.List;

import studio.fw.entity.SalelistInfo;
import studio.fw.util.Page;

public interface SalelistInfoMapper {
	// 插入商品
	int insertSelective(SalelistInfo record);

	// 用户查看自己的发布的
	List<SalelistInfo> showByUserId(Integer userId);

	// 卖家查看售出订单
	List<SalelistInfo> showBySellerId(Integer userId);

	// 买家查看购买订单
	List<SalelistInfo> showByBuyId(Integer userId);

	// 通过ID获得商品
	SalelistInfo selectByPrimaryKey(Integer saleId);

	// 修改商品，ID验证
	int updateByPrimaryKeySelective(SalelistInfo record);

	// 展示最新的6个商品
	List<SalelistInfo> listSix();

	// 展示最新的6个商品
	List<SalelistInfo> listHot();

	// 类别ID获取商品
	List<SalelistInfo> list3ByCate(Integer saleCata);
	
	//获取总数
	int showByCateTotal(Integer saleCata);
	// 类别ID获取商品
	List<SalelistInfo> listByCate(Integer saleCata,Integer start,Integer count);

	// 展示所有商品
	List<SalelistInfo> listAll();

	// 名字筛选 时间排列
	List<SalelistInfo> showByName(SalelistInfo record);

	// 价格降序排列
	List<SalelistInfo> showDesc(SalelistInfo record);

	// 价格升序排序
	List<SalelistInfo> showAsc(SalelistInfo record);
	
	int deleteByPrimaryKey(Integer id);
	
	int comfirmSale(SalelistInfo record);
}