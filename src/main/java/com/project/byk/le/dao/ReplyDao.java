package com.project.byk.le.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyDao {

	int writeReply(Map<String, Object> param);

}
