package org.fkit.dao;

import java.util.List;

import org.fkit.model.User;

public interface UserMapper {

	public User selectUserByWhere(User user);

	public int selectUser(User user);

	/**
	 * ��ѯ���е��û���Ϣ
	 * @return
	 */
	public List<User> selectUserAll();
}
