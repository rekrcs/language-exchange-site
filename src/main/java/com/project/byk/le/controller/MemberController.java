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
		String name = (String) param.get("name");
		Member member = memberService.getLoginIdByEmail(param);
		if (member == null) {
			return String.format("<script>alert('Please check your Name and Email'); history.back();</script>");
		}
		if (member.getName().equals(name) == false) {
			return String.format("<script>alert('Please check your Name and Email'); history.back();</script>");
		}
		return String.format("<script>alert('I sent your ID to %s.'); location.replace('../member/login');</script>",
				member.getEmail());
	}

	@RequestMapping("usr/member/profile")
	public String showProfile(Model model, HttpSession session) {
		int loginedMemberId = (int) session.getAttribute("loginedMemberId");
		Member member = memberService.getMemberById(loginedMemberId);
		model.addAttribute("member", member);
		return "member/profile";
	}

	@RequestMapping("usr/member/modifyProfile")
	public String showModifyProfile(Model model, HttpSession session) {
		int loginedMemberId = (int) session.getAttribute("loginedMemberId");
		Member member = memberService.getMemberById(loginedMemberId);
		model.addAttribute("member", member);
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
				"<script>alert(\"%s's profile has been modified\" ); location.replace('../home/main');</script>",
				member.getNickname());
	}

	@RequestMapping("usr/member/checkPw")
	public String showCheckPw() {
		return "member/checkPw";
	}

	@RequestMapping("usr/member/doCheckPw")
	@ResponseBody
	public String doCheckPw(@RequestParam Map<String, Object> param, HttpSession session) {
		int loginedMemberId = (int) session.getAttribute("loginedMemberId");
		Member member = memberService.getMemberById(loginedMemberId);
		String loginPw = (String) param.get("loginPw");
		if (member.getLoginPw().equals(loginPw)) {
			return "<script>location.replace('../member/modifyProfile');</script>";
		}
		return String.format("<script>alert('Please check your Password'); history.back();</script>");
	}

	@RequestMapping("usr/member/forgotPw")
	public String showForgotPw() {
		return "member/forgotPw";
	}

	@RequestMapping("usr/member/doForgotPw")
	@ResponseBody
	public String doForgotPw(@RequestParam Map<String, Object> param) {
		String name = (String) param.get("name");
		String loginId = (String) param.get("loginId");
		Member member = memberService.getLoginIdByEmail(param);
		if (member == null) {
			return String.format("<script>alert('Please check your ID, Name and Email'); history.back();</script>");
		}
		if (member.getName().equals(name) && member.getLoginId().equals(loginId) == false) {
			return String.format("<script>alert('Please check your ID, Name and Email'); history.back();</script>");
		}
		return String.format(
				"<script>alert('I sent your Password code to %s.'); location.replace('../member/login');</script>",
				member.getEmail());
	}

	@RequestMapping("usr/member/doLogout")
	@ResponseBody
	public String doLogout(HttpSession session) {
		session.removeAttribute("loginedMemberId");
		return String
				.format("<script> alert('You have been logged out.'); location.replace('../home/main'); </script>");
	}

}
