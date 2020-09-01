package com.project.byk.le.controller;

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
import com.project.byk.le.service.AttrService;
import com.project.byk.le.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private AttrService attrService;

	@RequestMapping("usr/member/join")
	public String showJoin() {
		return "member/join";
	}

	@RequestMapping("usr/member/doJoin")
	public String doJoin(@RequestParam Map<String, Object> param, Model model) {
		String newMember = (String) param.get("loginId");
		String newMemberEmail = (String) param.get("email");
		String newMemberNickname = (String) param.get("nickname");

		Member memberLoginId = memberService.getMemberByLoginId(param);
		if (!(memberLoginId == null)) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg",
					String.format("[Id : %s] is already in use. Please use another Id", newMember));

			return "common/redirect";
		}

		Member memberNickname = memberService.getMemberByNickname(param);
		if (!(memberNickname == null)) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg",
					String.format("[Nickname: %s] is already in use. Please use another Nickname", newMemberNickname));

			return "common/redirect";
		}

		Member memberEmail = memberService.getMemberByEmail(param);
		if (!(memberEmail == null)) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg",
					String.format("[Email: %s] is already in use. Please use another Email", newMemberEmail));

			return "common/redirect";
		}

		int id = memberService.join(param);
		String redirectUri = (String) param.get("redirectUri");
		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("alertMsg", String.format("%s has been registered as a member.", newMember));
		String expireDate = memberService.expireDate();
		attrService.setValue(String.format("member__%d__extra__checkPw", id), "0", expireDate);
		return "common/redirect";
	}

	@RequestMapping("usr/member/login")
	public String showLogin() {
		return "member/login";
	}

	@RequestMapping("usr/member/doLogin")
	public String doLogin(@RequestParam Map<String, Object> param, HttpSession session, Model model) {
		Member member = memberService.login(param);
		String redirectUri = (String) param.get("redirectUri");
		if (member == null) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", String.format("Please check your ID or Password"));

			return "common/redirect";
		}
		if (member.isDelStatus()) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", String.format("This ID has been withdrawn."));

			return "common/redirect";
		}
		String loginPw = (String) param.get("loginPwReal");

		if (member.getLoginPw().equals(loginPw) == false) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", String.format("Please check your ID or Password"));

			return "common/redirect";
		}

		if (member.getLoginPw().equals(loginPw)) {
			session.setAttribute("loginedMemberId", member.getId());
		}

		if (member.getLevel() < 10) {
			Attr attr = attrService.get(String.format("member__%d__extra__checkPw", member.getId()));
			if (attr == null) {
				model.addAttribute("alertMsg", String.format(
						"%s has been logged in. \\nyou are using your password longger than 3 months. you should change it",
						member.getLoginId()));
				model.addAttribute("redirectUri", redirectUri);

				return "common/redirect";
			}
			int temporaryPw = Integer.parseInt(attr.getValue());
			if (temporaryPw > 0) {
				model.addAttribute("alertMsg",
						String.format(
								"%s has been logged in. \\nyou are using temporary password. you should change it",
								member.getLoginId()));
				model.addAttribute("redirectUri", redirectUri);

				return "common/redirect";
			}
		}
		model.addAttribute("alertMsg", String.format("%s has been logged in.", member.getLoginId()));
		model.addAttribute("redirectUri", redirectUri);

		return "common/redirect";
	}

	@RequestMapping("usr/member/forgotId")
	public String showForgotId() {
		return "member/forgotId";
	}

	@RequestMapping("usr/member/doForgotId")
	public String doForgotId(@RequestParam Map<String, Object> param, Model model) {
		String name = (String) param.get("name");
		String redirectUri = (String) param.get("redirectUri");
		Member member = memberService.getLoginIdByEmail(param);
		if (member == null) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", String.format("Please check your Name and Email"));

			return "common/redirect";
		}
		if (member.getName().equals(name) == false) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", String.format("Please check your Name and Email"));

			return "common/redirect";
		}

		model.addAttribute("alertMsg", String.format("I sent your ID to %s.", member.getEmail()));
		model.addAttribute("redirectUri", redirectUri);

		return "common/redirect";
	}

	@RequestMapping("usr/member/forgotPw")
	public String showForgotPw() {
		return "member/forgotPw";
	}

	@RequestMapping("usr/member/doForgotPw")
	public String doForgotPw(@RequestParam Map<String, Object> param, Model model) {
		String name = (String) param.get("name");
		String loginId = (String) param.get("loginId");
		String redirectUri = (String) param.get("redirectUri");
		Member member = memberService.getLoginIdByEmail(param);
		if (member == null) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", String.format("Please check your ID, Name and Email"));

			return "common/redirect";
		}
		if (member.getName().equals(name) && member.getLoginId().equals(loginId) == false) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", String.format("Please check your ID, Name and Email"));

			return "common/redirect";
		}
		model.addAttribute("alertMsg", String.format("I sent your Password code to %s.", member.getEmail()));
		model.addAttribute("redirectUri", redirectUri);

		return "common/redirect";
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
	public String doModifyProfile(@RequestParam Map<String, Object> param, HttpSession session, Model model) {
		String nickname = (String) param.get("nickname");
		String email = (String) param.get("email");
		int loginedMemberId = (int) session.getAttribute("loginedMemberId");
		param.put("id", loginedMemberId);
		Member member = memberService.getMemberById(loginedMemberId);

		Member memberNickname = memberService.getMemberByNickname(param);
		if (!(memberNickname == null) && !member.getNickname().equals(nickname)) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg",
					String.format("[Nickname: %s] is already in use. Please use another Nickname", nickname));

			return "common/redirect";
		}

		Member memberEmail = memberService.getMemberByEmail(param);
		if (!(memberEmail == null) && !member.getEmail().equals(email)) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg",
					String.format("[Email: %s] is already in use. Please use another Email", email));

			return "common/redirect";
		}
		int updateMember = memberService.update(param);

		String expireDate = memberService.expireDate();
		if (member.getLevel() < 10) {
			attrService.setValue(String.format("member__%d__extra__checkPw", member.getId()), "0", expireDate);
		}

		String redirectUri = (String) param.get("redirectUri");
		model.addAttribute("alertMsg", String.format("%s\\'s profile has been modified", member.getNickname()));
		model.addAttribute("redirectUri", redirectUri);

		return "common/redirect";
	}

	@RequestMapping("usr/member/checkPw")
	public String showCheckPw() {
		return "member/checkPw";
	}

	@RequestMapping("usr/member/doCheckPwForEditProfile")
	public String doCheckPwForEditProfile(@RequestParam Map<String, Object> param, HttpSession session, Model model) {
		int loginedMemberId = (int) session.getAttribute("loginedMemberId");
		Member member = memberService.getMemberById(loginedMemberId);
		String loginPw = (String) param.get("loginPwReal");
		if (member.getLoginPw().equals(loginPw)) {
			model.addAttribute("member", member);
			model.addAttribute("loginPw", loginPw);
		}
		return "member/modifyProfile";
	}

	@RequestMapping("usr/member/doCheckPwForDeleteAccount")
	public String doCheckPwForDeleteAccount(@RequestParam Map<String, Object> param, HttpSession session, Model model) {
		int loginedMemberId = (int) session.getAttribute("loginedMemberId");
		param.put("id", loginedMemberId);
		String deleMsg = doDeleteAccount(param, session, model);
		return deleMsg;
	}

	@RequestMapping("usr/member/doLogout")
	public String doLogout(HttpSession session, Model model) {
		session.removeAttribute("loginedMemberId");
		model.addAttribute("redirectUri", "/usr/home/main");
		model.addAttribute("alertMsg", String.format("You have been logged out."));

		return "common/redirect";
	}

	@RequestMapping("usr/member/doDeleteAccount")
	public String doDeleteAccount(@RequestParam Map<String, Object> param, HttpSession session, Model model) {
		String loginPw = (String) param.get("loginPwReal");
		if (loginPw == null) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", String.format("It\\'s a wrong approach."));

			return "common/redirect";
		}

		int delMember = memberService.doDeleteAccount(param);
		session.removeAttribute("loginedMemberId");
		model.addAttribute("redirectUri", "/usr/home/main");
		model.addAttribute("alertMsg", String.format("Your account have been deleted."));

		return "common/redirect";
	}

	@RequestMapping("usr/member/getLoginIdDup")
	@ResponseBody
	public String showGetLoginIdDup(@RequestParam Map<String, Object> param) {
		String loginId = (String) param.get("loginId");
		String onlyAlphabetAndNumInId = (String) param.get("onlyAlphabetAndNumInId");

		boolean isJoinableLoginId = memberService.isJoinableLoginId(loginId);
		isJoinableLoginId = !isJoinableLoginId;

		if (isJoinableLoginId && onlyAlphabetAndNumInId.equals("true")) {
			return "{\"msg\":\"사용할 수 있는 아이디 입니다.\", \"isJoinableLoginId\":\"true\", \"loginId\":\"" + loginId + "\"}";
		} else if (!isJoinableLoginId || onlyAlphabetAndNumInId.equals("false")) {
			return "{\"msg\":\"사용할 수 없는 아이디 입니다.\", \"isJoinableLoginId\": \"false\", \"loginId\":\"" + loginId + "\"}";
		}
		return "";
	}
}
