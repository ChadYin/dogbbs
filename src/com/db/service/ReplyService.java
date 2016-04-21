package com.db.service;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.db.model.Reply;
import com.db.model.Topic;


@Scope("singleton")
@Service("replyService")
public interface ReplyService {

	List<Reply> replylist(int t_id);

	boolean addreply(Reply reply);

	boolean deletereply(Reply reply);

	List<Reply> userreply(Reply reply);

	List<Topic> replylists(int start, int end, int t_id);

}
