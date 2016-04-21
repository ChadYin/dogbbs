package com.db.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.db.model.Topic;
import com.db.service.TopicService;
import com.db.service.impl.TopicServiceImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Scope("request")
@Controller("topicAction")
@SuppressWarnings("serial")
public class TopicAction extends ActionSupport {

	private Topic topic;
	private String s_name;
	private int s_id;
	private String searchtopic;

	// 分页
	private int start;
	private int end;
	private int page = 1;

	@Autowired
	@Qualifier("topicServiceImpl")
	private TopicService topicService;

	public String topiclist() throws Exception {
		start = (page - 1) * 10;
		end = 10;
		List<Topic> topiclist = topicService.topiclist(s_name);
		int total = topiclist.size();
		List<Topic> topiclists = topicService.topiclists(start, end,s_name);
		int pages = (total + end - 1) / end;
		if(total==0){
			pages=1;
			page=1;
		}
		ActionContext.getContext().put("topiclists", topiclists);
		ActionContext.getContext().put("s_name", s_name);
		ActionContext.getContext().put("s_id", s_id);
   		ActionContext.getContext().put("pages", pages);
		return SUCCESS;
	}

	public String addtopic() throws Exception {
		boolean ok = topicService.addtopic(topic);
		if (ok == true) {
			topiclist();
		
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String deletetopic() throws Exception {
		boolean ok = topicService.deletetopic(topic);
		if (ok == true) {
			topiclist();
			return SUCCESS;
		} else {
			return INPUT;
		}
	}

	public String usertopic() throws Exception {
		List<Topic> usertopic = topicService.usertopic(topic);
		ActionContext.getContext().put("usertopic", usertopic);
		return SUCCESS;
	}
	
	public String searchtopic() throws Exception{
		List<Topic> topiclists = topicService.searchtopic(searchtopic);
		ActionContext.getContext().put("topiclists", topiclists);
		ActionContext.getContext().put("aa", 11);
		return SUCCESS;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public TopicService getTopicService() {
		return topicService;
	}

	public void setTopicService(TopicService topicService) {
		this.topicService = topicService;
	}

	public int getS_id() {
		return s_id;
	}

	public void setS_id(int s_id) {
		this.s_id = s_id;
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

	public String getSearchtopic() {
		return searchtopic;
	}

	public void setSearchtopic(String searchtopic) {
		this.searchtopic = searchtopic;
	}

}
