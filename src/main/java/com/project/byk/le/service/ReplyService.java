package com.project.byk.le.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.byk.le.dao.ReplyDao;
import com.project.byk.le.dto.Reply;
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

	public List<Reply> getForPrintArticleReplies(int articleId, int from) {
		return replyDao.getForPrintArticleReplies(articleId, from);
	}

	public int deleteArticleReply(int id) {
		return replyDao.deleteArticleReply(id);

	}

	public Map<String, Object> modifyReply(Map<String, Object> param) {
		replyDao.modifyArticleReply(param);
		Map<String, Object> rs = new HashMap<>();

		rs.put("msg", String.format("You have modified your reply"));
		return rs;
	}

}
