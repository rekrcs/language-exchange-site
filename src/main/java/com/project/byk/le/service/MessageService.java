package com.project.byk.le.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.byk.le.dao.MessageDao;

@Service
public class MessageService {
	@Autowired
	private MessageDao messageDao;

	public int sendMsg(Map<String, Object> param) {
		return messageDao.sendMsg(param);
	}
}
