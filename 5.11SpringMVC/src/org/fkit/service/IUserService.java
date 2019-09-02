package org.fkit.service;

import java.util.List;

import org.fkit.model.User;

public interface IUserService {
	public User selectUserByWhere(User user);
	
	public int selectUser(User user);

	/**
	 * ��ѯ���е��û���Ϣ
	 * @return
	 */
	public List<User> selectUserAll();
	/**
	 * �û�����
	 * @param user
	 */
	public void addUser(User user);
	/**
	 * �û�ɾ��
	 * @param user
	 * @return 
	 */
	public int deleteUser(User user);
	/**
	 * �û���Ϣ�޸�
	 * @param user
	 * @return 
	 */
	public int updateUser(User user);
}
