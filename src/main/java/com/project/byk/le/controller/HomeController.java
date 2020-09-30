package com.project.byk.le.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.byk.le.dto.Member;
import com.project.byk.le.service.MemberService;

@Controller
public class HomeController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("/usr/home/main")
	public String showMain(Model model) {
		int numberOfPrintMembers = 5;
		String english = "English";
		String korean = "Korean";
		
		Map<String, Object> paramSpeakKr = new HashMap<>();
		paramSpeakKr.put("limit", numberOfPrintMembers);
		paramSpeakKr.put("nativeLang", korean);

		List<Member> membersSpeakKr = memberService.getNewMembers(paramSpeakKr);
		model.addAttribute("membersSpeakKr", membersSpeakKr);
		
		Map<String, Object> paramSpeakEn = new HashMap<>();
		paramSpeakEn.put("limit", numberOfPrintMembers);
		paramSpeakEn.put("nativeLang", english);

		List<Member> membersSpeakEn = memberService.getNewMembers(paramSpeakEn);
		model.addAttribute("membersSpeakEn", membersSpeakEn);

		return "home/main";
	}

	@RequestMapping("/")
	public String showMain2() {
		return "redirect:/usr/home/main";
	}
}
