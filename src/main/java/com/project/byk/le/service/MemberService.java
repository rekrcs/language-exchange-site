package com.project.byk.le.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.byk.le.dao.MemberDao;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;

	public int join(Map<String, Object> parm) {
		memberDao.join(parm);
		return 0;
	}

}
