package com.project.byk.le.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.byk.le.service.MessageService;

@Controller
public class MessageController {
	@Autowired
	MessageService messageService;

	@RequestMapping("/usr/message/message")
	public String showMessage(@RequestParam Map<String, Object> param, HttpSession session, Model model) {
		int fromMemberId = (int) session.getAttribute("loginedMemberId");
		int toMemberId = Integer.parseInt((String) param.get("id"));

		model.addAttribute("fromMemberId", fromMemberId);
		model.addAttribute("toMemberId", toMemberId);
		return "message/message";
	}

	@RequestMapping("/usr/message/doWriteMsg")
	public String doWriteMsg(@RequestParam Map<String, Object> param, HttpSession session) {
		int fromMemberId = (int) session.getAttribute("loginedMemberId");
		int toMemberId = Integer.parseInt((String) param.get("id"));
		param.put("fromMemberId", fromMemberId);
		param.put("toMemberId", toMemberId);

		int newMsg = messageService.sendMsg(param);
		return "message/message";
	}

	@RequestMapping("/usr/message/doAddMessage")
	@ResponseBody
	public String doAddMessage(@RequestParam Map<String, Object> param, HttpSession session) {
		messageService.sendMsg(param);
		return " {\"msg\": \"sent\"}";
		         

	}

}
