package com.spring.project.professor.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.professor.dao.ProfesserDAO;
import com.spring.project.professor.vo.ClassStudentVO;
import com.spring.project.professor.vo.LecScore;
import com.spring.project.professor.vo.LectureP_VO;
import com.spring.project.professor.vo.MyClassVO;
import com.spring.project.professor.vo.MyPageVO;
import com.spring.project.professor.vo.PlanVO;
import com.spring.project.professor.vo.Report_tblVO;
import com.spring.project.professor.vo.SearchVO;
import com.spring.project.professor.vo.StudentVO;
import com.spring.project.professor.vo.Submission_ListVO;
import com.spring.project.share.Config;
import com.spring.project.share.vo.ShareUserInfo;

@Service
public class ProfessorServiceImpl implements ProfessorService {

	@Autowired
	ProfesserDAO dao;

	// 마이페이지
	@Override
	public void myPage(HttpServletRequest req, Model model) {

		String userNumber = (String) req.getSession().getAttribute("userNumber");

		MyPageVO vo = dao.myPage(userNumber);

		model.addAttribute("vo", vo);
	}
	// 프로필 이미지 변경
	@Override
	public void imageUpload(MultipartHttpServletRequest req, RedirectAttributes red) {

		MultipartFile file = req.getFile("image");

		String saveDir = req.getSession().getServletContext().getRealPath("/resources/images");
		String realDir = Config.REAL_PATH; // 저장
		String fileName = UUID.randomUUID().toString()+"-"+file.getOriginalFilename();
																																				// 경로
		// 각자의 이미지 저장경로 수정하셈
		try {
			if (!file.getOriginalFilename().equals("")) {
				file.transferTo(new File(saveDir + file.getOriginalFilename()));

				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(realDir + fileName);

				int data = 0;

				while ((data = fis.read()) != -1) {
					fos.write(data);
				}
				fis.close();
				fos.close();
			}
			String userNumber = (String) req.getSession().getAttribute("userNumber");

			MyPageVO vo = new MyPageVO();

			vo.setUserNumber(userNumber);

			String img = "/images/" + fileName;

			vo.setUserImage(img);

			int imageUpload = dao.imageUpload(vo);

			System.out.println("프로필 이미지 변경 imageUpload : " + imageUpload);
			
			ShareUserInfo user = (ShareUserInfo) req.getSession().getAttribute("user"); 

			if (imageUpload == 1) {
				red.addFlashAttribute("message", "프로필 이미지를 변경하였습니다.");
				red.addFlashAttribute("alertIcon","success");
				user.setUserImage(img);
				req.getSession().setAttribute("user", user);
			}
			if (imageUpload != 1) {
				red.addFlashAttribute("message", "프로필 이미지를 변경하는 도중에 오류가 발생하였습니다.");
				red.addFlashAttribute("alertIcon","error");
			}
		} catch (IOException e) {
			e.printStackTrace();

		}

	}
	//교수 소개 업데이트
	@Override
	public void introUpdate(HttpServletRequest req, RedirectAttributes red) {

		String userNumber = (String) req.getSession().getAttribute("userNumber");
		String introduction = req.getParameter("introduction");

		MyPageVO vo = new MyPageVO();

		vo.setUserNumber(userNumber);
		vo.setIntroduction(introduction);

		int introUpdate = dao.introUpdate(vo);

		System.out.println("교수 소개 변경 introUpdate : " + introUpdate);

		if (introUpdate == 1) {
			red.addFlashAttribute("message", "교수 소개를 변경하였습니다.");
			red.addFlashAttribute("alertIcon","success");
		}
		if (introUpdate != 1) {
			red.addFlashAttribute("message", "교수 소개르 변경하는 도중에 오류가 발생하였습니다.");
			red.addFlashAttribute("alertIcon","error");
		}

	}

