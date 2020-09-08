package com.project.byk.le.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
}
