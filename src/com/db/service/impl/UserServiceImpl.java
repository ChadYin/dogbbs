package com.db.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.db.dao.UserDao;
import com.db.model.User;
import com.db.service.UserService;

@Scope("singleton")
@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;

	@Override
	public User login(User user) {
		UserDao userDao = SqlSessionTemplate.getMapper(UserDao.class);
		return userDao.login(user);
	}

	@Override
	public boolean regist(User user) {
		UserDao userDao = SqlSessionTemplate.getMapper(UserDao.class);
		return userDao.regist(user);
	}

	@Override
	public boolean updatepassword(User user) {
		UserDao userDao = SqlSessionTemplate.getMapper(UserDao.class);
		return userDao.updatepassword(user);
	}

	@Override
	public boolean updateuserinfo(User user) {
		UserDao userDao = SqlSessionTemplate.getMapper(UserDao.class);
		return userDao.updateuserinfo(user);
	}

	@Override
	public List<User> userlist() {
		UserDao userDao = SqlSessionTemplate.getMapper(UserDao.class);
		return userDao.userlist();
	}

	@Override
	public boolean forbid(User user) {
		UserDao userDao = SqlSessionTemplate.getMapper(UserDao.class);
		return userDao.forbid(user);
	}

	@Override
	public List<User> forbiduserlist() {
		UserDao userDao = SqlSessionTemplate.getMapper(UserDao.class);
		return userDao.forbiduserlist();
	}

	@Override
	public boolean outforbid(User user) {
		UserDao userDao = SqlSessionTemplate.getMapper(UserDao.class);
		return userDao.outforbid(user);
	}

	@Override
	public List<User> searchuser(String searchuser) {
		UserDao userDao = SqlSessionTemplate.getMapper(UserDao.class);
		return userDao.searchuser(searchuser);
	}

	@Override
	public User checkname(String u_name) {
		UserDao userDao = SqlSessionTemplate.getMapper(UserDao.class);
		return userDao.checkuname(u_name);
	}

}
