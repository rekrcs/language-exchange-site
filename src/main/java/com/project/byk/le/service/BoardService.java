package com.project.byk.le.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.byk.le.dao.BoardDao;
import com.project.byk.le.dto.Board;

@Service
public class BoardService {
	@Autowired
	BoardDao boardDao;

	public List<Board> getBoardsForPrint() {
		return boardDao.getBoardsForPrint();
	}

}
