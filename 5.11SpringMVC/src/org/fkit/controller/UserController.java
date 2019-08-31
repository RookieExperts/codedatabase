package org.fkit.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.fkit.model.User;
import org.fkit.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	private static final Log logger = LogFactory.getLog(LoginController.class);
	
	@Resource
	private IUserService userService;

	/**
	 * 查询所有用户
	 */
	
	@RequestMapping("/employeeMgr")
	public String selectUserAll(Model model){
		List<User> listUser = this.userService.selectUserAll();
		model.addAttribute("listUser", listUser);
		return "EmployeeMgr";
	}
}
