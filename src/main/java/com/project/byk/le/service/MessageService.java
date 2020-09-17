package com.project.byk.le.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.byk.le.dao.MessageDao;
import com.project.byk.le.dto.Message;

@Service
public class MessageService {
	@Autowired
	private MessageDao messageDao;

	public int sendMsg(Map<String, Object> param) {
		return messageDao.sendMsg(param);
	}

	public List<Message> getMessagesFrom(Map<String, Object> param) {
		return messageDao.getMessagesFrom(param);
	}
}
