package com.project.byk.le.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping("usr/article/{boardCode}-write")
	public String showWrite(Model model, @PathVariable("boardCode") String boardCoade) {
		model.addAttribute("boardCoade", boardCoade);
		return "article/write";
	}

	@RequestMapping("usr/article/doWrite")
	@ResponseBody
	public String doWrite(@RequestParam Map<String, Object> param) {
		int newArticleWrite = articleService.write(param);
		String boardCode = (String) param.get("code");
		return String.format("<script>alert('A new article has been written.'); location.replace('%s-list')</script>",
				boardCode);
	}

	@RequestMapping("usr/article/detail")
	public String showDetail(Model model, @RequestParam Map<String, Object> param) {
		int id = Integer.parseInt((String) param.get("id"));
		Article article = articleService.getArticleById(id);
		model.addAttribute("article", article);
		return "article/detail";
	}
}
