package studio.fw.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import studio.fw.entity.CategoryInfo;
import studio.fw.entity.LetterInfo;
import studio.fw.entity.SalelistInfo;
import studio.fw.entity.UserInfo;
import studio.fw.entity.WishlistInfo;
import studio.fw.service.CategoryService;
import studio.fw.service.LetterService;
import studio.fw.service.SalelistService;
import studio.fw.service.UserService;
import studio.fw.service.WishlistService;

@Controller
@RequestMapping("/saleList")
public class SalelistController {
	@Autowired
	SalelistService salelistService;
	@Autowired
	UserService userService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	WishlistService wishlistService;
	@Autowired
	LetterService letterService;

	// 页面跳转部分 商品表的操作
	@RequestMapping("/addSaleList")
	public ModelAndView toAddSale(int id) {
		ModelAndView mav = new ModelAndView();
		UserInfo userInfo1 = userService.selectByPrimaryKey(id);
		List<CategoryInfo> cateList = categoryService.listAll();
		mav.addObject("userInfo1", userInfo1);
		mav.addObject("cateList", cateList);
		mav.setViewName("user/userManager/addSaleList");
		return mav;
	}

	@RequestMapping("/myList")
	public ModelAndView toMyList(int id) {
		ModelAndView mav = new ModelAndView();
		UserInfo userInfo1 = userService.selectByPrimaryKey(id);

		List<SalelistInfo> saleList = salelistService.showByUser(id);
		List<SalelistInfo> saleList2 = salelistService.selectBySellerId(id);
		// 处理List中的时间格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 遍历List
		for (SalelistInfo salelistInfo : saleList) {
			String ctime = sdf.format(salelistInfo.getSaleTime());
			salelistInfo.setPlusTime(ctime);
		}

		// 遍历List,获取买家姓名并添加
		for (SalelistInfo salelistInfo2 : saleList2) {
			if (salelistInfo2.getBuyerId() != null) {
				String ctime = sdf.format(salelistInfo2.getSaleTime());
				salelistInfo2.setPlusTime(ctime);
				UserInfo userInfo2 = userService.selectByPrimaryKey(salelistInfo2.getBuyerId());
				salelistInfo2.setBuyName(userInfo2.getUserName());
			}
		}
		mav.addObject("saleList", saleList);
		mav.addObject("saleList2", saleList2);
		mav.addObject("userInfo1", userInfo1);
		mav.setViewName("user/userManager/myList");
		return mav;
	}

	@RequestMapping("/sellList")
	public ModelAndView toSellList(int id) {
		ModelAndView mav = new ModelAndView();
		UserInfo userInfo1 = userService.selectByPrimaryKey(id);

		List<SalelistInfo> saleList = salelistService.selectBySellerId(id);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 遍历List,获取买家姓名并添加
		for (SalelistInfo salelistInfo : saleList) {
			if (salelistInfo.getBuyerId() != null) {
				String ctime = sdf.format(salelistInfo.getSaleTime());
				salelistInfo.setPlusTime(ctime);
				UserInfo userInfo2 = userService.selectByPrimaryKey(salelistInfo.getBuyerId());
				salelistInfo.setBuyName(userInfo2.getUserName());
			}
		}
		mav.addObject("saleList", saleList);
		mav.addObject("userInfo1", userInfo1);
		mav.setViewName("user/userManager/sellList");
		return mav;
	}

	@RequestMapping("/buyList")
	public ModelAndView toBuyList(int id) {
		ModelAndView mav = new ModelAndView();
		UserInfo userInfo1 = userService.selectByPrimaryKey(id);

		List<SalelistInfo> saleList = salelistService.selectByBuyId(id);

		mav.addObject("saleList", saleList);
		mav.addObject("userInfo1", userInfo1);
		mav.setViewName("user/userManager/buyList");
		return mav;
	}

	@RequestMapping("/editSaleList")
	public ModelAndView toEditSale(int id, int userId) {
		ModelAndView mav = new ModelAndView();
		// 获取用户信息
		UserInfo userInfo1 = userService.selectByPrimaryKey(userId);
		// 获取单个商品信息
		SalelistInfo salelistInfo = salelistService.selectByPrimaryKey(id);
		// 获取商品类别
		List<CategoryInfo> cateList = categoryService.listAll();

		String string = salelistInfo.getSaleContent();

		mav.addObject("userInfo1", userInfo1);
		mav.addObject("salelistInfo", salelistInfo);
		mav.addObject("cateList", cateList);
		mav.setViewName("user/userManager/editSaleList");

		return mav;
	}

