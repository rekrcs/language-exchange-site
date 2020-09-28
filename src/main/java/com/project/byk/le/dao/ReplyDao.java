package com.project.byk.le.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.byk.le.dto.Reply;

@Mapper
public interface ReplyDao {

	int writeReply(Map<String, Object> param);

	List<Reply> getForPrintArticleReplies(@Param("articleId") int articleId, @Param("from") int from);

}
