package com.spring.project.student.service;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.admin.vo.ScholarpkVO;
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
	String pageNum = null;	// 페이지 번호
	int currentPage = 0;	// 현재페이지
	
	int pageCount = 0;		// 페이지 갯수
	int startPage = 0;		// 시작 페이지
	int endPage = 0;		// 마지막 페이지
	
	// 수강 신청 목록
	@Override
	public void lectureList(Map<String, Object> map, Model model) {
		String majorNum = (String)map.get("majorNum");
		
		// 수강신청 목록 갯수 구하기
		cnt = dao.getLectureCnt();
		
		pageNum = (String)map.get("pageNum");
		
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
			/*Map<String, Object> map = new HashMap<String, Object>();*/
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
	public void lectureSearch(Map<String, Object> map, Model model) {
		String keyword = (String)map.get("keyword");
		
		// 강의 검색 갯수
		cnt = dao.getLectureSearchCnt(keyword);
		
		pageNum = (String)map.get("pageNum");
		
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
			/*Map<String, Object> map = new HashMap<String, Object>();*/
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
	public void schoolTimeTable(Map<String, Object> map, Model model) {
		String userNumber = (String)map.get("userNumber");
		
		List<LectureVO> dtos = dao.schoolTimeTable(userNumber);
		model.addAttribute("dtos", dtos); 
	}
	
	// 강의 신청
	@Override
	public void applyLecture(Map<String, Object> map, RedirectAttributes red) {
		String userNumber = (String)map.get("userNumber");
		String lecCode = (String)map.get("lecCode");
		
		map.put("userNumber", userNumber);
		map.put("lecCode", lecCode);
		cnt = dao.checkLecture(map);  // 수강신청할 강의 체크 
		System.out.println("cnt1 : " + cnt);
		if (cnt != 0) {	
			int selectCnt = dao.checkStudentInLecture(lecCode);  // selectCnt 현재 강의 신청한 인원수
			System.out.println("selectCnt : " + cnt);
			System.out.println("lecCode : " + lecCode);
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("lecCode", lecCode);
			map2.put("selectCnt", selectCnt);
			
			int cnt2 = dao.checkStudentInLecture2(map2);	// 강의 최대인원수 = 현재인원수 이면 1 강의 신청실패
			System.out.println("cnt2 : " + cnt);
			red.addFlashAttribute("message", "");
			if(cnt2 == 0) {
				dao.applyLecture(map);
				red.addFlashAttribute("message", "수강신청완료");
			} if(cnt2 != 0) {
				red.addFlashAttribute("message", "수강신청실패-강의 신청인원이 마감되었습니다.");
			}
		}
		
	}

	@Override
	public void bulletin(HttpServletRequest req, Model model) {
		int pageSize =5; 		 //한페이지당 출력할 글 갯수
		int pageBlock = 3;		 //한블럭당 페이지 갯수
		
		int cnt = 0 ;		 	//글갯수
		int start =0;		 	//현재 페이지 시작 글번호
		int end= 0; 			//현재페이지 마지막 글번호
		int number = 0; 		//출력용 글번호
		String pageNum = "";	//페이지번호
		int currentPage = 0;	//현재페이지
		
		int pageCount = 0;		//페이지 갯수
		int startPage  = 0;		//시작 페이지
		int endPage  = 0;//마지막 페이지
		
		//5단계.글의갯수 구하기
		cnt = dao.getArticleCnt();
		
		//6단계
		req.setAttribute("selectCnt", cnt);
		System.out.println(cnt);//먼저 30건출력
		
		pageNum =req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum="1";//첫페이지를 1페이지로 지정
		}
		
		//글30건 기준
		currentPage = Integer.parseInt(pageNum);//현재페이지 :1
		System.out.println("currentPage : "+currentPage);
		
		//페이지 갯수 6 =(30/5)+0
		pageCount=(cnt/pageSize) + (cnt%pageSize >0 ? 1:0);//페이지 갯수 + 나머지있으면1
		
		//현재 페이지 시작 글번호(페이지별)
		//1 =(1-1)*5+1 
		start =(currentPage - 1)* pageSize +1;
		
		//현재 페이지 마지막 글번호(페이지별)
		//5 = 1 + 5 -1;
		end = start + pageSize -1;
		
		System.out.println("start : " +start);
		System.out.println("end : " +end);
		
		if(end>cnt) end =cnt;
		
		//출력형 글번호
		//30 = 30- (1-1) *5
		number = cnt - (currentPage - 1) * pageSize;//출력용 글번호
		
		System.out.println("number : " +number);
		System.out.println("pageSize : " +pageSize);
		
		if(cnt>0) {
			//5-2게시글 목록 조회
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			List<ScholarpkVO> dtos=dao.getArticleList(map);
			
			//jsp로 넘겨라
			model.addAttribute("dtos", dtos);//큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글 1건
		}
		
		//6단계 request나 session 에 처리 결과를 저장 (jsp에 전달하기 위함)
		
		//시작페이지
		// 1 = (1 / 3) *3+1;
		startPage = (currentPage / pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("startPage : " + startPage);
			
		//마지막페이지
		//3 = 1+3-1
		endPage = startPage + pageBlock -1;
		if(endPage > pageCount) endPage =pageCount;
		System.out.println("endPage : " + endPage);
		System.out.println("==================");
		
		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		if(cnt>0) {
			model.addAttribute("startPage", startPage);//시작페이지
			model.addAttribute("endPage", endPage);//마지막페이지
			model.addAttribute("pageBlock", pageBlock);//출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount);//페이지갯수
			model.addAttribute("currentPage", currentPage);//현재페이지
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
		
	

	//@Override
	//public void management(HttpServletRequest req, Model model) {
		// TODO Auto-generated method stub
		
	//}
	
	

}
