package com.project.byk.le.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {
	@Autowired
	MessageController messageController;

	@RequestMapping("usr/message/message")
	public String showMessage(@RequestParam Map<String, Object> param) {
		return "message/message";
	}

	@RequestMapping("usr/message/doWriteMsg")
	public String doWriteMsg(@RequestParam Map<String, Object> param, HttpSession session) {
		int fromMember = (int) session.getAttribute("loginedMemberId");
		int toMember = Integer.parseInt((String) param.get("id"));
		return "message/message";
	}
}
