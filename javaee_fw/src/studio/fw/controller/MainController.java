package studio.fw.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import studio.fw.entity.CartInfo;
import studio.fw.entity.CategoryInfo;
import studio.fw.entity.LetterInfo;
import studio.fw.entity.MessageInfo;
import studio.fw.entity.SalelistInfo;
import studio.fw.entity.UserInfo;
import studio.fw.entity.WishlistInfo;
import studio.fw.service.CartService;
import studio.fw.service.CategoryService;
import studio.fw.service.LetterService;
import studio.fw.service.MessageService;
import studio.fw.service.SalelistService;
import studio.fw.service.UserService;
import studio.fw.service.WishlistService;
import studio.fw.util.Page;

@Controller
@RequestMapping("/front")
public class MainController {
	@Autowired
	SalelistService salelistService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	UserService userService;
	@Autowired
	MessageService messageService;
	@Autowired
	CartService cartService;
	@Autowired
	LetterService letterService;
	@Autowired
	WishlistService wishlistService;

	@RequestMapping("/index")
	public ModelAndView toIndex(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("isLogin") != null) {
			int userId = (int) session.getAttribute("isLogin");
			mav.addObject("userId", userId);
			mav.addObject("state", true);
		} else {
			mav.addObject("state", false);
		}
		// 获取最新商品
		List<SalelistInfo> newlist = salelistService.showSix();
		// 加上商品类别
		for (SalelistInfo salelistInfo : newlist) {
			CategoryInfo categoryInfo = categoryService.getById(salelistInfo.getSaleCata());
			salelistInfo.setCateName(categoryInfo.getCategoryType());
		}
		// 获取最熱商品
		List<SalelistInfo> hotList = salelistService.showHot();
		// 加上商品类别
		for (SalelistInfo salelistInfo1 : hotList) {
			CategoryInfo categoryInfo = categoryService.getById(salelistInfo1.getSaleCata());
			salelistInfo1.setCateName(categoryInfo.getCategoryType());
		}
		// 获取所有商品类别
		List<CategoryInfo> cateList = categoryService.listAll();

