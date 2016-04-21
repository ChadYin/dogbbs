package com.db.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.db.model.Reply;
import com.db.model.Topic;
import com.db.service.ReplyService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Scope("request")
@Controller("replyAction")
@SuppressWarnings("serial")
public class ReplyAction extends ActionSupport {
	private Reply reply;
	private String u_name;
	private Topic topic;

	// 分页
	private int start;
	private int end;
	private int page = 1;

	@Autowired
	@Qualifier("replyServiceImpl")
	private ReplyService replyService;

	public String replylist() throws Exception {
		start = (page - 1) * 10;
		end = 10;
		int t_id = topic.getT_id();
		List<Reply> replylist = replyService.replylist(t_id);
		List<Topic> replylists = replyService.replylists(start, end, t_id);
		int total = replylist.size();
	
		int pages = (total + end - 1) / end;
		if(total==0){
			pages=1;
			page=1;
		}
		ActionContext.getContext().put("topic", topic);
		ActionContext.getContext().put("u_name", u_name);
		ActionContext.getContext().put("replylists", replylists);
		ActionContext.getContext().put("pages", pages);
		ActionContext.getContext().put("page", page);
		return SUCCESS;
	}

	public String addreply() throws Exception {
		boolean ok = replyService.addreply(reply);
		if (ok == true) {
			replylist();
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String deletereply() throws Exception {
		boolean ok = replyService.deletereply(reply);
		if (ok == true) {
			replylist();
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String userreply() throws Exception {
		List<Reply> userreply = replyService.userreply(reply);
		ActionContext.getContext().put("userreply", userreply);
		return SUCCESS;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public ReplyService getReplyService() {
		return replyService;
	}

	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

}