	// 개인정보 업데이트
	@Override
	public void update(HttpServletRequest req, RedirectAttributes red) {

		String userNumber = (String) req.getSession().getAttribute("userNumber");
		String userName = req.getParameter("name");
		String userEngName = req.getParameter("ename");
		String userPassword = req.getParameter("password");
		String userCellNum = req.getParameter("telephone");
		String userEmail = req.getParameter("email");
		String userAddr1 = req.getParameter("address1");
		String userAddr2 = req.getParameter("address2");

		String accountNumber = req.getParameter("accountNumber");
		String bankName = req.getParameter("bankName");

		// String userZipCode = req.getparameter("zipcode");

		MyPageVO vo = new MyPageVO();
		
		vo.setBankName(bankName);
		vo.setAccountNumber(accountNumber);
		
		vo.setUserNumber(userNumber);
		vo.setUserName(userName);
		vo.setUserEngName(userEngName);
		vo.setUserPassword(userPassword);
		vo.setUserCellNum(userCellNum);
		vo.setUserEmail(userEmail);
		vo.setUserAddr1(userAddr1);
		vo.setUserAddr2(userAddr2);

		int update = dao.update(vo);
		System.out.println("개인정보 변경1 update : " + update);

		int update2 = dao.update2(vo);
		System.out.println("개인정보 변경2 update : " + update2);

		int up = update2 + update;

		if (up == 2) {
			red.addFlashAttribute("message", "개인정보를 변경하였습니다.");
			red.addFlashAttribute("alertIcon","success");
		}
		if (up != 2) {
			red.addFlashAttribute("message", "개인정보를 변경하는 도중에 오류가 발생하였습니다.");
			red.addFlashAttribute("alertIcon","error");
		}
	}	

	
	
	
	
	//내 강의 학생 목록
	@Override
	public void list(HttpServletRequest req, Model model) {
		
		String userNumber = (String) req.getSession().getAttribute("userNumber");
		
		List<MyClassVO> myClass = dao.myClass(userNumber);
		
		System.out.println("교수 강의 목록  myClass : " + myClass);
		
		List<StudentVO> list = dao.list(userNumber);
		
		System.out.println("내 강의 모든 학생 list : " + list);
		
		model.addAttribute("list",list);
		model.addAttribute("myClass",myClass);
		
	}
	
	//강의별 수강학생 목록
	@Override
	public void getStudent(Map<String, Object> map, HttpServletRequest req, Model model) {
		
		String userNumber = (String) req.getSession().getAttribute("userNumber");
		String lecName = (String) map.get("lecName");
		
		map.put("userNumber", userNumber);
		map.put("lecName", lecName);
		
		List<ClassStudentVO> vo = dao.getStudent(map);
		
		System.out.println("내 강의 모든 학생 vo : " + vo);
		
		model.addAttribute("vo",vo);
		
	}
	//학생검색
	@Override
	public void search_student(Map<String, Object> map, HttpServletRequest req, Model model) {
		
		String userNumber = (String) req.getSession().getAttribute("userNumber");
		String userName = (String) map.get("search");
		
		map.put("userNumber", userNumber);
		map.put("userName", userName);
		
		List<SearchVO> search_student = dao.search_student(map);
		
		System.out.println("내 강의 학생검색 search_student : " + search_student);
		
		model.addAttribute("search_student",search_student);
	}
	//학생검색 후 클릭 시
	@Override
	public void search_student_click(Map<String, Object> map, HttpServletRequest req, Model model) {
		String userNumber = (String) req.getSession().getAttribute("userNumber");
		String stdName = (String) map.get("studentName");
		
		map.put("userNumber", userNumber);
		map.put("stdName", stdName);
		
		List<SearchVO> search_student_click = dao.search_student_click(map);
		
		System.out.println("내 강의 학생검색 듣는 강의 search_student_click : " + search_student_click);
		
		model.addAttribute("search_student_click",search_student_click);
	}

	
	
