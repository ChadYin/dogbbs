package com.db.service;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.db.model.Topic;

@Scope("singleton")
@Service("topicService")
public interface TopicService {

	List<Topic> topiclist(String s_name);

	boolean addtopic(Topic topic);

	boolean deletetopic(Topic topic);

	List<Topic> usertopic(Topic topic);

	List<Topic> topiclists(int start, int end, String s_name);

	List<Topic> searchtopic(String searchtopic);

}
