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

import com.project.byk.le.dto.Attr;
import com.project.byk.le.dto.Member;
import com.project.byk.le.dto.Message;
import com.project.byk.le.service.AttrService;
import com.project.byk.le.service.MemberService;
import com.project.byk.le.service.MessageService;
import com.project.byk.le.util.Util;

@Controller
public class MessageController {
	@Autowired
	MessageService messageService;
	@Autowired
	MemberService memberService;
	@Autowired
	AttrService attrService;

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

		int loginedMemberId = (int) session.getAttribute("loginedMemberId");
		Message message = messageService.getLastMessage(param);

		Attr msgRoomCheck1 = attrService.get(String.format("msgRoom__0__%s__%s", (String) param.get("fromMemberId"),
				(String) param.get("toMemberId")));
		Attr msgRoomCheck2 = attrService.get(String.format("msgRoom__0__%s__%s", (String) param.get("toMemberId"),
				(String) param.get("fromMemberId")));

		System.out.println("msgRoomCheck1 : " + msgRoomCheck1);
		System.out.println("msgRoomCheck2 : " + msgRoomCheck2);

		if (msgRoomCheck1 == null && msgRoomCheck2 == null) {
			attrService.setValue(String.format("msgRoom__0__%s__%s", (String) param.get("fromMemberId"),
					(String) param.get("toMemberId")), message.getBody(), null);
		}

		if (msgRoomCheck1 == null && msgRoomCheck2 != null) {
			attrService.setValue(String.format("msgRoom__0__%s__%s", (String) param.get("toMemberId"),
					(String) param.get("fromMemberId")), message.getBody(), null);
		}

		if (msgRoomCheck2 == null && msgRoomCheck1 != null) {
			attrService.setValue(String.format("msgRoom__0__%s__%s", (String) param.get("fromMemberId"),
					(String) param.get("toMemberId")), message.getBody(), null);
		}
		return " {\"msg\": \"sent\"}";
	}

	@RequestMapping("/usr/message/getMessagesFrom")
	@ResponseBody
	public Map<String, Object> getMessagesFrom(@RequestParam Map<String, Object> param, HttpSession session) {

		List<Message> messages = messageService.getMessagesFrom(param);
		Map<String, Object> rs = new HashMap<>();
		rs.put("messages", messages);

//		int loginedMemberId = (int) session.getAttribute("loginedMemberId");
//		Message message = messageService.getLastMessage(param);
//		Attr msgRoomCheck1 = attrService.get(String.format("msgRoom__0__%s__%s", (String) param.get("fromMemberId"),
//				(String) param.get("toMemberId")));
//		Attr msgRoomCheck2 = attrService.get(String.format("msgRoom__0__%s__%s", (String) param.get("toMemberId"),
//				(String) param.get("fromMemberId")));
//		if (msgRoomCheck1 == null) {
//			attrService.setValue(String.format("msgRoom__0__%s__%s", (String) param.get("toMemberId"),
//					(String) param.get("fromMemberId")), message.getBody(), null);
//		}
//
//		if (msgRoomCheck2 == null) {
//			attrService.setValue(String.format("msgRoom__0__%s__%s", (String) param.get("fromMemberId"),
//					(String) param.get("toMemberId")), message.getBody(), null);
//		}
		return rs;

	}

	@RequestMapping("/usr/message/msgList")
	public String showMsgList(HttpSession session, Model model) {
		int loginedMemberId = (int) session.getAttribute("loginedMemberId");
		List<Attr> attrForMsgs = attrService.getAttrListById(loginedMemberId + "");

		model.addAttribute("attrForMsgs", attrForMsgs);
		return "message/msgList";

	}
}
