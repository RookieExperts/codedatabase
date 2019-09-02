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
	/**
	 * 用户新增
	 * @param user
	 */
	public void addUser(User user);
	/**
	 * 用户删除
	 * @param user
	 */
	public int deleteUser(User user);
	/**
	 * 用户信息修改
	 * @param user
	 * @return 
	 */
	public int updateUser(User user);
}
