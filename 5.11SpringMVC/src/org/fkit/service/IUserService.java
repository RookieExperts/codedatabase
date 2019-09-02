package org.fkit.service;

import java.util.List;

import org.fkit.model.User;

public interface IUserService {
	public User selectUserByWhere(User user);
	
	public int selectUser(User user);

	/**
	 * 查询所有的用户信息
	 * @return
	 */
	public List<User> selectUserAll();
	/**
	 * 用户新增
	 * @param user
	 */
	public void addUser(User user);
	/**
	 * 用户删除
	 * @param user
	 * @return 
	 */
	public int deleteUser(User user);
	/**
	 * 用户信息修改
	 * @param user
	 * @return 
	 */
	public int updateUser(User user);
}
