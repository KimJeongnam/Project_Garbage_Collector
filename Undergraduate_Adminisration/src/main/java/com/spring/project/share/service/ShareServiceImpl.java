package com.spring.project.share.service;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
public class ShareServiceImpl implements ShareService{

	@Override
	public String loginSucces(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority>  authorities = ((User) authentication.getPrincipal()).getAuthorities();
		String redirectUrl ="";
		
		if(authorities.stream().filter(o->o.getAuthority().equals("ROLE_ADMIN")).findAny().isPresent())
			redirectUrl = "/admin/index";
		else if(authorities.stream().filter(o->o.getAuthority().equals("ROLE_PROFESSOR")).findAny().isPresent())
			redirectUrl = "/professor/index";
		else if(authorities.stream().filter(o->o.getAuthority().equals("ROLE_STUDENT")).findAny().isPresent())
			redirectUrl = "/student/index";
		
		String userId = (String)request.getSession().getAttribute("userId");
		redirectAttributes.addFlashAttribute("message","환영합니다. '"+userId+"' 님");
		return redirectUrl;
	}
	
}
