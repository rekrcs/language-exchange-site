package com.project.byk.le.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("usr/member/join")
	public String showJoin() {
		return "member/join";
	}
}
