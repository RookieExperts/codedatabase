package org.fkit.dao;

import java.util.List;

import org.fkit.model.User;

public interface UserMapper {

	public User selectUserByWhere(User user);

	public int selectUser(User user);

	/**
	 * 查询所有的用户信息
	 * @return
	 */
	public List<User> selectUserAll();
}
