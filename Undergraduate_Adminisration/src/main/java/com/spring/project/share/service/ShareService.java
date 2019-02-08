package com.spring.project.share.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface ShareService {
	public String loginSucces(HttpServletRequest request, RedirectAttributes redirectAttributes, Logger logger);
	public void messageBoard(Map<String, Object> map, Logger logger, Model model);
	public void messageShow(Map<String, Object> map, Logger logger, Model model);
	public List<String> getFacultys();
	public int getMajorCurrval();
}
