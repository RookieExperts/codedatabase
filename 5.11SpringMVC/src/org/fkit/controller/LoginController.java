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
	 * 	�û���¼
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/loginForm")
	public void login(@RequestBody User user,HttpServletResponse response,
			ModelAndView mv,HttpSession session) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		logger.info(mapper.writeValueAsString(user));
		System.out.println(user.getUserno()+"--------"+user.getPassword());
		//�����û�������������ݿ�����û����ҵ���ת���ɹ���ҳ�棬ʧ�ܸ�����ʾ
		int count = 0;
		count = this.userService.selectUser(user);
		if(count == 1) {
			user = this.userService.selectUserByWhere(user);
			//��user�Ž�session��
			session.setAttribute("user", user);
			response.setContentType("text/html;charset=UTF-8");
			//��book����ת����jsonд�����ͻ���
			response.getWriter().println(mapper.writeValueAsString(count));
			
		}else {
			
			response.setContentType("text/html;charset=UTF-8");
			
			//String message="��¼�����������";
			response.getWriter().println(mapper.writeValueAsString(count));
		}
		
	}
	@RequestMapping(value="/main")
	public String main() {
		
		return "main";
	}
}
