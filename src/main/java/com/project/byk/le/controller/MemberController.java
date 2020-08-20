package com.project.byk.le.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
	@ResponseBody
	public String doLogin(@RequestParam Map<String, Object> param, HttpSession session) {
		Member member = memberService.login(param);
		String loginPw = (String) param.get("loginPw");

		if (member == null) {
			return String.format("<script>alert('Please check your ID or Password'); history.back();</script>");
		}

		if (member.getLoginPw().equals(loginPw) == false) {
			return String.format("<script>alert('Please check your ID or Password'); history.back();</script>");
		}

		if (member.getLoginPw().equals(loginPw)) {
			session.setAttribute("loginedMemberId", member.getId());
		}
		return String.format("<script>alert('%s has been logged in.'); location.replace('../home/main');</script>",
				member.getLoginId());
	}

	@RequestMapping("usr/member/forgotId")
	public String showForgotId() {
		return "member/forgotId";
	}

	@RequestMapping("usr/member/doForgotId")
	@ResponseBody
	public String doForgotId(@RequestParam Map<String, Object> param) {
		String findId = memberService.getLoginIdByEmail(param);
		return findId;
	}

	@RequestMapping("usr/member/myPage")
	public String showMyPage(Model model, HttpSession session) {
		int loginedMemberId = (int) session.getAttribute("loginedMemberId");
		Member member = memberService.getMemberById(loginedMemberId);
		model.addAttribute(member);
		return "member/myPage";
	}

	@RequestMapping("usr/member/modifyProfile")
	public String showModifyProfile(Model model, HttpSession session) {
		int loginedMemberId = (int) session.getAttribute("loginedMemberId");
		Member member = memberService.getMemberById(loginedMemberId);
		model.addAttribute(member);
		return "member/modifyProfile";
	}

	@RequestMapping("usr/member/doModifyProfile")
	@ResponseBody
	public String doModifyProfile(@RequestParam Map<String, Object> param, HttpSession session) {
		int loginedMemberId = (int) session.getAttribute("loginedMemberId");
		param.put("id", loginedMemberId);
		Member member = memberService.getMemberById(loginedMemberId);
		int updateMember = memberService.update(param);
		return String.format(
				"<script>alert(\"%s's profile has been modified\" ); location.replace('../member/login');</script>",
				member.getNickname());
	}
}