	// 处理部分
	@RequestMapping("/addSaleListCheck")
	public ModelAndView addSaleCheck(SalelistInfo salelistInfo, String saleCataName) {
		ModelAndView mav = new ModelAndView();
		// 通过商品类别获得id
		CategoryInfo saleCata = categoryService.getIdByName(saleCataName);
		// 修改id
		salelistInfo.setSaleCata(saleCata.getCategoryId());
		// 修改添加时间
		Date date = new Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		salelistInfo.setSaleTime(sqlDate);
		// 修改商品图片
		String imgSrc = "/img/salelist/" + salelistInfo.getSaleImg();
		salelistInfo.setSaleImg(imgSrc);
		// 添加商品
		salelistService.addSalelist(salelistInfo);

		mav.setViewName("redirect:/saleList/myList?id=" + salelistInfo.getUserId());
		return mav;
	}

	@RequestMapping("/editSaleListCheck")
	public ModelAndView toEditSaleCheck(SalelistInfo salelistInfo, String saleCataName) {
		ModelAndView mav = new ModelAndView();
		// 通过商品类别获得id
		CategoryInfo saleCata = categoryService.getIdByName(saleCataName);
		// 修改id
		salelistInfo.setSaleCata(saleCata.getCategoryId());
		// 修改添加时间
		Date date = new Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		salelistInfo.setSaleTime(sqlDate);
		// 修改商品图片
		String imgSrc = "/img/salelist/" + salelistInfo.getSaleImg();
		salelistInfo.setSaleImg(imgSrc);
		// 修改商品
		salelistService.update(salelistInfo);
		// 跳转到我的二手
		// String path = "saleList/myList?id=" + salelistInfo.getUserId();
		mav.setViewName("redirect:/saleList/myList?id=" + salelistInfo.getUserId());
		return mav;
	}
	
	@RequestMapping("/deleteSaleListCheck")
	public ModelAndView deleteSale(int id,int userId) {
		ModelAndView mav = new ModelAndView();
		UserInfo userInfo1 = userService.selectByPrimaryKey(userId);

		salelistService.deleteByPrimaryKey(id);

		mav.addObject("userInfo1", userInfo1);
		// 转到本页面
		mav.setViewName("redirect:/saleList/letterList?id="+userId);
		return mav;
	}

	// wishlist的操作
	// 增、删、改、查
	@RequestMapping("/wishList")
	public ModelAndView toWishList(int id) {
		ModelAndView mav = new ModelAndView();
		UserInfo userInfo1 = userService.selectByPrimaryKey(id);

		List<WishlistInfo> listF = wishlistService.listF(id);
		List<WishlistInfo> listT = wishlistService.listT(id);

		// 处理List中的时间格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 遍历List1
		for (WishlistInfo wishlistInfo : listF) {
			String ctime = sdf.format(wishlistInfo.getWlistTime());
			wishlistInfo.setPlusTime(ctime);
		}
		// 遍历List2
		for (WishlistInfo wishlistInfo1 : listT) {
			String ctime = sdf.format(wishlistInfo1.getWlistTime());
			wishlistInfo1.setPlusTime(ctime);
		}

		mav.addObject("listF", listF);
		mav.addObject("listT", listT);
		mav.addObject("userInfo1", userInfo1);
		mav.setViewName("user/userManager/wishList");
		return mav;
	}

	@RequestMapping("/addWishList")
	public ModelAndView toAddWish(int id) {
		ModelAndView mav = new ModelAndView();
		UserInfo userInfo1 = userService.selectByPrimaryKey(id);
		List<CategoryInfo> cateList = categoryService.listAll();
		mav.addObject("cateList", cateList);
		mav.addObject("userInfo1", userInfo1);
		mav.setViewName("user/userManager/addWishList");
		return mav;
	}

	@RequestMapping("/editWishList")
	public ModelAndView toEditWish(int id, int userId) {
		ModelAndView mav = new ModelAndView();
		UserInfo userInfo1 = userService.selectByPrimaryKey(userId);
		List<CategoryInfo> cateList = categoryService.listAll();
		WishlistInfo wishlistInfo = wishlistService.getById(id);

		mav.addObject("cateList", cateList);
		mav.addObject("userInfo1", userInfo1);
		mav.addObject("wishlistInfo", wishlistInfo);
		mav.setViewName("user/userManager/editWishList");
		return mav;
	}

