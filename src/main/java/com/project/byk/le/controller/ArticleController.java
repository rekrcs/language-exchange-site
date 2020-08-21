package com.project.byk.le.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.byk.le.dto.Article;
import com.project.byk.le.service.ArticleService;

@Controller
public class ArticleController {
	@Autowired
	ArticleService articleService;

	@RequestMapping("usr/article/{boardCode}-list")
	public String showList(Model model, @PathVariable("boardCode") String boardCoade) {
		List<Article> articles = articleService.getArticlesByCode(boardCoade);
		model.addAttribute("articles", articles);
		model.addAttribute("boardCoade", boardCoade);
		return "article/list";
	}
}
