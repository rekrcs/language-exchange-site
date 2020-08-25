package com.project.byk.le.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.byk.le.dao.ArticleDao;
import com.project.byk.le.dto.Article;

@Service
public class ArticleService {

	@Autowired
	ArticleDao articleDao;

	public List<Article> getArticlesByCode(String code) {
		return articleDao.getArticlesByCode(code);
	}

	public int write(Map<String, Object> param) {
		return articleDao.write(param);
	}

	public Article getArticleById(int id) {
		return articleDao.getArticleById(id);
	}

}
