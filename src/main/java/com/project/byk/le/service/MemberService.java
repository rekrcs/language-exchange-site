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
		sendJoinCompleteMail((String) param.get("email"));
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

	public String getLoginIdByEmail(Map<String, Object> param) {
		String name = (String) param.get("name");
		Member member = memberDao.getLoginIdByEmail(param);

		if (member == null) {
			return String.format("<script>alert('Please check your Name and Email'); history.back();</script>");
		}

		if (member.getName().equals(name) == false) {
			return String.format("<script>alert('Please check your Name and Email'); history.back();</script>");
		}
		if (member.getName().equals(name)) {
			sendforgotID((String) param.get("email"), member.getLoginId());
		}
		return String.format("<script>alert('I sent your ID to %s.'); location.replace('../member/login');</script>",
				member.getEmail());

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

}
