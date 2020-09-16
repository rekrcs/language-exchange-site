package com.project.byk.le.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageDao {

	int sendMsg(Map<String, Object> param);

}
