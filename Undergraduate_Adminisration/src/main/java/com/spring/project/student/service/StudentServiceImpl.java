package com.spring.project.student.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.Board.Board;
import com.spring.project.Board.BoardInterface;
import com.spring.project.admin.vo.ScholarpkVO;
import com.spring.project.share.Config;
import com.spring.project.share.vo.ShareUserInfo;
import com.spring.project.student.dao.StudentDAO;
import com.spring.project.student.vo.DetailsVO;
import com.spring.project.student.vo.GpaVO;
import com.spring.project.student.vo.LectureVO;
import com.spring.project.student.vo.Report_subVO;
import com.spring.project.student.vo.S_informationVO;
import com.spring.project.student.vo.ScholarStatus;
import com.spring.project.student.vo.middle_classVO;
import com.spring.project.student.vo.report_tblVO;


@Service
public class StudentServiceImpl extends Board implements StudentService {

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
		logger.info("keyword : "+map.get("keyword"));
		
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
	public Map<String, Object> applyLecture(Map<String, Object> map, Logger logger) {
		String userNumber = (String) map.get("userNumber");
		String lecCode = (String) map.get("lecCode");
		map.put("userNumber", userNumber);
		map.put("lecCode", lecCode);
		
		System.out.println("userNumber1 : " + userNumber);
		System.out.println("lecCode1 : " + lecCode); 
		
		int cnt = dao.checkLecture(map); // 수강신청할 강의 체크 - 학생 시간표에서 있는지 체크 
		System.out.println("cnt1 : " +cnt); 
		
		Map<String, Object> responseData = new HashMap<String,Object>();
		
		if (cnt == 0) { 	// 0 이면 시간표에 없음
			int selectCnt = dao.checkStudentInLecture(lecCode); // selectCnt 현재 강의 신청한 인원수 
			System.out.println("selectCnt2 : " + selectCnt);
			System.out.println("lecCode2 : " + lecCode); 
			Map<String, Object> map2 = new HashMap<String, Object>(); 
			map2.put("lecCode", lecCode);
			map2.put("selectCnt", selectCnt);
			  
			int cnt2 = dao.checkStudentInLecture2(map2); // 강의 최대인원수 = 현재인원수 이면 1 강의 신청실패
			System.out.println("cnt3 : " + cnt2); 
			
			if(cnt2 == 1){
				int lecSum = dao.getLectureScoreSum(map);
				if(lecSum > 18) {
					responseData.put("message","수강신청실패-18학점 이상 강의를 신청할수 없습니다.");
				} else {
					dao.applyLecture(map);
				}
				} 
			if(cnt2 != 1){
				responseData.put("message","수강신청실패-강의 신청인원이 마감되었습니다."); }
		} else {
			responseData.put("message","수강신청실패-신청하신 강의 시간이 중복되었습니다."); }
		return responseData;
	}
		 
	

	@Override
	public void lectureHover(Map<String, Object> map, Logger logger, Model model) {
		String userNumber = (String) map.get("userNumber");
		
		map.put("userNumber", userNumber);
		List<LectureVO> dtos = dao.lectureHover(map);
		model.addAttribute("dtosH", dtos);
	}
	/*대근이딴!!*/
	//이미지 업로드
	@Override
	public void s_imageUpload(MultipartHttpServletRequest req, RedirectAttributes red) {

		MultipartFile file = req.getFile("image");

		String saveDir = req.getSession().getServletContext().getRealPath("/resources/images");
		String realDir = Config.REAL_PATH; // 저장
																																				// 경로
		// 각자의 이미지 저장경로 수정하셈
		try {
			if (!file.getOriginalFilename().equals("")) {
				file.transferTo(new File(saveDir + file.getOriginalFilename()));

				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

				int data = 0;

				while ((data = fis.read()) != -1) {
					fos.write(data);
				}
				fis.close();
				fos.close();
			}
			
			
			String image = file.getOriginalFilename();
			String userNumber = (String) req.getSession().getAttribute("userNumber");

			S_informationVO vo = new S_informationVO();

			vo.setUserNumber(userNumber);

			String img = "";

			img = "/images/" + image;
			System.out.println("img" + img);

			vo.setUserImage(img);

			int imageUpload = dao.s_imageUpload(vo);

			System.out.println("프로필 이미지 변경 imageUpload : " + imageUpload);
			
			ShareUserInfo user = (ShareUserInfo) req.getSession().getAttribute("user"); 
			
			String lecName = null;
			lecName = req.getParameter("lecName");
			red.addAttribute("lecName", lecName);

			if (imageUpload == 1) {
				red.addFlashAttribute("message", "프로필 이미지를 변경하였습니다.");
				user.setUserImage(img);
				req.getSession().setAttribute("user", user);
			}
			if (imageUpload != 1)
				red.addFlashAttribute("message", "프로필 이미지를 변경하는 도중에 오류가 발생하였습니다.");

		} catch (IOException e) {
			e.printStackTrace();

		}

	}
	
