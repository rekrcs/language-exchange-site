package com.project.byk.le.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.project.byk.le.dto.Board;
import com.project.byk.le.dto.Member;
import com.project.byk.le.service.BoardService;
import com.project.byk.le.service.MemberService;

@Component("beforeActionInterceptor") // set @Component name
public class beforeActionInterceptor implements HandlerInterceptor {

	@Autowired
	private MemberService memberService;

	@Autowired
	private BoardService boardService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// put board INF. into request
		List<Board> boards = boardService.getBoardsForPrint();
		request.setAttribute("boards", boards);

		// put Member logined INF. into request
		HttpSession session = request.getSession();
		boolean isLogined = false;
		int loginedMemberId = 0;
		Member loginedMember = null;

		if (session.getAttribute("loginedMemberId") != null) {
			loginedMemberId = (int) session.getAttribute("loginedMemberId");
			isLogined = true;
			loginedMember = memberService.getMemberById(loginedMemberId);
		}

		request.setAttribute("loginedMemberId", loginedMemberId);
		request.setAttribute("isLogined", isLogined);
		request.setAttribute("loginedMember", loginedMember);

		return HandlerInterceptor.super.preHandle(request, response, handler);

	}
}
