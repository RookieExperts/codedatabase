package org.fkit.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.fkit.dao.UserMapper;
import org.fkit.model.User;
import org.fkit.service.IUserService;
import org.springframework.stereotype.Service;


@Service("userService")
public class UserServiceImpl implements IUserService {

	@Resource
	private UserMapper userMapper;
	@Override
	public User selectUserByWhere(User user) {
		// TODO Auto-generated method stub
		return this.userMapper.selectUserByWhere(user);
	}

	public int selectUser(User user) {
		return this.userMapper.selectUser(user);
	}

	/**
	 * 查询所有的用户信息
	 */
	@Override
	public List<User> selectUserAll() {
		// TODO Auto-generated method stub
		return this.userMapper.selectUserAll();
	}
	/**
	 * 用户新增
	 */
	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		//设置用户的默认密码为666666
		
		user.setPassword("666666");
		/**
		 * 根据身份证号获取用户的年龄
		 */
		String year = user.getIdCardNo().substring(6).substring(0, 4);// 得到年份		
		String yue = user.getIdCardNo().substring(10).substring(0, 2);// 得到月份
		Date date = new Date();// 得到当前的系统时间
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String fyear = format.format(date).substring(0, 4);// 当前年份
        String fyue = format.format(date).substring(5, 7);// 月份
        int age=0;
        if (Integer.parseInt(yue) <= Integer.parseInt(fyue)) { // 当前月份大于用户出身的月份表示已过生
            age = Integer.parseInt(fyear) - Integer.parseInt(year) + 1;
        } else {// 当前用户还没过生
            age = Integer.parseInt(fyear) - Integer.parseInt(year);
        }
        user.setAge(age);
        
		this.userMapper.addUser(user);
	}
	/**
	 * 用户删除
	 */
	@Override
	public int deleteUser(User user) {
		return this.userMapper.deleteUser(user);
	}
	/**
	 * 用户信息修改
	 */
	
	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		/**
		 * 根据身份证号获取用户的年龄
		 */
		String year = user.getIdCardNo().substring(6).substring(0, 4);// 得到年份		
		String yue = user.getIdCardNo().substring(10).substring(0, 2);// 得到月份
		Date date = new Date();// 得到当前的系统时间
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String fyear = format.format(date).substring(0, 4);// 当前年份
        String fyue = format.format(date).substring(5, 7);// 月份
        int age=0;
        if (Integer.parseInt(yue) <= Integer.parseInt(fyue)) { // 当前月份大于用户出身的月份表示已过生
            age = Integer.parseInt(fyear) - Integer.parseInt(year) + 1;
        } else {// 当前用户还没过生
            age = Integer.parseInt(fyear) - Integer.parseInt(year);
        }
        user.setAge(age);
		int count = this.userMapper.updateUser(user);
		return count;
	}
}
