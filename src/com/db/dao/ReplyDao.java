package com.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.db.model.Reply;
import com.db.model.Topic;

public interface ReplyDao {

	List<Reply> replylist(@Param("t_id") int t_id);

	boolean addreply(Reply reply);

	boolean deletereply(Reply reply);

	List<Reply> userreply(Reply reply);

	List<Topic> replylists(@Param("start") int start, @Param("end") int end,
			@Param("t_id") int t_id);

}
