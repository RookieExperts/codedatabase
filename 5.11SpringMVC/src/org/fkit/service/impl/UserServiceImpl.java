package org.fkit.service.impl;

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
}
