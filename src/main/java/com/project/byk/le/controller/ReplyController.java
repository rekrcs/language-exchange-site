package com.project.byk.le.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