		mav.addObject("newSale", newlist);
		mav.addObject("hotSale", hotList);
		mav.addObject("cateList", cateList);
		mav.setViewName("index");
		return mav;
	}

	@RequestMapping("/singleGood")
	public ModelAndView toSingleGood(int saleId, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		SalelistInfo salelistInfo = salelistService.selectByPrimaryKey(saleId);
		// 获取所有商品类别
		List<CategoryInfo> cateList = categoryService.listAll();
		// 获取卖家信息
		UserInfo userInfo = userService.selectByPrimaryKey(salelistInfo.getUserId());
		// 获取相同类别的其他商品
		List<SalelistInfo> simList = salelistService.show3ByCata(salelistInfo.getSaleCata());
		// 加上商品类别
		for (SalelistInfo salelistInfo2 : simList) {
			CategoryInfo categoryInfo = categoryService.getById(salelistInfo2.getSaleCata());
			salelistInfo2.setCateName(categoryInfo.getCategoryType());
		}
		// 获取商品评论
		List<MessageInfo> messageList = messageService.listBySaleId(salelistInfo.getSaleId());

		// 时间 处理
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 加上头像和昵称
		for (MessageInfo messageInfo : messageList) {
			// 时间 处理
			String mtime = sdf.format(messageInfo.getMsgTime());
			messageInfo.setPlusTime(mtime);
			// 加上头像和昵称
			UserInfo userInfo2 = userService.selectByPrimaryKey(messageInfo.getUserId());
			messageInfo.setUserImg(userInfo2.getUserAvatar());
			messageInfo.setUserName(userInfo2.getUserName());
		}

		HttpSession session = request.getSession();
		if (session.getAttribute("isLogin") != null) {
			int isLogin = (int) session.getAttribute("isLogin");
			UserInfo userInfo2 = userService.selectByPrimaryKey(isLogin);
			mav.addObject("state", true);
			mav.addObject("user", userInfo2);
		} else {
			mav.addObject("state", false);
		}

		mav.addObject("salelistInfo", salelistInfo);
		mav.addObject("cateList", cateList);
		mav.addObject("sell", userInfo);
		mav.addObject("simList", simList);
		mav.addObject("messageList", messageList);
		mav.setViewName("front/singleGood");
		return mav;
	}

	// 添加回复
	@RequestMapping("/addMes")
	public ModelAndView addMes(MessageInfo messageInfo) {
		ModelAndView mav = new ModelAndView();
		// 修改时间
		Date date = new Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		messageInfo.setMsgTime(sqlDate);
		messageService.insertSelective(messageInfo);
		mav.setViewName("redirect:/front/singleGood?saleId=" + messageInfo.getSaleitemId());
		return mav;
	}

	// 加入购物车
	@RequestMapping("/insertCart")
	public ModelAndView insertCart(int userId, int saleId, int sellerId, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		CartInfo cartInfo = new CartInfo();

		HttpSession session = request.getSession();
		if (session.getAttribute("isLogin") != null) {
			cartInfo.setUserId(userId);
			cartInfo.setSaleId(saleId);
			cartInfo.setSellerId(sellerId);
			// 修改时间
			Date date = new Date();
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			cartInfo.setUpdateTime(sqlDate);
			cartInfo.setCreateTime(sqlDate);

			cartService.insertSelective(cartInfo);
			mav.setViewName("redirect:/front/singleGood?saleId=" + saleId);
		} else {
			mav.setViewName("user/login");
		}
		return mav;
	}

	// 删除购物
	@RequestMapping("/deleteCart")
	public ModelAndView insertCart(int cartId) {
		ModelAndView mav = new ModelAndView();
		cartService.deleteByPrimaryKey(cartId);

		mav.setViewName("redirect:/front/cart");
		return mav;
	}

	@RequestMapping("/cart")
	public ModelAndView toMyCart(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// 获取所有商品类别
		List<CategoryInfo> cateList = categoryService.listAll();

		HttpSession session = request.getSession();
		if (session.getAttribute("isLogin") != null) {
			int isLogin = (int) session.getAttribute("isLogin");
			List<CartInfo> cartList = cartService.sList(isLogin);
			// 时间 处理
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			// 修改商品名，商品图
			for (CartInfo cartInfo : cartList) {
				// 时间 处理
				String mtime = sdf.format(cartInfo.getCreateTime());
				cartInfo.setPlusTime(mtime);
				// 修改商品名，商品图
				SalelistInfo salelistInfo = salelistService.selectByPrimaryKey(cartInfo.getSaleId());
				cartInfo.setSaleName(salelistInfo.getSaleName());
				cartInfo.setSaleImg(salelistInfo.getSaleImg());
				cartInfo.setSalePrice(salelistInfo.getSalePrice());
			}
			mav.addObject("cartList", cartList);
			mav.setViewName("front/cartList");
		} else {
			mav.setViewName("user/login");
		}
		mav.addObject("cateList", cateList);
		return mav;
	}

	@RequestMapping("/contact")
	public ModelAndView toContack(HttpServletRequest request, int sellerId, int saleId) {
		ModelAndView mav = new ModelAndView();
		// 获取所有商品类别
		List<CategoryInfo> cateList = categoryService.listAll();

		HttpSession session = request.getSession();
		if (session.getAttribute("isLogin") != null) {
			int isLogin = (int) session.getAttribute("isLogin");
			// 获取买家信息
			UserInfo buyer = userService.selectByPrimaryKey(isLogin);
			// 获取卖家信息
			UserInfo seller = userService.selectByPrimaryKey(sellerId);
			// 获取商品信息
			SalelistInfo salelistInfo = salelistService.selectByPrimaryKey(saleId);

			mav.addObject("buyer", buyer);
			mav.addObject("seller", seller);
			mav.addObject("salelistInfo", salelistInfo);
			mav.setViewName("front/contact");
		} else {
			mav.setViewName("user/login");
		}
		mav.addObject("cateList", cateList);
		return mav;
	}

	@RequestMapping("/sendLetter")
	public ModelAndView checkLetter(LetterInfo letterInfo) {
		ModelAndView mav = new ModelAndView();

		// 修改时间
		Date date = new Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		letterInfo.setLetterTime(sqlDate);

		letterService.insertSelective(letterInfo);

		mav.setViewName("redirect:/front/singleGood?saleId=" + letterInfo.getLetterState());
		return mav;
	}

	@RequestMapping("/search")
	public ModelAndView search(String cateName, String seachType,String goodName, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// 获取所有商品类别
		List<CategoryInfo> cateList = categoryService.listAll();
		// 登陆验证
		HttpSession session = request.getSession();
		if (session.getAttribute("isLogin") != null) {
			int userId = (int) session.getAttribute("isLogin");
			mav.addObject("userId", userId);
			mav.addObject("state", true);
		} else {
			mav.addObject("state", false);
		}

		SalelistInfo salelistInfo = new SalelistInfo();
		WishlistInfo wishlistInfo = new WishlistInfo();
		// 类别名获取ID
		if (!cateName.equals("all")) {
			CategoryInfo categoryInfo = categoryService.getIdByName(cateName);
			salelistInfo.setSaleCata(categoryInfo.getCategoryId());
			wishlistInfo.setWlistType(categoryInfo.getCategoryId());
		}
		// 修改名字
		if(goodName!=null){
			salelistInfo.setSaleName(goodName);
			wishlistInfo.setWlistName(goodName);
		}
		if (seachType.equals("sale")) {
			if (goodName.equals("")) {
				// 搜索所有商品
				List<SalelistInfo> listAll = salelistService.showAll();
				for (SalelistInfo salelistInfo2 : listAll) {
					CategoryInfo categoryInfo = categoryService.getById(salelistInfo2.getSaleCata());
					salelistInfo2.setCateName(categoryInfo.getCategoryType());
				}
				mav.addObject("listAll", listAll);
			} else {
				// 时间
				List<SalelistInfo> sjList = salelistService.showByName(salelistInfo);
				for (SalelistInfo salelistInfo2 : sjList) {
					CategoryInfo categoryInfo = categoryService.getById(salelistInfo2.getSaleCata());
					salelistInfo2.setCateName(categoryInfo.getCategoryType());
				}
				// 降序
				List<SalelistInfo> jgDescList = salelistService.showDesc(salelistInfo);
				for (SalelistInfo salelistInfo2 : jgDescList) {
					CategoryInfo categoryInfo = categoryService.getById(salelistInfo2.getSaleCata());
					salelistInfo2.setCateName(categoryInfo.getCategoryType());
				}
				// 升序
				List<SalelistInfo> jgAscList = salelistService.showAsc(salelistInfo);
				for (SalelistInfo salelistInfo2 : jgAscList) {
					CategoryInfo categoryInfo = categoryService.getById(salelistInfo2.getSaleCata());
					salelistInfo2.setCateName(categoryInfo.getCategoryType());
				}
				mav.addObject("sjList", sjList);
				mav.addObject("jgDescList", jgDescList);
				mav.addObject("jgAscList", jgAscList);
			}
		} else if (seachType.equals("wish")) {
			if (goodName.equals("")) {
				List<WishlistInfo> wishlistInfos = wishlistService.listAll();
				for (WishlistInfo wishlistInfo2 : wishlistInfos) {
					CategoryInfo categoryInfo = categoryService.getById(wishlistInfo2.getWlistType());
					wishlistInfo2.setTypeName(categoryInfo.getCategoryType());
					UserInfo userInfo = userService.selectByPrimaryKey(wishlistInfo2.getUserId());
					wishlistInfo2.setUserPhone(userInfo.getUserTel());
				}
				mav.addObject("wishlistAll", wishlistInfos);
			}else {
				List<WishlistInfo> searchWish = wishlistService.listBySearch(wishlistInfo);
				for (WishlistInfo wishlistInfo2 : searchWish) {
					CategoryInfo categoryInfo = categoryService.getById(wishlistInfo2.getWlistType());
					wishlistInfo2.setTypeName(categoryInfo.getCategoryType());
					UserInfo userInfo = userService.selectByPrimaryKey(wishlistInfo2.getUserId());
					wishlistInfo2.setUserPhone(userInfo.getUserTel());
				}
				mav.addObject("searchWish", searchWish);
			}
		}
		mav.addObject("cateList", cateList);
		mav.setViewName("/front/search");
		return mav;
	}

	@RequestMapping("/getByCata")
	public ModelAndView getByCate(HttpServletRequest request, int saleCata, Page page) {
		ModelAndView mav = new ModelAndView();
		// 获取所有商品类别
		List<CategoryInfo> cateList = categoryService.listAll();
		// 登陆验证
		HttpSession session = request.getSession();
		if (session.getAttribute("isLogin") != null) {
			int userId = (int) session.getAttribute("isLogin");
			mav.addObject("userId", userId);
			mav.addObject("state", true);
		} else {
			mav.addObject("state", false);
		}
		// 分页
		int start = page.getStart();
		int count = page.getCount();

		int total = salelistService.showByCateTotal(saleCata);
		page.caculateLast(total);
		if ((start + count) >= (total+count)) {
			start = start - count;
			page.setStart(start);
		}
		// 增加商品名称
		List<SalelistInfo> salelistByCate = salelistService.showByCata(saleCata, start, count);
		for (SalelistInfo salelistInfo : salelistByCate) {
			CategoryInfo categoryInfo = categoryService.getById(salelistInfo.getSaleCata());
			salelistInfo.setCateName(categoryInfo.getCategoryType());
		}

		CategoryInfo cate = categoryService.getById(saleCata);

		mav.addObject("cate", cate);
		mav.addObject("salelistByCate", salelistByCate);
		mav.addObject("cateList", cateList);
		mav.setViewName("/front/search");
		return mav;
	}
}
