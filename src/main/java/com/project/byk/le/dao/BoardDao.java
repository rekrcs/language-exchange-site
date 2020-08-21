package com.project.byk.le.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.byk.le.dto.Board;

@Mapper
public interface BoardDao {

	List<Board> getBoardsForPrint();

}
