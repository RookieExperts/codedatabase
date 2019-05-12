package org.fkit.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.fkit.model.User;
import org.fkit.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class LoginController {

	
	private static final Log logger = LogFactory.getLog(LoginController.class);
	
	@Resource
	private IUserService userService;
	
	
	@RequestMapping(value="/{formName}")
	public String loginForm(@PathVariable String formName) {
		
		return formName;
	}
	
	/**
	 * 	用户登录
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/loginForm")
	public void login(@RequestBody User user,HttpServletResponse response,
			ModelAndView mv,HttpSession session) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		logger.info(mapper.writeValueAsString(user));
		System.out.println(user.getUserno()+"--------"+user.getPassword());
		//根据用户名和密码从数据库查找用户，找到跳转到成功的页面，失败给出提示
		int count = 0;
		count = this.userService.selectUser(user);
		if(count == 1) {
			user = this.userService.selectUserByWhere(user);
			//把user放进session中
			session.setAttribute("user", user);
			response.setContentType("text/html;charset=UTF-8");
			//将book对象转换成json写出到客户端
			response.getWriter().println(mapper.writeValueAsString(count));
			
		}else {
			
			response.setContentType("text/html;charset=UTF-8");
			
			//String message="登录名或密码错误";
			response.getWriter().println(mapper.writeValueAsString(count));
		}
		
	}
	@RequestMapping(value="/main")
	public String main() {
		
		return "main";
	}
}
