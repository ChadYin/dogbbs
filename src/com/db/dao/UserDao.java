package com.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.db.model.User;

public interface UserDao {

	User login(User user);

	boolean regist(User user);

	boolean updatepassword(User user);

	boolean updateuserinfo(User user);

	List<User> userlist();

	boolean forbid(User user);

	List<User> forbiduserlist();

	boolean outforbid(User user);

	List<User> searchuser(@Param("searchuser") String searchuser);

}
