package com.project.byk.le.interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.HandlerInterceptor;

import com.project.byk.le.dto.Board;
import com.project.byk.le.dto.Member;
import com.project.byk.le.service.BoardService;
import com.project.byk.le.service.MemberService;
import com.project.byk.le.util.Util;

@Component("beforeActionInterceptor") // set @Component name
public class BeforeActionInterceptor implements HandlerInterceptor {

	@Autowired
	private MemberService memberService;

	@Autowired
	private BoardService boardService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 기타 유용한 정보를 request에 담는다.
		Map<String, Object> param = Util.getParamMap(request);
		String paramJson = Util.toJsonStr(param);

		String requestUri = request.getRequestURI();
		String queryString = request.getQueryString();

		boolean writeBeforeLogin = requestUri.endsWith("write");
		boolean learnKrBeforeLogin = requestUri.endsWith("learnKr");
		boolean learnEnBeforeLogin = requestUri.endsWith("learnEn");
		boolean liveBeforeLogin = requestUri.endsWith("liveList");
		boolean messageforeLogin = requestUri.endsWith("message");
		boolean liveWriteBeforeLogin = requestUri.endsWith("liveWrite");

		if (queryString != null && queryString.length() > 0) {
			requestUri += "?" + queryString;
		}

		String encodedRequestUri = Util.getUriEncoded(requestUri);

		request.setAttribute("requestUri", requestUri);
		request.setAttribute("encodedRequestUri", encodedRequestUri);
		request.setAttribute("queryString", queryString);

		String requestUriNoQuery = request.getRequestURI();
		String encodedRequestUriNoQuery = Util.getUriEncoded(requestUriNoQuery);
		request.setAttribute("encodedRequestUriNoQuery", encodedRequestUriNoQuery);

		String afterLoginUri = requestUri;

		// 현재 페이지가 이미 로그인 페이지라면, 이 상태에서 로그인 버튼을 눌렀을 때 기존 param의 redirectUri가 계속 유지되도록
		// 한다.
		if (requestUri.contains("/usr/member/login") || requestUri.contains("/usr/member/join")
				|| requestUri.contains("/usr/member/forgotId") || requestUri.contains("/usr/member/forgotPw")
				|| requestUri.contains("/usr/member/doJoin")) {
			afterLoginUri = Util.getString(request, "redirectUri", "/usr/home/main");
		}

		String encodedAfterLoginUri = Util.getUriEncoded(afterLoginUri);

		request.setAttribute("afterLoginUri", afterLoginUri);
		request.setAttribute("encodedAfterLoginUri", encodedAfterLoginUri);
		request.setAttribute("paramMap", param);
		request.setAttribute("paramJson", paramJson);

		boolean isAjax = requestUri.endsWith("Ajax");

		if (isAjax == false) {
			if (param.containsKey("ajax") && param.get("ajax").equals("Y")) {
				isAjax = true;
			}
		}

		request.setAttribute("isAjax", isAjax);

		if (learnKrBeforeLogin == true || learnEnBeforeLogin == true || liveBeforeLogin == true
				|| messageforeLogin == true || liveWriteBeforeLogin == true || writeBeforeLogin == true) {
			request.setAttribute("writeBeforeLogin", Util.getUriEncoded(requestUri));
		}

//		if (writeBeforeLogin == true) {
//			request.setAttribute("writeBeforeLogin", Util.getUriEncoded(requestUri) + "?redirectUri="
//					+ Util.getUriEncoded((String) param.get("redirectUri")));
//		}

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
