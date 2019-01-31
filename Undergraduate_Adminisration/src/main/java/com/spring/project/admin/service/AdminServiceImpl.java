package com.spring.project.admin.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.project.admin.dao.AdminDAO;
import com.spring.project.admin.vo.AdStdVO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDAO dao;
	
	//학생등록 처리
	@Override
	public void stdInputPro(HttpServletRequest req, Model model) {
		AdStdVO vo = new AdStdVO();
		vo.setStdName(req.getParameter("StdName"));
		//영어이름?
		vo.setStdImage(req.getParameter("stdImage"));
		vo.setStdSsn(req.getParameter("stdSsn"));
		vo.setStdCellNumber(req.getParameter("stdCellNumber"));
		vo.setStdEmail(req.getParameter("stdEmail"));
		vo.setStdGrade(Integer.parseInt(req.getParameter("stdGrade")));
		vo.setUserNumber(req.getParameter("userNumber"));			//학번
		vo.setStdZipCode(req.getParameter("stdZipCode"));
		vo.setStdAddr1(req.getParameter("stdAddr1"));
		vo.setStdAddr2(req.getParameter("stdAddr2"));
		vo.setAdDate(Date.valueOf(req.getParameter("adDate")));
		vo.setGraDate(Date.valueOf(req.getParameter("graDate")));
		vo.setLeaveStatus(Integer.parseInt(req.getParameter("leaveStatus"))); //학적상태 ex)재학중, 휴학중 
		
		int insert = dao.insertUsers(vo);
		
		req.setAttribute("insert", insert);
	}

}
