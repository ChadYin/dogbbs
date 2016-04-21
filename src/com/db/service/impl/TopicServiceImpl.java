package com.db.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.db.dao.TopicDao;
import com.db.model.Topic;
import com.db.service.TopicService;

@Scope("singleton")
@Service("topicServiceImpl")
public class TopicServiceImpl implements TopicService {

	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;
	
	@Override
	public List<Topic> topiclist(String s_name) {
		TopicDao topicDao = SqlSessionTemplate.getMapper(TopicDao.class);
		return topicDao.topiclist(s_name);
	}

	@Override
	public boolean addtopic(Topic topic) {
		TopicDao topicDao = SqlSessionTemplate.getMapper(TopicDao.class);
		return topicDao.addtopic(topic);
	}

	@Override
	public boolean deletetopic(Topic topic) {
		TopicDao topicDao = SqlSessionTemplate.getMapper(TopicDao.class);
		return topicDao.deletetopic(topic);
	}

	@Override
	public List<Topic> usertopic(Topic topic) {
		TopicDao topicDao = SqlSessionTemplate.getMapper(TopicDao.class);
		return topicDao.usertopic(topic);
	}

	@Override
	public List<Topic> topiclists(int start, int end, String s_name) {
		TopicDao topicDao = SqlSessionTemplate.getMapper(TopicDao.class);
		return topicDao.topiclists(start,end,s_name);
	}

	@Override
	public List<Topic> searchtopic(String searchtopic) {
		TopicDao topicDao = SqlSessionTemplate.getMapper(TopicDao.class);
		return topicDao.searchtopic(searchtopic);
	}









}
