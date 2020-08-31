package com.project.byk.le.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {
	@Autowired
	MessageController messageController;

	@RequestMapping("usr/message/message")
	public String showMessage() {
		return "message/message";
	}
}
