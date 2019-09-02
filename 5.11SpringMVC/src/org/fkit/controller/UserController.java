package org.fkit.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.fkit.model.User;
import org.fkit.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

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
	
	/**
	 * 用户新增
	 * @throws IOException 
	 * @throws JsonProcessingException 
	 */
	@RequestMapping("/addUser")
	public String addUser(@ModelAttribute User user,Model model,HttpServletResponse response) {
		ObjectMapper mapper = new ObjectMapper();
		int count =0;
        count = this.userService.selectUser(user);
        if(count == 0) {
        	this.userService.addUser(user);
        }else {
        	try {
				response.getWriter().println(mapper.writeValueAsString("用户号已存在！"));
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
        }
		//新增成功之后
		List<User> listUser = this.userService.selectUserAll();
		model.addAttribute("listUser", listUser);
		return "EmployeeMgr";
	}
	/**
	 * 用户详情页面
	 * @return
	 */
	@RequestMapping("/userInfo")
	public String userInfo(@RequestParam("id") String id,Model model) {
		User user= new User();
		user.setId(Integer.valueOf(id));
		user = this.userService.selectUserByWhere(user);
		model.addAttribute("user", user);
		return "userInfo";
	}
	/**
	 * 用户删除
	 */
	@RequestMapping("/deleteUser")
	public void deleteUser(@RequestBody User user,Model model,HttpServletResponse response) {
		ObjectMapper mapper = new ObjectMapper();
		int count = this.userService.deleteUser(user);
		//删除成功之后
		try {
			response.getWriter().println(mapper.writeValueAsString(count));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 跳转到修改信息详情页
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/updateUserInfo")
	public String updateUserInfo(@RequestParam("id") String id,Model model) {
		User user= new User();
		user.setId(Integer.valueOf(id));
		user = this.userService.selectUserByWhere(user);
		model.addAttribute("user", user);
		return "updateUser";
	}
	/**
	 * updateUserSave
	 */
	@RequestMapping("/updateUserSave")
	public void updateUserSave(@RequestBody User user,Model model,HttpServletResponse response) {
		int count = this.userService.updateUser(user);
		ObjectMapper mapper = new ObjectMapper();
		try {
			response.getWriter().println(mapper.writeValueAsString(count));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//return "EmployeeMgr";
	}
}
