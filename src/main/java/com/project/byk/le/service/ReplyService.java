package com.project.byk.le.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.byk.le.dao.ReplyDao;
import com.project.byk.le.util.Util;

@Service
public class ReplyService {
	@Autowired
	ReplyDao replyDao;

	public int writeReply(Map<String, Object> param) {
		replyDao.writeReply(param);
		int id = Util.getAsInt(param.get("id"));
		return id;
	}
}
