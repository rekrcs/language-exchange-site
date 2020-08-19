package com.project.byk.le.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.byk.le.dao.MemberDao;
import com.project.byk.le.dto.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;

	public int join(Map<String, Object> param) {
		return memberDao.join(param);
	}

	public String login(Map<String, Object> param, HttpSession session) {
		String loginPw = (String) param.get("loginPw");

		Member member = memberDao.login(param);
		if (member.getLoginPw().equals(loginPw)) {
			session.setAttribute("loginedMemberId", member.getId());
			return String.format("<script>alert('%s has been logged in.'); location.replace('../home/main');</script>",
					member.getLoginId());
		} else {
			return String.format("<script>alert('Please check your ID or Password'); history.back();</script>");
		}
	}
}
