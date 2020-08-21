package com.project.byk.le.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.byk.le.dto.Article;

@Mapper
public interface ArticleDao {

	List<Article> getArticlesByCode(@Param("code") String code);

}
