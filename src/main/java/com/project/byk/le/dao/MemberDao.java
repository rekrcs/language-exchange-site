package com.project.byk.le.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.byk.le.dto.Member;

@Mapper
public interface MemberDao {

	int join(Map<String, Object> param);

	Member login(Map<String, Object> param);

	Member getLoginIdByEmail(Map<String, Object> param);

	Member getMemberById(@Param("id") int id);

	int update(Map<String, Object> param);

	Member getMemberByLoginId(Map<String, Object> param);

	Member getMemberByEmail(Map<String, Object> param);

	Member getMemberByNickname(Map<String, Object> param);

	int doDeleteAccount(Map<String, Object> param);

	void pwToTemporaryPw(Map<String, Object> param);

	String expireDate();

	boolean isJoinableLoginId(@Param("loginId") String loginId);
}