	//학점입력 페이지
	@Override
	public void score(HttpServletRequest req, Model model) {
		String userNumber = (String) req.getSession().getAttribute("userNumber");
		
		String lecName = null;
		if(req.getParameter("lecName")!=null)
			lecName = req.getParameter("lecName");
		
		
		List<MyClassVO> s_myClass = dao.s_myClass(userNumber);
		
		System.out.println("교수 강의 목록  s_myClass : " + s_myClass);
		
		List<MyClassVO> v_myClass = dao.v_myClass(userNumber);
		
		System.out.println("교수 강의 목록  v_myClass : " + v_myClass);
		
		MyClassVO vo = s_myClass.get(0);
		
		model.addAttribute("firstClass",vo);
		model.addAttribute("v_myClass",v_myClass);
		model.addAttribute("s_myClass",s_myClass);
		model.addAttribute("lecName", lecName);
	}
	//학점관리 첫번째 강의부분
	@Override
	public void firstLec(Map<String, Object> map, HttpServletRequest req, Model model) {
		
		String userNumber = (String) req.getSession().getAttribute("userNumber");
		String firstLec = (String) map.get("firstLec");
		
		map.put("userNumber", userNumber);
		map.put("firstLec", firstLec);
		
		List<LecScore> vo = dao.firstLec(map);
		
		System.out.println("첫번째 강의 학생 학점정보  vo : " + vo);
		
		model.addAttribute("vo",vo);
		
	}
	//학점관리 나머지 부분
	@Override
	public void getLecScore(Map<String, Object> map, HttpServletRequest req, Model model) {
		String userNumber = (String) req.getSession().getAttribute("userNumber");
		String lecName = (String) map.get("lecName");
		
		map.put("userNumber", userNumber);
		map.put("lecName", lecName);
		
		List<LecScore> vo = dao.getLecScore(map);
		
		System.out.println("온클릭 강의 학생 학점정보  vo : " + vo);
		
		model.addAttribute("vo",vo);
		
	}
	//학점 입력
	@Override
	public void insertScore(HttpServletRequest req, RedirectAttributes red) {
		
		String jscore = req.getParameter("score");
		String credit = req.getParameter("credit");
		String semester = req.getParameter("semester2");
		String infoCode = req.getParameter("infoCode");
		String grade = req.getParameter("grade");
		String userName = req.getParameter("userName");
		String lecName = req.getParameter("lecName");
		
		LecScore vo = new LecScore();
		
		vo.setCredit(credit);
		vo.setGrade(grade);
		vo.setIncode(infoCode);
		vo.setJscore(jscore);
		vo.setSemester2(semester);

		int insertScore = dao.insertScore(vo);
		System.out.println("학점입력 insertScore : " + insertScore);


		int up = insertScore;

		if (up == 1) {
			red.addFlashAttribute("message", userName+" 학생의 학점 "+credit+" 을 입력하였습니다.");
			red.addFlashAttribute("alertIcon","success");
		}
		if (up != 1) {
			red.addFlashAttribute("message", "학점을 입력하는 과정에서 오류가 발생하였습니다.");
			red.addFlashAttribute("alertIcon","error");
		}
		red.addAttribute("lecName", lecName);
		
	}
	//학점수정
	@Override
	public void updateScore(HttpServletRequest req, RedirectAttributes red) {
		String jscore = req.getParameter("score");
		String credit = req.getParameter("credit2");
		String infoCode = req.getParameter("infoCode");
		String userName = req.getParameter("userName2");
		String lecName = req.getParameter("lecName");
		LecScore vo = new LecScore();
		
		vo.setIncode(infoCode);
		vo.setJscore(jscore);
		vo.setCredit(credit);
		
		int updateScore = dao.updateScore(vo);
		System.out.println("학점입력 updateScore : " + updateScore);


		int up = updateScore;

		if (up == 1) {
			red.addFlashAttribute("message", userName+" 학생의 학점을 "+credit+" 로 수정하였습니다.");
			red.addFlashAttribute("alertIcon","success");
		}
		if (up != 1) {
			red.addFlashAttribute("message", "학점을 수정하는 과정에서 오류가 발생하였습니다.");
			red.addFlashAttribute("alertIcon","error");
		}
		red.addAttribute("lecName", lecName);
	}
	//강의계획서 진입
	@Override
	public void plan(HttpServletRequest req, Model model) {
		
		String userNumber = (String) req.getSession().getAttribute("userNumber");
		String lecName = null;
		
		if(req.getParameter("lecName")!= null)
			lecName  = (String) req.getParameter("lecName");
		
		
		
		List<PlanVO> vo1 = dao.plan(userNumber);
		List<PlanVO> vo2 = dao.plan2(userNumber);
		
		System.out.println("교수 강의 목록  vo1 : " + vo1);
		System.out.println("교수 강의 목록  vo2 : " + vo2);
		
		if(lecName!=null)
			model.addAttribute("lecName", lecName);
		
		model.addAttribute("vo1",vo1);
		model.addAttribute("vo2",vo2);
	}
	//강의계획서 첫번째 
	@Override
	public void firstPlan(Map<String, Object> map, HttpServletRequest req, Model model) {
		
		String userNumber = (String) req.getSession().getAttribute("userNumber");
		String firstLec = (String) map.get("firstLec");
		
		map.put("userNumber", userNumber);
		map.put("firstLec", firstLec);
		
		List<PlanVO> vo = dao.firstPlan(map);
		
		System.out.println("첫번째 강의 강의계획서  vo : " + vo);
		
		model.addAttribute("vo",vo);
		
	}
	//강의계획서 나머지 클릭
	@Override
	public void getPlan(Map<String, Object> map, HttpServletRequest req, Model model) {
		String userNumber = (String) req.getSession().getAttribute("userNumber");
		String lecName = (String) map.get("lecName");
		
		map.put("userNumber", userNumber);
		map.put("lecName", lecName);

		List<PlanVO> vo = dao.getPlan(map);
		
		System.out.println("나머지 강의 강의계획서  vo : " + vo);
		
		model.addAttribute("vo",vo);
	}
	
