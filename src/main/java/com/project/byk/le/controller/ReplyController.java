package com.project.byk.le.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.byk.le.dto.Reply;
import com.project.byk.le.service.ReplyService;

@Controller
public class ReplyController {
	@Autowired
	ReplyService replyService;

	@RequestMapping("/usr/reply/doWriteReplyAjax")
	@ResponseBody
	public String doWriteReplyAjax(@RequestParam Map<String, Object> param) {
		int newArticleReply = replyService.writeReply(param);
		return "{\"msg\" : \"you wrote a reply\"}";
	}

	@RequestMapping("/usr/reply/getForPrintArticleRepliesRs")
	@ResponseBody
	public Map<String, Object> getForPrintArticleRepliesRs(int articleId, int from) {
		List<Reply> articleReplies = replyService.getForPrintArticleReplies(articleId, from);
		Map<String, Object> rs = new HashMap<>();
		rs.put("articleReplies", articleReplies);
		return rs;
	}

	@RequestMapping("/usr/reply/doDeleteReplyAjax")
	@ResponseBody
	public String doDeleteReply(int id, HttpServletRequest request) {

		int loginedMemberId = (int) request.getAttribute("loginedMemberId");
		int deletedReply = replyService.deleteArticleReply(id);

		return "{\"msg\" : \"You have deleted your reply\"}";
	}

	@RequestMapping("/usr/reply/doModifyReplyAjax")
	@ResponseBody
	public String doModifyReplyAjax(@RequestParam Map<String, Object> param, HttpServletRequest request) {
		int loginedMemberId = (int) request.getAttribute("loginedMemberId");
		System.out.println(param);
		int id = Integer.parseInt((String) param.get("id"));

		Map<String, Object> rs = replyService.modifyReply(param);
		System.out.println(rs);
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		return "";
	}
}
