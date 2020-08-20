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

	public Member login(Map<String, Object> param) {
		return memberDao.login(param);
	}

}