	//강의계획서 입력
	@Override
	public void insertPlan(HttpServletRequest req, RedirectAttributes red) {
		
		String lecCode = req.getParameter("lecCode");
		String contents = req.getParameter("contents");
		String text = req.getParameter("text");
		String week = req.getParameter("week");
		
		String lecName = req.getParameter("lecName");
		
		PlanVO vo = new PlanVO();
		
		vo.setContents(contents);
		vo.setLecCode(lecCode);
		vo.setText(text);
		vo.setWeek(week);
		
		int insertPlan = dao.insertPlan(vo);
		System.out.println("강의계획서 입력 insertPlan : " + insertPlan);


		int up = insertPlan;

		if (up == 1) {
			red.addFlashAttribute("message", lecName +" 의 강의계획을 작성하였습니다.");
			red.addFlashAttribute("alertIcon","success");
		}
		if (up != 1) {
			red.addFlashAttribute("message", "강의계획서를 입력하는 중 오류가 발생하였습니다.");
			red.addFlashAttribute("alertIcon","error");
		}
		
		red.addAttribute("lecName", lecName);
	}
	//강의계획서 수정
	@Override
	public void updatePlan(HttpServletRequest req, RedirectAttributes red) {
		
		String lecCode = req.getParameter("lecCode");
		String contents = req.getParameter("contents");
		String text = req.getParameter("text");
		String week = req.getParameter("week");
		
		String lecName = req.getParameter("lecName");
		
		PlanVO vo = new PlanVO();
		
		vo.setContents(contents);
		vo.setLecCode(lecCode);
		vo.setText(text);
		vo.setWeek(week);
		
		int updatePlan = dao.updatePlan(vo);
		System.out.println("강의계획서 수정 updatePlan : " + updatePlan);
		
		
		int up = updatePlan;
		
		if (up == 1) {
			red.addFlashAttribute("message", lecName +"의" +week+" 주차 강의계획을 수정하였습니다.");
			red.addFlashAttribute("alertIcon","success");
		}
		if (up != 1) {
			red.addFlashAttribute("message", "강의계획서를 수정하는 중 오류가 발생하였습니다.");
			red.addFlashAttribute("alertIcon","error");
		}
		
		red.addAttribute("lecName", lecName);
		
	}
	
	//ㄷㅐ그니 단~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	//과제관리
	@Override
	public void report(HttpServletRequest req, Model model) {
		String userNumber = (String) req.getSession().getAttribute("userNumber");
		
		
		//내 강의 목록
		List<LectureP_VO> vo = dao.P_Lecture(userNumber);
		
		System.out.println("나머지 강의 강의계획서  vo : " + vo);
		
		//강의 인원
		model.addAttribute("vo",vo);
	}
	//과제 관리
	@Override
	public void personnel(Map<String, Object> map, HttpServletRequest req, Model model) {
	/*	String abc = req.getParameter("aaaaa");
		System.out.println("aaaaa"+abc);*/
		System.out.println("select" + map.get("select"));
		
		//총수강 인원
		int personCnt = dao.personnel(map);
		
		//과제 있는지 여부
		int reportCnt = dao.p_report(map);
		
		if(reportCnt != 0) {
			Report_tblVO vo = dao.re_submit(map);
			
			model.addAttribute("vo",vo);
			
			//과제 제출를 위한 과제 코드
			int reportcode = vo.getReportcode();
			
			//과제 제출 완료한 인원 수 
			int codeCnt = dao.codeCnt(reportcode);
			
			
			model.addAttribute("submitCnt",codeCnt);
			//과제 미제출
			int notCnt = personCnt - codeCnt;
			
			model.addAttribute("notCnt",notCnt);
			
			//제출 학생 불러오기
			List<Submission_ListVO> dtos = dao.submissionlist(reportcode);
			
			
			model.addAttribute("dtos",dtos);
			
		}
		
		model.addAttribute("cnt",personCnt);
	
		System.out.println("personCnt" + personCnt);
	}
	
