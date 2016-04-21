package com.db.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.db.model.User;
import com.db.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Scope("request")
@Controller("userAction")
@SuppressWarnings("serial")
public class UserAction extends ActionSupport {

	private User user;
	private String searchuser;
	
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public String login() throws Exception {
		User userinfo = userService.login(user);
		if (userinfo != null) {
			ActionContext.getContext().getSession().put("userinfo", userinfo);
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String regist() throws Exception {
		if (userService.regist(user)) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String updatepassword() throws Exception {
		boolean ok = userService.updatepassword(user);
		if (ok == true) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String updateuserinfo() throws Exception {
		boolean ok = userService.updateuserinfo(user);
		if (ok == true) {
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String userlist() throws Exception {
		List<User> userlist = userService.userlist();
		ActionContext.getContext().put("userlist", userlist);
		return SUCCESS;
	}

	public String forbid() throws Exception {
		boolean ok = userService.forbid(user);
		if (ok == true) {
			List<User> userlist = userService.userlist();
			ActionContext.getContext().put("userlist", userlist);
			return SUCCESS;
		} else {
			
			return INPUT;
		}
	}

	public String forbiduserlist() throws Exception {
		List<User> forbiduserlist = userService.forbiduserlist();
		ActionContext.getContext().put("forbiduserlist", forbiduserlist);
		return SUCCESS;
	}

	public String outforbid() throws Exception {
		boolean ok = userService.outforbid(user);
		if (ok == true) {
			List<User> forbiduserlist = userService.forbiduserlist();
			ActionContext.getContext().put("forbiduserlist", forbiduserlist);
			return SUCCESS;
		} else {
			return INPUT;
		}
	}
	public String searchuser() throws Exception{
		List<User> userlist = userService.searchuser(searchuser);
		ActionContext.getContext().put("userlist", userlist);
		return SUCCESS;
		
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getSearchuser() {
		return searchuser;
	}

	public void setSearchuser(String searchuser) {
		this.searchuser = searchuser;
	}

}
