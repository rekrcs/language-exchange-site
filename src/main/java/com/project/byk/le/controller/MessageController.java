package com.project.byk.le.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.byk.le.dto.Member;
import com.project.byk.le.dto.Message;
import com.project.byk.le.service.MemberService;
import com.project.byk.le.service.MessageService;

@Controller
public class MessageController {
	@Autowired
	MessageService messageService;
	@Autowired
	MemberService memberService;

	@RequestMapping("/usr/message/message")
	public String showMessage(@RequestParam Map<String, Object> param, HttpSession session, Model model) {
		int fromMemberId = (int) session.getAttribute("loginedMemberId");
		int toMemberId = Integer.parseInt((String) param.get("id"));
		Member toMember = memberService.getMemberById(toMemberId);

		model.addAttribute("fromMemberId", fromMemberId);
		model.addAttribute("toMemberId", toMemberId);
		model.addAttribute("toMember", toMember.getNickname());
		return "message/message";
	}

	@RequestMapping("/usr/message/doWriteMsg")
	public String doWriteMsg(@RequestParam Map<String, Object> param, HttpSession session, Model model) {
		int fromMemberId = (int) session.getAttribute("loginedMemberId");
		int toMemberId = Integer.parseInt((String) param.get("id"));
		param.put("fromMemberId", fromMemberId);
		param.put("toMemberId", toMemberId);

		int loginedMemberId = (int) session.getAttribute("loginedMemberId");

		model.addAttribute("loginedMemberId", loginedMemberId);
		int newMsg = messageService.sendMsg(param);
		return "message/message";
	}

	@RequestMapping("/usr/message/doAddMessage")
	@ResponseBody
	public String doAddMessage(@RequestParam Map<String, Object> param, HttpSession session) {
		messageService.sendMsg(param);
		return " {\"msg\": \"sent\"}";
	}

	@RequestMapping("/usr/message/getMessagesFrom")
	@ResponseBody
	public Map<String, Object> getMessagesFrom(@RequestParam Map<String, Object> param) {

		List<Message> messages = messageService.getMessagesFrom(param);
		Map<String, Object> rs = new HashMap<>();
		rs.put("messages", messages);
		return rs;

	}
}
