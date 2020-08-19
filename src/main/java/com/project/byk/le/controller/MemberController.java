package com.project.byk.le.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.byk.le.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("usr/member/join")
	public String showJoin() {
		return "member/join";
	}

	@RequestMapping("usr/member/doJoin")
	public String doJoin(@RequestParam Map<String, Object> parm, Model model) {
		int newMemberId = memberService.join(parm);
		return "home/main";

	}
}
