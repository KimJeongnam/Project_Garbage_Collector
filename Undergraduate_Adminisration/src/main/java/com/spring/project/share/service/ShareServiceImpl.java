package com.spring.project.share.service;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.share.dao.ShareDAO;
import com.spring.project.share.vo.ShareUserInfo;

@Service
public class ShareServiceImpl implements ShareService{
	@Autowired
	ShareDAO dao;

	@Override
	public String loginSucces(HttpServletRequest request, RedirectAttributes redirectAttributes, Logger logger) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority>  authorities = ((User) authentication.getPrincipal()).getAuthorities();
		String redirectUrl ="";
		
		ShareUserInfo user = null;
		String userNumber = (String)request.getSession().getAttribute("userNumber");
		
		
		if(authorities.stream().filter(o->o.getAuthority().equals("ROLE_ADMIN")).findAny().isPresent()) {
			user = dao.getEmployeeInfo(userNumber);
			redirectUrl = "/admin/index";
		}else if(authorities.stream().filter(o->o.getAuthority().equals("ROLE_PROFESSOR")).findAny().isPresent()) {
			user = dao.getEmployeeInfo(userNumber);
			redirectUrl = "/professor/index";
		}else if(authorities.stream().filter(o->o.getAuthority().equals("ROLE_STUDENT")).findAny().isPresent()) {
			redirectUrl = "/student/index";
			user = dao.getStudentInfo(userNumber);
		}
		
		
		logger.info(user.toString());
		request.getSession().setAttribute("user", user);
		redirectAttributes.addFlashAttribute("message","환영합니다. '"+user.getUserName()+"' 님");
		return redirectUrl;
	}
	
}
