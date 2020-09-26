package com.project.byk.le.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.byk.le.dto.Article;
import com.project.byk.le.dto.Board;
import com.project.byk.le.service.ArticleService;
import com.project.byk.le.util.Util;

@Controller
public class ArticleController {
	@Autowired
	ArticleService articleService;

	@RequestMapping("usr/article/{boardCode}-list")
	public String showList(Model model, String searchKeyword, String searchType,
			@RequestParam(value = "page", defaultValue = "1") int page, @PathVariable("boardCode") String boardCode) {
		Board board = articleService.getBoardByCode(boardCode);

		Map<String, Object> getForPrintArticlesByParm = new HashMap();
		getForPrintArticlesByParm.put("boardId", board.getId());

		int limitCount = 10;
		int limitFrom = (page - 1) * limitCount;
		getForPrintArticlesByParm.put("limitCount", limitCount);
		getForPrintArticlesByParm.put("limitFrom", limitFrom);
		getForPrintArticlesByParm.put("searchKeyword", searchKeyword);
		getForPrintArticlesByParm.put("searchType", searchType);

		int totalCount = articleService.getArticlesCount(getForPrintArticlesByParm);
		int totalPage = (int) Math.ceil((double) totalCount / limitCount);
		List<Article> articles = articleService.getArticlesByParam(getForPrintArticlesByParm);

		model.addAttribute("articles", articles);
		model.addAttribute("boardCode", boardCode);

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalCount", totalCount);

		int pageBoundSize = 5;
		int pageStartsWith = page - pageBoundSize;
		if (pageStartsWith < 1) {
			pageStartsWith = 1;
		}

		int pageEndsWith = page + pageBoundSize;
		if (pageEndsWith > totalPage) {
			pageEndsWith = totalPage;
		}
		model.addAttribute("pageStartsWith", pageStartsWith);
		model.addAttribute("pageEndsWith", pageEndsWith);
		model.addAttribute("pageBoundSize", pageBoundSize);

		boolean beforeMorePages = pageStartsWith > 1;
		boolean afterMorePages = pageEndsWith < totalPage;

		model.addAttribute("beforeMorePages", beforeMorePages);
		model.addAttribute("afterMorePages", afterMorePages);

		model.addAttribute("moveToFirstPage", page != 1);
		model.addAttribute("moveToLastPage", page != totalPage);

		return "article/list";
	}

	@RequestMapping("usr/article/{boardCode}-write")
	public String showWrite(Model model, @PathVariable("boardCode") String boardCode) {
		model.addAttribute("boardCode", boardCode);
		return "article/write";
	}

	@RequestMapping("usr/article/doWrite")
	public String doWrite(Model model, @RequestParam Map<String, Object> param, HttpSession session) {
		if (session.getAttribute("loginedMemberId") == null) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", String.format("you can write after login"));
			return "common/redirect";
		}
		int loginedMemberId = (int) session.getAttribute("loginedMemberId");
		String boardCode = (String) param.get("code");
		Board board = articleService.getBoardByCode(boardCode);
		param.put("boardId", board.getId());
		param.put("memberId", loginedMemberId);
		int newArticleWrite = articleService.write(param);

		if (boardCode.equals("live")) {
			List<Article> articles = articleService.getArticleByBoradId(board.getId());
			model.addAttribute("articles", articles);
			return "article/live";
		}
		model.addAttribute("redirectUri", boardCode + "-list");
		model.addAttribute("alertMsg", String.format("A new article has been written."));
		return "common/redirect";
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
		if (boardCode.equals("live")) {
			model.addAttribute("redirectUri", String.format("/usr/article/%s-liveList", boardCode));
		} else {
			model.addAttribute("redirectUri", String.format("/usr/article/%s-list", boardCode));
		}
		return "common/redirect";
	}

	@RequestMapping("usr/article/{boardCode}-modifyArticle")
	public String showModifyArticle(Model model, @PathVariable("boardCode") String boardCode,
			@RequestParam Map<String, Object> param) {
		int id = Util.getAsInt(param.get("id"));
		Article article = articleService.getArticleById(id);
		model.addAttribute("article", article);
		model.addAttribute("boardCode", boardCode);
		return "article/modify";
	}

	@RequestMapping("usr/article/doModify")
	public String doModify(Model model, @RequestParam Map<String, Object> param, HttpSession session) {
		articleService.doArticleModify(param);
		String redirectUri = (String) param.get("redirectUri");
		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("alertMsg", String.format("you have modified your article"));
		return "common/redirect";
	}

	@RequestMapping("usr/article/{boardCode}-liveList")
	public String showLive(Model model, @PathVariable("boardCode") String boardCode) {
		model.addAttribute("boardCode", boardCode);
		Board board = articleService.getBoardByCode(boardCode);
		List<Article> articles = articleService.getArticleByBoradId(board.getId());
		model.addAttribute("articles", articles);
		return "article/live";
	}

	@RequestMapping("usr/article/{boardCode}-liveWrite")
	public String showLiveWrite(Model model, @PathVariable("boardCode") String boardCode) {
		return "article/liveWrite";
	}
}
