package com.project.byk.le.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.project.byk.le.dao.MemberDao;
import com.project.byk.le.dto.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MailService mailService;
	@Value("${custom.siteMainUri}")
	private String siteMainUri;
	@Value("${custom.siteName}")
	private String siteName;

	public int join(Map<String, Object> param) {
//		sendJoinCompleteMail((String) param.get("email"));
		return memberDao.join(param);
	}

	private void sendJoinCompleteMail(String email) {
		String mailTitle = String.format("[%s] Your membership has been completed.", siteName);

		StringBuilder mailBodySb = new StringBuilder();
		mailBodySb.append("<h1>Your membership has been completed.</h1>");
		mailBodySb
				.append(String.format("<p>Move to <a href=\"%s\" target=\"_blank\">%s</a></p>", siteMainUri, siteName));

		mailService.send(email, mailTitle, mailBodySb.toString());
	}

	public Member login(Map<String, Object> param) {
		return memberDao.login(param);
	}

	public Member getLoginIdByEmail(Map<String, Object> param) {
		String name = (String) param.get("name");
		String id = (String) param.get("loginId");
		Member member = memberDao.getLoginIdByEmail(param);

//		if (member.getName().equals(name) && member.getLoginId().equals(id)) {
//			sendforgotPw((String) param.get("email"), member.getLoginPw());
//		} else if (member.getName().equals(name)) {
//			sendforgotID((String) param.get("email"), member.getLoginId());
//		}
		return member;

	}

	private void sendforgotPw(String email, String loginPw) {
		String mailTitle = String.format("[%s] It is email for Your password", siteName);

		StringBuilder mailBodySb = new StringBuilder();
		mailBodySb.append("<h1>It is email for Your password.</h1>");
		mailBodySb.append(String.format("Password : %s", loginPw));

		mailService.send(email, mailTitle, mailBodySb.toString());
	}

	private void sendforgotID(String email, String loginId) {
		String mailTitle = String.format("[%s] It is email for Your ID", siteName);

		StringBuilder mailBodySb = new StringBuilder();
		mailBodySb.append("<h1>It is email for Your ID.</h1>");
		mailBodySb.append(String.format("ID : %s", loginId));

		mailService.send(email, mailTitle, mailBodySb.toString());
	}

	public Member getMemberById(int id) {
		return memberDao.getMemberById(id);
	}

	public int update(Map<String, Object> param) {
		return memberDao.update(param);
	}

	public Member getMemberByLoginId(Map<String, Object> param) {
		return memberDao.getMemberByLoginId(param);
	}

	public Member getMemberByEmail(Map<String, Object> param) {
		return memberDao.getMemberByEmail(param);
	}

	public Member getMemberByNickname(Map<String, Object> param) {
		return memberDao.getMemberByNickname(param);
	}

	public int doDeleteAccount(Map<String, Object> param) {
		return memberDao.doDeleteAccount(param);
	}

}
