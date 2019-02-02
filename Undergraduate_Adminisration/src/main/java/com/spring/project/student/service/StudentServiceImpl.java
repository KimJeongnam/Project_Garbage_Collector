package com.spring.project.student.service;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.project.student.dao.StudentDAO;
import com.spring.project.student.vo.LectureVO;

@Service
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
		//String majorNum = (String)req.getSession().getAttribute("majorNum");
		
		// 수강신청 목록 갯수 구하기
		cnt = dao.getLectureCnt();
		
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
		
		if(cnt > 0) {
			// 수강신청 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			List<LectureVO> dtos = dao.lectureList(map);
			
			model.addAttribute("dtos", dtos); 
		}
		
		// 시작페이지
		// 1 = (1 / 3) * 3 + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		// 마지막 페이지
		// 3 = 1 + 3 - 1;
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("pageNum", pageNum);	// 페이지번호
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage); 		// 시작 페이지
			model.addAttribute("endPage", endPage); 			// 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); 		// 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); 		// 페이지 갯수
			model.addAttribute("currentPage", currentPage);   // 현재페이지
		}
		
	}
	
	// 강의 검색
	@Override
	public void lectureSearch(HttpServletRequest req, Model model) {
		String keyword = req.getParameter("keyword");
		
		// 강의 검색 갯수
		cnt = dao.getLectureSearchCnt(keyword);
		
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
		
		if(cnt > 0) {
			// 수강신청 목록 조회
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			List<LectureVO> dtos = dao.lectureSearch(keyword);
			
			model.addAttribute("dtos", dtos); 
		}
		
		// 시작페이지
		// 1 = (1 / 3) * 3 + 1;
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		// 마지막 페이지
		// 3 = 1 + 3 - 1;
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("pageNum", pageNum);	// 페이지번호
		
		if(cnt > 0) {
			model.addAttribute("startPage", startPage); 		// 시작 페이지
			model.addAttribute("endPage", endPage); 			// 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); 		// 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); 		// 페이지 갯수
			model.addAttribute("currentPage", currentPage);   // 현재페이지
		}
	}
	
	// 시간표 조회
	@Override
	public void schoolTimeTable(HttpServletRequest req, Model model) {
		String userNumber = (String)req.getSession().getAttribute("userNumber");
		
		List<LectureVO> dtos = dao.schoolTimeTable(userNumber);
		model.addAttribute("dtos", dtos); 
	}
	
	// 강의 신청
	@Override
	public void applyLecture(HttpServletRequest req, Model model) {
		String userNumber = (String)req.getSession().getAttribute("userNumber");
		String lecCode = req.getParameter("lecCode");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNumber", userNumber);
		map.put("lecCode", lecCode);
		cnt = dao.checkLecture(map);
		
		if (cnt == 0) {
			int selectCnt = dao.checkStudentInLecture(lecCode);
			Map<String, Object> map2 = new HashMap<String, Object>();
			map.put("lecCode", lecCode);
			map.put("selectCnt", selectCnt);
			
			cnt = dao.checkStudentInLecture2(map2);
			if(cnt == 0) {
				cnt = dao.applyLecture(map);
			}
		}
		
	}
	
	

}