	// 마이페이지
	@Override
	public void personalProfile(HttpServletRequest req, Model model) {
		String lecName = null;
		if(req.getParameter("lecName")!=null) {
			lecName = req.getParameter("lecName");
		}
		
		
		//학생 개인정보
		String userNumber = (String) req.getSession().getAttribute("userNumber");
		System.out.println("userNumber:::" + userNumber);

		S_informationVO vo = dao.personalProfile(userNumber);

		model.addAttribute("vo", vo);
		
		//수강중 강의
		List<middle_classVO> dtos = dao.s_Lecture(userNumber);
		
		model.addAttribute("dtos", dtos);
		model.addAttribute("lecName", lecName);
		
		
	}
	
	//개인정보 업데이트
	@Override
	public void s_infoupdate(HttpServletRequest req, RedirectAttributes red) {
		
		//학생 개인 정보
		String userNumber = (String) req.getSession().getAttribute("userNumber");
		String userName = req.getParameter("name");
		String userCellNum = req.getParameter("telephone");
		String zip = req.getParameter("zip");
		String userAddr1 = req.getParameter("addr1");
		String userAddr2 = req.getParameter("addr2");

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userNumber", userNumber);
		map.put("userName", userName);
		map.put("zip", zip);
		map.put("userCellNum", userCellNum);
		map.put("userAddr1", userAddr1);
		map.put("userAddr2", userAddr2);
		
		int update = dao.s_infoupdate(map);
		System.out.println("개인정보 변경1 update : " + update);

		if (update != 0)
			red.addFlashAttribute("message", "개인정보를 변경하였습니다.");
		if (update == 0)
			red.addFlashAttribute("message", "개인정보를 변경하는 도중에 오류가 발생하였습니다.");
		
		
	}
	//과제 관리
	@Override
	public void reportlist(Map<String, Object> map, Logger logger, Model model,HttpServletRequest req) {
		//과제 전체 리스트
		if(map.get("select") != null) {
			System.out.println("select ::: "+ map.get("select"));
			String userNumber = (String) map.get("userNumber");
			System.out.println("userNumber:::"+userNumber);
		List<report_tblVO> dtos2 = dao.s_report(map);
		String lecName = null;
		
		List<middle_classVO> dtos = dao.s_Lecture(userNumber);
		
		model.addAttribute("dtos", dtos);
		
		if(req.getParameter("lecName")!=null) {
			lecName = req.getParameter("lecName");
		}
		System.out.println("reportcode:::"+map.get("reportcode"));
		
		model.addAttribute("lecName", lecName);
		
		model.addAttribute("dtos2", dtos2);
		
		
		
		}
	}
	
	//과제 관리2
	@Override
	public void reportcode(Map<String, Object> map, Logger logger, Model model,HttpServletRequest req,RedirectAttributes red) {
		System.out.println("reportcode"+ map.get("reportcode"));
		//과제 전체 리스트
		report_tblVO dtos = dao.reportcontent(map);
		
		model.addAttribute("dtos", dtos);
		if(dtos.getProgress() < 0) {
			red.addFlashAttribute("message", "과제 제출 기간이 마감 되었습니다.");
		}
		//과제 제출 완료 확인
		int reportCheck = dao.reportCheck(map);
		System.out.println("reportCheck:::"+reportCheck);
		
		//과제 제출 하기
		Report_subVO vo = dao.reportsub(map);
		
		String lecName = null;
		if(req.getParameter("lecName")!=null) {
			lecName = req.getParameter("lecName");
		}
		model.addAttribute("reportCheck", reportCheck);
		model.addAttribute("lecName", lecName);
		model.addAttribute("vo", vo);
		
	}
	//과제 제출 완료
	@Override
	public void assignment(MultipartHttpServletRequest req, RedirectAttributes red) {
		MultipartFile file = req.getFile("website");

		String saveDir = req.getSession().getServletContext().getRealPath("/resources/file");
		String realDir = Config.FILES; // 저장
																																				// 경로
		// 각자의 이미지 저장경로 수정하셈
		try {
			if (!file.getOriginalFilename().equals("")) {
				file.transferTo(new File(saveDir + file.getOriginalFilename()));

				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

				int data = 0;

				while ((data = fis.read()) != -1) {
					fos.write(data);
				}
				fis.close();
				fos.close();
			}
			String Hwp = file.getOriginalFilename();
			String userNumber = (String) req.getSession().getAttribute("userNumber");
			int reportcode = Integer.parseInt(req.getParameter("reportcode"));
			String title = req.getParameter("title");
			String userName = req.getParameter("userName");
			String lecName = req.getParameter("lecName");

			Report_subVO vo = new Report_subVO();

			vo.setUserNumber(userNumber);
			vo.setReportcode(reportcode);
			vo.setTitle(title);
			vo.setUserName(userName);
			
			System.out.println("userNumber"+userNumber);
			System.out.println("reportcode"+reportcode);
			System.out.println("title"+title);
			System.out.println("userName"+userName);
			

			String hwps = "";

			hwps = "/file/" + Hwp;
			System.out.println("img" + hwps);

			vo.setFileName(hwps);

			int fileUpload = dao.s_fileUpload(vo);

			System.out.println("파일제출 fileUpload : " + fileUpload);
			red.addAttribute("lecName", lecName);
			System.out.println("lecName:::"+lecName);
			/*ShareUserInfo user = (ShareUserInfo) req.getSession().getAttribute("user"); */

			if (fileUpload == 1) {
				red.addFlashAttribute("message", "제출이 완료 되었습니다.");
				System.out.println("파일 업로드 완료 :::");
			}
			if (fileUpload != 1) 
				red.addFlashAttribute("message", "제출이 실패 했습니다. 다시한번 확인 바랍니다");
			System.out.println("파일 업로드 실패 :::");

		} catch (IOException e) {
			e.printStackTrace();

		}
	}


	
	
