package com.spring.project.student.service;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.admin.vo.ScholarpkVO;
import com.spring.project.restful.vo.Message;
import com.spring.project.student.dao.StudentDAO;
import com.spring.project.student.vo.GpaVO;
import com.spring.project.student.vo.LectureVO;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentDAO dao;

	// 수강 신청 목록
	@Override
	public void lectureList(Map<String, Object> map, Logger logger, Model model) {
		// String majorNum = (String)map.get("majorNum");

		// 페이지

		List<LectureVO> dtos = null;

		int pageSize = 0; // 한 페이지당 출력할 글 갯수
		int pageBlock = 5; // 한블럭당 페이지 갯수

		int cnt = 0; // 총 글 갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글번호
		int pageNum = 0; // 페이지 번호
		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		if (!map.containsKey("pageSize")) {
			pageSize = 10;
		} else
			pageSize = Integer.parseInt((String) map.get("pageSize"));

		if (!map.containsKey("pageNum"))
			pageNum = 1;
		else
			pageNum = (Integer) map.get("pageNum");
		// 수강신청 목록 갯수 구하기
		cnt = dao.getLectureCnt(map);

		logger.info("Lecture total : " + cnt);

		pageCount = cnt / pageSize + (cnt % pageSize > 0 ? 1 : 0);

		start = (pageNum - 1) * pageSize + 1;
		end = start + pageSize - 1;

		logger.info("start : " + start);
		logger.info("end : " + end);
		map.put("start", start);
		map.put("end", end);

		if (end > cnt)
			end = cnt;

		number = cnt - (pageNum - 1) * pageSize;

		logger.info("userNumber : " + map.get("userNumber"));
		logger.info("start : " + map.get("start"));
		logger.info("end : " + map.get("end"));
		
		if (cnt > 0) {
			// 수강신청 목록 조회
			map.put("start", start);
			map.put("end", end);

			dtos = dao.lectureList(map);

			model.addAttribute("dtosL", dtos);
		}

		// 시작페이지
		// 1 = (1 / 3) * 3 + 1;
		startPage = (pageNum / pageBlock) * pageBlock + 1;
		if (pageNum % pageBlock == 0)
			startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1;

		// 마지막 페이지
		// 3 = 1 + 3 - 1;
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("pageNum", pageNum); // 페이지번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("pageSize", pageSize); // 현재페이지
		}

	}

	// 시간표 조회
	@Override
	public void schoolTimeTable(Map<String, Object> map, Logger logger, Model model) {
		String userNumber = (String) map.get("userNumber");

		List<LectureVO> dtos = dao.schoolTimeTable(userNumber);
		System.out.println("dtos : " + dtos);
		
		model.addAttribute("dtosT", dtos);
	}

	// 강의 신청
	@Override
	public void applyLecture(Map<String, Object> map, Logger logger, RedirectAttributes red) {
		String userNumber = (String) map.get("userNumber");
		String lecCode = (String) map.get("lecCode");

		map.put("userNumber", userNumber);
		map.put("lecCode", lecCode);
		
		System.out.println("userNumber1 : " + userNumber);
		System.out.println("lecCode1 : " + lecCode); 
		
		int cnt = dao.checkLecture(map); // 수강신청할 강의 체크 - 학생 시간표에서 있는지 체크 
		System.out.println("cnt1 : " +cnt); 
		if (cnt == 0) { 	// 0 이면 시간표에 없음
			int selectCnt = dao.checkStudentInLecture(lecCode); // selectCnt 현재 강의 신청한 인원수 
			System.out.println("selectCnt2 : " + selectCnt);
			System.out.println("lecCode2 : " + lecCode); 
			Map<String, Object> map2 = new HashMap<String, Object>(); 
			map2.put("lecCode", lecCode);
			map2.put("selectCnt", selectCnt);
			  
			int cnt2 = dao.checkStudentInLecture2(map2); // 강의 최대인원수 = 현재인원수 이면 1 강의 신청실패
			System.out.println("cnt3 : " + cnt2); 
			red.addFlashAttribute("message", "");
			if(cnt2 == 1){
				dao.applyLecture(map); 
				red.addFlashAttribute("message","수강신청완료"); } 
			if(cnt2 != 1){
				red.addFlashAttribute("message","수강신청실패-강의 신청인원이 마감되었습니다."); }
		} else {
			red.addFlashAttribute("message","수강신청실패-신청하신 강의 시간이 중복되었습니다."); }
	}
		 
	

	@Override
	public void lectureHover(Map<String, Object> map, Logger logger, Model model) {
		String userNumber = (String) map.get("userNumber");
		
		map.put("userNumber", userNumber);
		List<LectureVO> dtos = dao.lectureHover(map);
		model.addAttribute("dtosH", dtos);
	}

	@Override
	public void bulletin(Map<String, Object> map, Logger logger, Model model) {
		
		
		int pageSize = 0; // 한 페이지당 출력할 글 갯수
		int pageBlock = 5; // 한블럭당 페이지 갯수

		int cnt = 0; // 총 글 갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글번호
		int pageNum = 0; // 페이지 번호
		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		if (!map.containsKey("pageSize")) {
			pageSize = 10;
		} else
			pageSize = Integer.parseInt((String) map.get("pageSize"));

		if (!map.containsKey("pageNum"))
			pageNum = 1;
		else
			pageNum = (Integer) map.get("pageNum");
		// 수강신청 목록 갯수 구하기
		cnt = dao.getArticleCnt();

		logger.info("Message total : " + cnt);

		pageCount = cnt / pageSize + (cnt % pageSize > 0 ? 1 : 0);

		start = (pageNum - 1) * pageSize + 1;
		end = start + pageSize - 1;

		logger.info("start : " + start);
		logger.info("end : " + end);
		map.put("start", start);
		map.put("end", end);

		if (end > cnt)
			end = cnt;

		number = cnt - (pageNum - 1) * pageSize;

		logger.info("userNumber : " + map.get("userNumber"));
		logger.info("start : " + map.get("start"));
		logger.info("end : " + map.get("end"));
		
		if (cnt > 0) {
			// 수강신청 목록 조회
			map.put("start", start);
			map.put("end", end);

			List<ScholarpkVO> dtos = dao.getArticleList(map);

			model.addAttribute("dtos", dtos);
		}

		// 시작페이지
		// 1 = (1 / 3) * 3 + 1;
		startPage = (pageNum / pageBlock) * pageBlock + 1;
		if (pageNum % pageBlock == 0)
			startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1;

		// 마지막 페이지
		// 3 = 1 + 3 - 1;
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 출력용 글번호
		model.addAttribute("pageNum", pageNum); // 페이지번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("pageSize", pageSize); // 현재페이지
		}
		

		
		
		
	}

	@Override
	public void contentForm(HttpServletRequest req, Model model) {
		int scholarpk = Integer.parseInt(req.getParameter("scholarpk"));//sql용
		
		
		//5-2 상세페이지
		ScholarpkVO dto = dao.getArticle(scholarpk);
		 System.out.println();
		 
				
		//6단계 request나 session 에 처리 결과를 저장 (jsp에 전달하기 위함)
		model.addAttribute("dto", dto);
		
	}

	@Override
	public void apply(HttpServletRequest req, RedirectAttributes red) {
		String userNumber = (String)req.getSession().getAttribute("userNumber");
		String scholarpk = req.getParameter("scholarpk");
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userNumber", userNumber);
		map.put("scholarpk", scholarpk);
		
		//중복확인
		int scholarpkCnt = dao.scholarpk(map);
		System.out.println("scholarpkCnt" +scholarpkCnt);
		
		//추가
		
		
		if(scholarpkCnt != 1) {
			int cnt = dao.scholarshipinsert(map);
			red.addFlashAttribute("message","신청이 완료 되었습니다");
			System.out.println("3333333333333");
		}else {
			red.addFlashAttribute("message","이미 신청 완료 되었습니다");
		}
	}
		
	

	//@Override
	//public void management(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	//}
	
	// 내 강의 신청 내역
	@Override
	public void studentMyLecture(Map<String, Object> map, Logger logger, Model model) {
		String userNumber = (String) map.get("userNumber");
		System.out.println("userNumber : " + userNumber);
		List<LectureVO> dtos = dao.studentMyLecture(userNumber);
		model.addAttribute("dtosM", dtos);
	}
	
	// 강의 취소
	@Override
	public void cancelLecture(Map<String, Object> map, Logger logger, RedirectAttributes red) {
		String userNumber = (String) map.get("userNumber");
		String lecCode = (String) map.get("lecCode");
		map.put("userNumber", userNumber);
		map.put("lecCode", lecCode);
		
		int deleteCnt = dao.cancelLecture(map);
		if(deleteCnt > 0) {
			red.addFlashAttribute("message","수강신청 취소 완료"); 
		} else {
			red.addFlashAttribute("message","수강신청 취소 에러메시지!!"); 
		}
	}
	// 강의 목록 조회(전공)
	@Override
	public void lectureListMajor(Model model) {
		List<LectureVO> dtos = dao.getMajor();
		model.addAttribute("dtosM", dtos);
		
	}
	
	// 내 학점 조회
	@Override
	public void GPA(HttpServletRequest req, Model model) {
		String userNumber = (String)req.getSession().getAttribute("userNumber");
		
		// 전체학기 성적 목록
		List<GpaVO> dtos = dao.GPA(userNumber);
		model.addAttribute("dtos", dtos);
		
		// 신청 학점
		int applyCredit = dao.ApplyCredit(userNumber);
		model.addAttribute("applyCredit", applyCredit);
	}

}
