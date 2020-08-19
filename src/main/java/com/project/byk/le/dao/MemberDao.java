package com.project.byk.le.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {

	void join(Map<String, Object> parm);

}
