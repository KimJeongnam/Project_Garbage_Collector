package com.spring.project.share.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface ShareService {
	public String loginSucces(HttpServletRequest request, RedirectAttributes redirectAttributes);
}
