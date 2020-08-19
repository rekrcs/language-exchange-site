package com.project.byk.le.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.byk.le.dto.Member;

@Mapper
public interface MemberDao {

	int join(Map<String, Object> param);

	Member login(Map<String, Object> param);

}
