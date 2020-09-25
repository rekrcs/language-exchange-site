package com.project.byk.le.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.byk.le.dto.Article;
import com.project.byk.le.dto.Board;

@Mapper
public interface ArticleDao {

	int write(Map<String, Object> param);

	Article getArticleById(@Param("id") int id);

	void deleteArticle(@Param("id") int id);

	Board getBoardByCode(@Param("code") String code);

	List<Article> getArticlesByParam(Map<String, Object> param);

	int getArticlesCount(Map<String, Object> param);

	List<Article> getArticleByBoradId(@Param("boardId") int boardId);

	void doArticleModify(Map<String, Object> param);

}
