package com.project.byk.le.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.project.byk.le.dao.ArticleDao;
import com.project.byk.le.dto.Article;
import com.project.byk.le.dto.Board;

@Service
public class ArticleService {

	@Autowired
	ArticleDao articleDao;

	public List<Article> getArticlesByCode(int boardId) {
		return articleDao.getArticlesByCode(boardId);
	}

	public int write(Map<String, Object> param) {
		return articleDao.write(param);
	}

	public Article getArticleById(int id) {
		return articleDao.getArticleById(id);
	}

	public void deleteArticle(int id) {
		articleDao.deleteArticle(id);
	}

	public Board getBoardByCode(String code) {
		return articleDao.getBoardByCode(code);
	}

}