	@RequestMapping("/addWishListCheck")
	public ModelAndView toAddWishCheck(WishlistInfo wishlistInfo, String wishCataName) {
		ModelAndView mav = new ModelAndView();
		// userinfo
		UserInfo userInfo1 = userService.selectByPrimaryKey(wishlistInfo.getUserId());

		// 通过商品类别获得id,设置wish的id
		CategoryInfo saleCata = categoryService.getIdByName(wishCataName);
		wishlistInfo.setWlistType(saleCata.getCategoryId());

		// 修改添加时间
		Date date = new Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		wishlistInfo.setWlistTime(sqlDate);

		// 修改商品图片
		String imgSrc = "/img/wishlist/" + wishlistInfo.getWlistImg();
		wishlistInfo.setWlistImg(imgSrc);
		// 设置未出售
		wishlistInfo.setWlistState(false);

		wishlistService.insert(wishlistInfo);

		mav.addObject("userInfo1", userInfo1);
		mav.setViewName("redirect:/saleList/wishList?id=" + wishlistInfo.getUserId());
		return mav;
	}

	@RequestMapping("/editWishListCheck")
	public ModelAndView toEditWishCheck(WishlistInfo wishlistInfo, String wishCataName) {
		ModelAndView mav = new ModelAndView();
		// 通过商品类别获得id
		CategoryInfo saleCata = categoryService.getIdByName(wishCataName);
		// 修改id
		wishlistInfo.setWlistType(saleCata.getCategoryId());
		// 修改添加时间
		Date date = new Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		wishlistInfo.setWlistTime(sqlDate);
		// 修改商品图片
		String imgSrc = "/img/wishlist/" + wishlistInfo.getWlistImg();
		wishlistInfo.setWlistImg(imgSrc);
		// 修改商品
		wishlistService.updateByPrimaryKeySelective(wishlistInfo);
		// 跳转到我的二手
		// String path = "saleList/myList?id=" + salelistInfo.getUserId();
		mav.setViewName("redirect:/saleList/wishList?id=" + wishlistInfo.getUserId());
		return mav;
	}
	
	@RequestMapping("/removeWishList")
	public ModelAndView removeWishList(int id,int userId) {
		ModelAndView mav = new ModelAndView();
		UserInfo userInfo1 = userService.selectByPrimaryKey(userId);

		wishlistService.deleteByPrimaryKey(id);

		mav.addObject("userInfo1", userInfo1);
		// 转到本页面
		mav.setViewName("redirect:/saleList/myList?id="+userId);
		return mav;
	}

	// 消息列表
	@RequestMapping("/letterList")
	public ModelAndView toMyMessage(int id) {
		ModelAndView mav = new ModelAndView();

		UserInfo userInfo1 = userService.selectByPrimaryKey(id);
		List<LetterInfo> letterList = letterService.listById(id);

		// 添加发信人昵称
		// 添加发信人要购买的商品
		for (LetterInfo letterInfo : letterList) {
			UserInfo sender = userService.selectByPrimaryKey(letterInfo.getSenderId());
			letterInfo.setSenderName(sender.getUserName());
			SalelistInfo salelistInfo = salelistService.selectByPrimaryKey(letterInfo.getLetterState());
			letterInfo.setLetterStateName(salelistInfo.getSaleName());
		}

		// 处理List中的时间格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 遍历List1
		for (LetterInfo letterInfo2 : letterList) {
			String ctime = sdf.format(letterInfo2.getLetterTime());
			letterInfo2.setPlusTime(ctime);
		}

		mav.addObject("userInfo1", userInfo1);
		mav.addObject("letterList", letterList);
		mav.setViewName("user/letterList/letterList");
		return mav;
	}

	@RequestMapping("/delMessage")
	public ModelAndView delMessage(int id,int userId) {
		ModelAndView mav = new ModelAndView();
		UserInfo userInfo1 = userService.selectByPrimaryKey(userId);

		letterService.deleteByPrimaryKey(id);

		mav.addObject("userInfo1", userInfo1);
		// 转到本页面
		mav.setViewName("redirect:/saleList/letterList?id="+userId);
		return mav;
	}
	
	@RequestMapping("/confirmSale")
	public ModelAndView confirmSale(int saleId,int userId,int buyerId) {
		ModelAndView mav = new ModelAndView();
		UserInfo userInfo1 = userService.selectByPrimaryKey(userId);
		
		SalelistInfo salelistInfo = new SalelistInfo();
		salelistInfo.setUserId(userId);
		salelistInfo.setSaleId(saleId);
		salelistInfo.setBuyerId(buyerId);
		salelistInfo.setSaleState(true);
		salelistService.update(salelistInfo);

		mav.addObject("userInfo1", userInfo1);
		// 转到本页面
		mav.setViewName("redirect:/saleList/letterList?id="+userId);
		return mav;
	}
}