	//장학금  글 목록
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
		cnt = dao.getArticleCnt(map);

		logger.info("Message total : " + cnt);

		pageCount = cnt / pageSize + (cnt % pageSize > 0 ? 1 : 0);

		start = (pageNum - 1) * pageSize + 1;
		end = start + pageSize - 1;

		map.put("start", start);
		map.put("end", end);
		
		if (end > cnt)
			end = cnt;

		number = cnt - (pageNum - 1) * pageSize;

		logger.info("userNumber : " + map.get("userNumber"));
		logger.info("start : " + map.get("start"));
		logger.info("end : " + map.get("end"));
		logger.info("year : " + map.get("year"));
		logger.info("smester : " + map.get("smester"));
		logger.info("cnt : " + cnt);
		
		if (cnt > 0) {
			// 장학신청 목록 조회
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
	
	//장학금  수혜 내역 목록
	// dao.management_cnt(map)
	// dao.managementList(map)
	@Override
	public void management(Map<String, Object> map, Logger logger, Model model) {
		setList(map, model, new BoardInterface() {
			
			@Override
			public int getListCount(Map<String, Object> map) {
				return dao.management_cnt(map);
			}
			
			@Override
			public List<Object> getList(Map<String, Object> map) {
				List<Object> list = dao.managementList(map);
				ScholarStatus scholarStatus = ScholarStatus.FALSE;
				for(Object obj : list) {
					if(obj instanceof DetailsVO)
						((DetailsVO)obj).setStrStat(
								scholarStatus.findByType(((DetailsVO)obj)
										.getStatcode()).getStrValue());
				}
				return list;
			}
		});
	}
	//장학금 상세
	@Override
	public void contentForm(HttpServletRequest req, Model model) {
		int scholarpk = Integer.parseInt(req.getParameter("scholarpk"));//sql용
		
		
		//5-2 상세페이지
		ScholarpkVO dto = dao.getArticle(scholarpk);
		 System.out.println();
		 
				
		//6단계 request나 session 에 처리 결과를 저장 (jsp에 전달하기 위함)
		model.addAttribute("dto", dto);
		
	}
	//장학금 신청 완료
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
		
		int totalLecPoint = dao.getTotalLecPoint(userNumber);
		model.addAttribute("totalLecPoint", totalLecPoint);
	}
	
	// 강의 취소
	@Override
	public Map<String, Object> cancelLecture(Map<String, Object> map, Logger logger) {
		Map<String, Object> responseData = new HashMap<String,Object>();
		/*String userNumber = (String) map.get("userNumber");
		String lecCode = (String) map.get("lecCode");
		map.put("userNumber", userNumber);
		map.put("lecCode", lecCode);*/
		
		int deleteCnt = dao.cancelLecture(map);
		if(deleteCnt > 0) {
		} else {
			responseData.put("message","수강신청 취소 에러메시지!!"); 
		}
		return responseData;
	}
	// 강의 목록 조회(전공)
	@Override
	public void lectureListMajor(Model model) {
		List<LectureVO> dtos = dao.getMajor();
		model.addAttribute("dtosM", dtos);
		
		int status = dao.getBachelorStatus();
		model.addAttribute("status", status);
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
		
		
		//이수학점조회
		 List<GpaVO> granted = dao.grantedCredit(userNumber);
		 model.addAttribute("granted", granted);
		 
		
	}
	
	// 시간표만 조회
	@Override
	public void bigschoolTimeTable(HttpServletRequest req, Model model) {
		String userNumber = (String) req.getSession().getAttribute("userNumber");
		
		List<LectureVO> dtos = dao.schoolTimeTable(userNumber);
		System.out.println("dtos : " + dtos);
		
		model.addAttribute("dtosT", dtos);
		
	}
	
	// 수강신청 페이지 진입(종강 개강 시기에 따라)
	@Override
	public String lectureList_Manager(HttpServletRequest req, RedirectAttributes red) {
		int status = 0;
		
		String referer = req.getHeader("referer");
		
		status = dao.getBachelorStatus();
		
		if(status == 3) {
			if(referer!=null) {
				red.addFlashAttribute("message", "종강 상태시 접근 불가능합니다.");
				return "redirect:"+referer;
			}else {
				red.addFlashAttribute("message", "종강 상태시 접근 불가능합니다.");
				return "redirect:/student/index";
			}
		}else {
			return "redirect:/student/lectureList";
		}	
	}
}
