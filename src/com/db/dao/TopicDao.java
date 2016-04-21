package com.db.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.db.model.Topic;

public interface TopicDao {

	List<Topic> topiclist(String s_name);

	boolean addtopic(Topic topic);

	boolean deletetopic(Topic topic);

	List<Topic> usertopic(Topic topic);

	List<Topic> topiclists(@Param("start")  int start,@Param("end")  int end,@Param("s_name")  String s_name);

	List<Topic> searchtopic(@Param("searchtopic") String searchtopic);

}
