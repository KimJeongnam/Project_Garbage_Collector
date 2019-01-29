package com.spring.project.professor.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.project.professor.dao.ProfesserDAO;
import com.spring.project.professor.vo.Vo;


@Service
public class ProfessorServiceImpl implements ProfessorService{

	@Autowired
	ProfesserDAO dao;
	
	@Override
	public void myPage(HttpServletRequest req, Model model) {
		
		String userNumber = (String)req.getSession().getAttribute("userNumber");
			
	 	Vo vo = dao.myPage(userNumber);
	 	
	 	req.setAttribute("vo", vo);
	}

}
