package com.spring.project.student.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.spring.project.student.dao.StudentDAO;

public class StudentServiceImpl implements StudentService {
	
	@Autowired
	StudentDAO dao;
	
	// 페이지
	int pageSize = 10;		// 한페이지당 출력할 글 갯
	int pageBlock = 5;		// 한 블럭당 페이지 갯수
	
	int cnt = 0;			// 글갯수
	int start = 0;			// 현재 페이지 시작 글번호
	int end = 0;			// 현재 페이지 마지막 글번호
	int number = 0;			// 출력용 글번호
	String pageNum = "";	// 페이지 번호
	int currentPage = 0;	// 현재페이지
	
	int pageCount = 0;		// 페이지 갯수
	int startPage = 0;		// 시작 페이지
	int endPage = 0;		// 마지막 페이지
	
	// 수강 신청 목록
	@Override
	public void lectureList(HttpServletRequest req, Model model) {
		String userId = (String)req.getSession().getAttribute("userId");
		// 학과 번호 가져오기
		String majorNum = dao.getMajorNum(userId);
		
		// 수강신청 목록 갯수 구하기
		cnt = dao.getLectureCnt(majorNum);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";	// 첫페이지를 1페이지로 지정
		}
		
		// 글 30건 기준
		currentPage = Integer.parseInt(pageNum); // 현재 페이지
		
		// 페이지 갯수 6 = (30 / 5) + (0)
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지 있으면 1 (%은 나머지 구하는)
		
		// 현재 페이지 시작 글번호 1 (페이지별)
		//  1 = (1 - 1) * 5 + 1 
		start = (currentPage - 1) * pageSize + 1;
		
		// 현재 페이지 마지막 글번호 (페이지별)
		// 5 = 1 + 5 - 1;
		end = start + pageSize - 1;
		
		if(end > cnt) end = cnt;
		
		// 출력용 글번호
		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize;	// 출력용 글번호
		
		
		
	}

}
