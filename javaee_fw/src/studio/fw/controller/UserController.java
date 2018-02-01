package studio.fw.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import studio.fw.entity.CategoryInfo;
import studio.fw.entity.UserInfo;
import studio.fw.service.CategoryService;
import studio.fw.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	CategoryService categoryService;
	// 页面跳转部分

	@RequestMapping("/test")
	public ModelAndView todddd() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/test");
		return mav;
	}

	@RequestMapping("/testCheck")
	@ResponseBody
	public String todddd(MultipartFile file, HttpServletRequest request) throws IOException {
		System.out.println("loading>>");
		String path = request.getSession().getServletContext().getRealPath("/img/user");
		System.out.println("path>>" + path);

		String fileName = file.getOriginalFilename();
		System.out.println("fileName>>" + fileName);

		File dir = new File(path, fileName);
		System.out.println("dir.exists()>>" + dir.exists());
		if (!dir.exists()) {
			dir.mkdirs();
		}
		System.out.println("dir.exists()>>" + dir.exists());
		// MultipartFile自带的解析方法
		file.transferTo(dir);
		return "ok";
	}

	// 登陆跳转
	@RequestMapping("/login")
	public ModelAndView toLogin() {
		ModelAndView mav = new ModelAndView();
		// 获取所有商品类别
		List<CategoryInfo> cateList = categoryService.listAll();

		mav.addObject("cateList", cateList);
		mav.setViewName("user/login");
		return mav;
	}

	// 退出登陆
	@RequestMapping("/quit")
	public ModelAndView toLogin(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("isLogin") != null) {
			session.removeAttribute("isLogin");
			mav.addObject("state", false);
			mav.setViewName("index");
		}
		return mav;
	}

	// 跳转注册
	@RequestMapping("/register")
	public ModelAndView toRegister() {
		ModelAndView mav = new ModelAndView();
		// 获取所有商品类别
		List<CategoryInfo> cateList = categoryService.listAll();

		mav.addObject("cateList", cateList);
		mav.setViewName("user/register");
		return mav;
	}

	// 跳转用户中心首页
	@RequestMapping("/personal")
	public ModelAndView toPersonal(int id) {
		ModelAndView mav = new ModelAndView();
		UserInfo userInfo1 = userService.selectByPrimaryKey(id);
		mav.addObject("userInfo1", userInfo1);
		// 获取所有商品类别
		List<CategoryInfo> cateList = categoryService.listAll();
		mav.addObject("cateList", cateList);
		mav.setViewName("user/personal");
		return mav;
	}

	// 跳转用户基本信息
	@RequestMapping("/editUser")
	public ModelAndView toEditUser(int id) {
		ModelAndView mav = new ModelAndView();
		UserInfo userInfo1 = userService.selectByPrimaryKey(id);
		mav.addObject("userInfo1", userInfo1);
		mav.setViewName("user/userCenter/editUser");
		return mav;
	}

	// 跳转密码修改
	@RequestMapping("/editPwd")
	public ModelAndView toEditPwd(int id) {
		ModelAndView mav = new ModelAndView();
		UserInfo userInfo1 = userService.selectByPrimaryKey(id);
		mav.addObject("userInfo1", userInfo1);
		mav.setViewName("user/userCenter/editPwd");
		return mav;
	}

	// 登陆处理
	@RequestMapping("/loginCheck")
	public ModelAndView loginCheck(UserInfo userInfo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		UserInfo userInfo1 = userService.login(userInfo);
		if (userInfo != null) {
			Date date = new Date();
			HttpSession session = request.getSession();
			session.setAttribute("isLogin", userInfo1.getUserId());
			java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			userInfo.setUserLastlogin(sqlDate);
			userService.updateLoginTime(userInfo);
			mav.setViewName("user/personal");
			mav.addObject("userInfo1", userInfo1);
		} else {
			mav.setViewName("user/login");
		}
		return mav;
	}

	// 注册处理
	@RequestMapping("/registerOn")
	public ModelAndView register(UserInfo userInfo) {
		ModelAndView mav = new ModelAndView();
		Date date = new Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		userInfo.setUserRegtime(sqlDate);
		// userService.register(userInfo);
		// mav.setViewName("user/login");
		if (userService.register(userInfo))
			mav.setViewName("user/login");// 注册成功
		else
			mav.setViewName("user/register");// 注册失败
		return mav;
	}

	// 修改基本信息
	@RequestMapping("/editUserCheck")
	public ModelAndView editUserCheck(UserInfo userInfo){
		ModelAndView mav = new ModelAndView();
//		//上传图片
//		System.out.println("loading>>");
//		String path = request.getSession().getServletContext().getRealPath("/img/user");
//		System.out.println("path>>" + path);
//
//		String fileName = file.getOriginalFilename();
//		System.out.println("fileName>>" + fileName);
//
//		File dir = new File(path, fileName);
//		System.out.println("dir.exists()>>" + dir.exists());
//		if (!dir.exists()) {
//			dir.mkdirs();
//		}
//		System.out.println("dir.exists()>>" + dir.exists());
//		// MultipartFile自带的解析方法
//		file.transferTo(dir);
		//上传结束
		String imgSrc = "/img/user/" + userInfo.getUserAvatar();
		userInfo.setUserAvatar(imgSrc);
		UserInfo userInfo1 = userService.updateByPrimaryKeySelective(userInfo);
		if (userInfo != null) {
			mav.setViewName("user/userCenter/editUser_success");
			mav.addObject("userInfo1", userInfo1);
		} else {
			mav.addObject("userInfo1", userInfo);
			mav.setViewName("user/userCenter/editUser_fail");
		}
		return mav;
	}

	// 修改基本信息
	@RequestMapping("/editPwdCheck")
	public ModelAndView editPwdCheck(UserInfo userInfo, String userPwd1) {
		ModelAndView mav = new ModelAndView();
		if (userService.login(userInfo) != null) {
			userInfo.setUserPwd(userPwd1);
			userService.updateByPrimaryKeySelective(userInfo);
			mav.setViewName("user/userCenter/editPwd_success");
			mav.addObject("userInfo1", userInfo);
		} else {
			mav.setViewName("user/userCenter/editPwd_fail");
			mav.addObject("userInfo1", userInfo);
		}
		return mav;
	}
}