	//과제 상세 페이지
	@Override
	public void re_contentform(Map<String, Object> map, HttpServletRequest req, Model model) {
		System.out.println("select23123213" + map.get("select"));
		
		System.out.println("서브젝트:" +  map.get("subject"));
		List<Report_tblVO> task = dao.task_lookup(map);
		
		model.addAttribute("task", task);
	
	}
	
	//과제 상세 페이지
		@Override
		public void report_contentform(Map<String, Object> map, HttpServletRequest req, Model model) {
			
			int personCnt = dao.personnel(map);
			
			model.addAttribute("cnt",personCnt);
			
			//과제 있는지 여부
			int reportCnt = dao.p_report(map);
			
			model.addAttribute("reportCnt",reportCnt);
			if(reportCnt != 0) {
				int reportcode = Integer.parseInt((String) map.get("reportcode"));
				System.out.println("reportcode:::::"+reportcode);
				
				int codeCnt = dao.codeCnt(reportcode);
				System.out.println("codeCnt ::::" + codeCnt);
				
				model.addAttribute("submitCnt",codeCnt);
				int notCnt = personCnt - codeCnt;
				
				model.addAttribute("notCnt",notCnt);
				
				//제출 학생 불러오기
				List<Submission_ListVO> dtos = dao.submissionlist(reportcode);
				
				model.addAttribute("dtos",dtos);
			}
		}
	//과제 추가
	@Override
	public void re_insert(HttpServletRequest req, RedirectAttributes red) { 
		String leccode = req.getParameter("leccode");
		String reportname = req.getParameter("reportname");
		String content = req.getParameter("content");
		String enddate = req.getParameter("enddate");
		
		System.out.println(leccode);
		System.out.println(reportname);
		System.out.println(content);
		System.out.println(enddate);
		
		Report_tblVO vo = new Report_tblVO();

		vo.setEndDate(enddate);
		vo.setLecCode(leccode);
		vo.setReportInfo(content);
		vo.setReportName(reportname);
		
		int insertCnt = dao.re_contentform(vo);
		
		if(insertCnt != 0) {
			red.addFlashAttribute("message", "과제를 추가 하였습니다.");
			red.addFlashAttribute("alertIcon","success");
		}
		
	}
	
	//과제 수정
		@Override
		public void reportupdate(HttpServletRequest req, RedirectAttributes red) { 
			int reportcode = Integer.parseInt(req.getParameter("reportcode"));
			String reportname = req.getParameter("reportname");
			String content = req.getParameter("content");
			String enddate = req.getParameter("enddate");
			
			
			Report_tblVO vo = new Report_tblVO();

			vo.setEndDate(enddate);
			vo.setReportcode(reportcode);
			vo.setReportInfo(content);
			vo.setReportName(reportname);
			
			int updateCnt = dao.p_reportupdate(vo);
			System.out.println("updateCnt::::"+updateCnt);
			
			if(updateCnt != 0) {
				red.addFlashAttribute("message", "수정을 완료 했습니다.");
				red.addFlashAttribute("alertIcon","success");
			}
			
		}
		@Override
		public void reportdelete(HttpServletRequest req, RedirectAttributes red) {
			int reportcode = Integer.parseInt(req.getParameter("reportcode"));
			
			System.out.println("1111"+reportcode);
			
			int deleteCnt = dao.p_reportdelete(reportcode);
			
			if(deleteCnt != 0) {
				red.addFlashAttribute("message", "삭제를 성공 했습니다");
				red.addFlashAttribute("alertIcon","success");
			}
			
		}

}
