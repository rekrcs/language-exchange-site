package com.project.byk.le.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.byk.le.dto.Member;
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
	@ResponseBody
	public String doJoin(@RequestParam Map<String, Object> param, Model model) {
		int newMemberId = memberService.join(param);
		String newMember = (String) param.get("loginId");
		return String.format(
				"<script>alert('%s has been registered as a member.'); location.replace('../member/login');</script>",
				newMember);
	}

	@RequestMapping("usr/member/login")
	public String showLogin() {
		return "member/login";
	}

	@RequestMapping("usr/member/doLogin")
	public String doLogin(@RequestParam Map<String, Object> param, HttpSession session) {
		String loginStatus = memberService.login(param, session);
		return loginStatus;

	}
}
