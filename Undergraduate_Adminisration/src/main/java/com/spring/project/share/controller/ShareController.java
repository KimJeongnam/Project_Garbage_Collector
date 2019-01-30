package com.spring.project.share.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.share.service.ShareService;

@Controller
public class ShareController {
	@Autowired
	ShareService shareService;

	private static final Logger logger = LoggerFactory.getLogger(ShareController.class);

	@RequestMapping(value = { "/loginForm", "/" })
	public String login(HttpServletRequest request) {
		logger.info("login()");
		return "share/login";
	}

	@RequestMapping("/loginSucces")
	public String loginSucces(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		logger.info("loginSucces()");
		String redirectUrl = shareService.loginSucces(request, redirectAttributes, logger);
		logger.info("redirectUrl:" + redirectUrl);
		return "redirect:" + redirectUrl;
	}

	@RequestMapping("/loginFail")
	public String loginFail(RedirectAttributes redirectAttributes) {
		logger.info("loginFail()");
		redirectAttributes.addFlashAttribute("message", "로그인 실패!! 아이디 혹은 비밀번호가 다릅니다.!");
		return "redirect:/loginForm";
	}

	@RequestMapping("/logoutDo")
	public String logoutDo(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		logger.info("logoutDo()");
		request.getSession().invalidate();
		redirectAttributes.addFlashAttribute("message", "로그아웃!");
		return "redirect:/loginForm";
	}
}
