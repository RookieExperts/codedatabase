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
	 * ��ѯ���е��û���Ϣ
	 */
	@Override
	public List<User> selectUserAll() {
		// TODO Auto-generated method stub
		return this.userMapper.selectUserAll();
	}
	/**
	 * �û�����
	 */
	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		//�����û���Ĭ������Ϊ666666
		
		user.setPassword("666666");
		/**
		 * �������֤�Ż�ȡ�û�������
		 */
		String year = user.getIdCardNo().substring(6).substring(0, 4);// �õ����		
		String yue = user.getIdCardNo().substring(10).substring(0, 2);// �õ��·�
		Date date = new Date();// �õ���ǰ��ϵͳʱ��
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String fyear = format.format(date).substring(0, 4);// ��ǰ���
        String fyue = format.format(date).substring(5, 7);// �·�
        int age=0;
        if (Integer.parseInt(yue) <= Integer.parseInt(fyue)) { // ��ǰ�·ݴ����û�������·ݱ�ʾ�ѹ���
            age = Integer.parseInt(fyear) - Integer.parseInt(year) + 1;
        } else {// ��ǰ�û���û����
            age = Integer.parseInt(fyear) - Integer.parseInt(year);
        }
        user.setAge(age);
        
		this.userMapper.addUser(user);
	}
	/**
	 * �û�ɾ��
	 */
	@Override
	public int deleteUser(User user) {
		return this.userMapper.deleteUser(user);
	}
	/**
	 * �û���Ϣ�޸�
	 */
	
	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		/**
		 * �������֤�Ż�ȡ�û�������
		 */
		String year = user.getIdCardNo().substring(6).substring(0, 4);// �õ����		
		String yue = user.getIdCardNo().substring(10).substring(0, 2);// �õ��·�
		Date date = new Date();// �õ���ǰ��ϵͳʱ��
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String fyear = format.format(date).substring(0, 4);// ��ǰ���
        String fyue = format.format(date).substring(5, 7);// �·�
        int age=0;
        if (Integer.parseInt(yue) <= Integer.parseInt(fyue)) { // ��ǰ�·ݴ����û�������·ݱ�ʾ�ѹ���
            age = Integer.parseInt(fyear) - Integer.parseInt(year) + 1;
        } else {// ��ǰ�û���û����
            age = Integer.parseInt(fyear) - Integer.parseInt(year);
        }
        user.setAge(age);
		int count = this.userMapper.updateUser(user);
		return count;
	}
}
