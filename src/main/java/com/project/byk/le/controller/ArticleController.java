package com.project.byk.le.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.byk.le.dto.Article;
import com.project.byk.le.dto.Board;
import com.project.byk.le.service.ArticleService;

@Controller
public class ArticleController {
	@Autowired
	ArticleService articleService;

	@RequestMapping("usr/article/{boardCode}-list")
	public String showList(Model model, @PathVariable("boardCode") String boardCode) {
		Board board = articleService.getBoardByCode(boardCode);
		List<Article> articles = articleService.getArticlesByCode(board.getId());
		model.addAttribute("articles", articles);
		model.addAttribute("boardCode", boardCode);
		return "article/list";
	}

	@RequestMapping("usr/article/{boardCode}-write")
	public String showWrite(Model model, @PathVariable("boardCode") String boardCode) {
		model.addAttribute("boardCode", boardCode);
		return "article/write";
	}

	@RequestMapping("usr/article/doWrite")
	@ResponseBody
	public String doWrite(@RequestParam Map<String, Object> param, HttpSession session) {
		int loginedMemberId = (int) session.getAttribute("loginedMemberId");
		String boardCode = (String) param.get("code");
		Board board = articleService.getBoardByCode(boardCode);
		param.put("boardId", board.getId());
		param.put("memberId", loginedMemberId);
		int newArticleWrite = articleService.write(param);

		return String.format("<script>alert('A new article has been written.'); location.replace('%s-list')</script>",
				boardCode);
	}

	@RequestMapping("usr/article/{boardCode}-detail")
	public String showDetail(Model model, @RequestParam Map<String, Object> param,
			@PathVariable("boardCode") String boardCode) {
		int id = Integer.parseInt((String) param.get("id"));
		Article article = articleService.getArticleById(id);
		model.addAttribute("article", article);
		
		Board board = articleService.getBoardByCode(boardCode);
		model.addAttribute("board", board);
		return "article/detail";
	}

	@RequestMapping("usr/article/{boardCode}-deleteArticle")
	public String doDeleteArticle(Model model, @RequestParam Map<String, Object> param,
			@PathVariable("boardCode") String boardCode) {
		int id = Integer.parseInt((String) param.get("id"));
		articleService.deleteArticle(id);
		model.addAttribute("alertMsg", String.format("your article have deleted."));
		model.addAttribute("redirectUri", String.format("/usr/article/%s-list", boardCode));
		return "common/redirect";
	}
}
