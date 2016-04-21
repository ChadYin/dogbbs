package com.db.service;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.db.model.User;
@Scope("singleton")
@Service("userService")
public interface UserService {

	User login(User user);

	boolean regist(User user);

	boolean updatepassword(User user);

	boolean updateuserinfo(User user);

	List<User> userlist();

	boolean forbid(User user);

	List<User> forbiduserlist();

	boolean outforbid(User user);

	List<User> searchuser(String searchuser);

}
