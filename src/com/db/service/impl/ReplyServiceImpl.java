package com.db.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.db.dao.ReplyDao;
import com.db.model.Reply;
import com.db.model.Topic;
import com.db.service.ReplyService;

@Scope("singleton")
@Service("replyServiceImpl")
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;

	@Override
	public List<Reply> replylist(int t_id)  {
		ReplyDao replyDao = SqlSessionTemplate.getMapper(ReplyDao.class);
		return replyDao.replylist(t_id);
	}

	@Override
	public boolean addreply(Reply reply) {
		ReplyDao replyDao = SqlSessionTemplate.getMapper(ReplyDao.class);
		return replyDao.addreply(reply);
	}

	@Override
	public boolean deletereply(Reply reply) {
		ReplyDao replyDao = SqlSessionTemplate.getMapper(ReplyDao.class);
		return replyDao.deletereply(reply);
	}

	@Override
	public List<Reply> userreply(Reply reply) {
		ReplyDao replyDao = SqlSessionTemplate.getMapper(ReplyDao.class);
		return replyDao.userreply(reply);
	}

	@Override
	public List<Topic> replylists(int start, int end, int t_id) {
		ReplyDao replyDao = SqlSessionTemplate.getMapper(ReplyDao.class);
		return replyDao.replylists(start, end,t_id);
	}



}
