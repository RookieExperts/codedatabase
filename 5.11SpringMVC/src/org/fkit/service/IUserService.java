package org.fkit.service;

import org.fkit.model.User;

public interface IUserService {
	public User selectUserByWhere(User user);
	
	public int selectUser(User user);
}
