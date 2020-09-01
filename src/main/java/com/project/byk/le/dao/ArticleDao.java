package com.project.byk.le.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.byk.le.dto.Article;
import com.project.byk.le.dto.Board;

@Mapper
public interface ArticleDao {

	List<Article> getArticlesByCode(@Param("boardId") int boardId);

	int write(Map<String, Object> param);

	Article getArticleById(@Param("id") int id);

	void deleteArticle(@Param("id") int id);

	Board getBoardByCode(@Param("code") String code);

}
