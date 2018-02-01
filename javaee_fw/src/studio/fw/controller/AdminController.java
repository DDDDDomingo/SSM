package studio.fw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import studio.fw.entity.AdminInfo;
import studio.fw.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/login")
	public ModelAndView toLogin() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/adminLogin");
		return mav;
	}
	
	@RequestMapping("/loginCheck")
	public ModelAndView loginCheck(AdminInfo adminInfo) {
		ModelAndView mav = new ModelAndView();
		AdminInfo adminInfo2 = adminService.loginCheck(adminInfo);
		if(adminInfo2!=null){
			mav.setViewName("/admin/manageIndex");
			mav.addObject("admin", adminInfo2);
		}else {
			mav.setViewName("/admin/manageIndex");
			mav.addObject("error", "账号密码错误");
		}
		return mav;
	}
	
	
}
