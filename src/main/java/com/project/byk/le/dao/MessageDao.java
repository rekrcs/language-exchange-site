package com.project.byk.le.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.byk.le.dto.Message;

@Mapper
public interface MessageDao {

	int sendMsg(Map<String, Object> param);

	List<Message> getMessagesFrom(Map<String, Object> param);

	Message getLastMessage(Map<String, Object> param);

}
