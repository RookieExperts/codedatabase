package org.fkit.dao;

import org.fkit.model.User;

public interface UserMapper {

	public User selectUserByWhere(User user);

	public int selectUser(User user);
}
