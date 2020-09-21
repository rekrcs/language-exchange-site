package com.project.byk.le.service;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.project.byk.le.dao.MemberDao;
import com.project.byk.le.dto.Member;
import com.project.byk.le.util.Util;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MailService mailService;
	@Autowired
	private AttrService attrService;
	@Value("${custom.siteMainUri}")
	private String siteMainUri;
	@Value("${custom.siteMainUriForIdAndPw}")
	private String siteMainUriForIdAndPw;
	@Value("${custom.siteName}")
	private String siteName;

	public int join(Map<String, Object> param) {
		memberDao.join(param);

		sendJoinCompleteMail((String) param.get("email"));
		return ((BigInteger) param.get("id")).intValue();
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
		String loginId = (String) param.get("loginId");
		String temporaryPw = Util.getAuthCode();
		String temporaryPwSHA256 = Util.getTemporaryPwSHA256(temporaryPw);

		param.put("temporaryPwSHA256", temporaryPwSHA256);
		Member member = memberDao.getLoginIdByEmail(param);

		if (member == null) {
			return member;
		}
		int id = member.getId();
		param.put("id", id);

		if (member.getName().equals(name) && member.getLoginId().equals(loginId)) {
			String expireDate = expireDate();
			attrService.setValue(String.format("member__%d__extra__checkPw", id), temporaryPw, expireDate);
			memberDao.pwToTemporaryPw(param);
			sendforgotPw((String) param.get("email"), temporaryPw);

		} else if (member.getName().equals(name)) {
			sendforgotID((String) param.get("email"), member.getLoginId());
		}
		return member;

	}

	private void sendforgotPw(String email, String temporaryPw) {
		String mailTitle = String.format("[%s] It is email for Your password", siteName);

		StringBuilder mailBodySb = new StringBuilder();
		mailBodySb.append("<h1>It is email for Your password.</h1>");
		mailBodySb.append(String.format("temporary Pw : %s", temporaryPw));
		mailBodySb.append(String.format("<p>Move to <a href=\"%s\" target=\"_blank\">%s</a></p>", siteMainUriForIdAndPw,
				siteName));

		mailService.send(email, mailTitle, mailBodySb.toString());

	}

	private void sendforgotID(String email, String loginId) {
		String mailTitle = String.format("[%s] It is email for Your ID", siteName);

		StringBuilder mailBodySb = new StringBuilder();
		mailBodySb.append("<h1>It is email for Your ID.</h1>");
		mailBodySb.append(String.format("ID : %s", loginId));
		mailBodySb.append(String.format("<p>Move to <a href=\"%s\" target=\"_blank\">%s</a></p>", siteMainUriForIdAndPw,
				siteName));

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

	public String expireDate() {
		return memberDao.expireDate();
	}

	public boolean isJoinableLoginId(String loginId) {
		return memberDao.isJoinableLoginId(loginId);
	}

	public List<Member> getMembersLearningKr() {
		return memberDao.getMembersLearningKr();
	}

	public List<Member> getMembersLearningEn() {
		return memberDao.getMembersLearningEn();
	}

	public int updateIntroduce(Map<String, Object> param) {
		return memberDao.updateIntroduce(param);

	}

}
