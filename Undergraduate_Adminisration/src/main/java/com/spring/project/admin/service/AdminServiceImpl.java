package com.spring.project.admin.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.Board.Board;
import com.spring.project.Board.BoardInterface;
import com.spring.project.admin.dao.AdminDAO;
import com.spring.project.admin.vo.AdProVO;
import com.spring.project.admin.vo.AdStdVO;
import com.spring.project.admin.vo.ScholarpkVO;
import com.spring.project.admin.vo.auditVO;
import com.spring.project.admin.vo.lecMVO;
import com.spring.project.admin.vo.payrollVO;
import com.spring.project.share.Config;
import com.spring.project.share.dao.ShareDAO;
import com.spring.project.share.vo.Major;
import com.spring.project.student.vo.LectureVO;

@Service
public class AdminServiceImpl extends Board implements AdminService {

	@Autowired
	AdminDAO dao;
	@Autowired
	ShareDAO shareDao;

	/* 장학 단 */
	// 장학 글 목록
	@Override
	public void registrationList(Map<String, Object> map, Model model) {
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
		cnt = dao.Jang_getArticleCnt(map);
		System.out.println("cnt" + cnt);
		System.out.println("pageNum" + pageNum);

		pageCount = cnt / pageSize + (cnt % pageSize > 0 ? 1 : 0);

		start = (pageNum - 1) * pageSize + 1;
		end = start + pageSize - 1;

		map.put("start", start);
		map.put("end", end);
		System.out.println(map.get("year"));
		System.out.println(map.get("smester"));

		if (map.get("year") != "0") {
			map.put("year", map.get("year"));
			map.put("smester", map.get("smester"));
		}

		if (end > cnt)
			end = cnt;

		number = cnt - (pageNum - 1) * pageSize;

		if (cnt > 0) {
			// 수강신청 목록 조회
			List<ScholarpkVO> dtos = dao.jang_getArticleList(map);

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
		// 3단계.화면으로부터 입력받은값을 받아온다.
		// 페이징
		/*
		 * int pageSize =5; //한페이지당 출력할 글 갯수 int pageBlock = 3; //한블럭당 페이지 갯수
		 * 
		 * int cnt = 0 ; //글갯수 int start =0; //현재 페이지 시작 글번호 int end= 0; //현재페이지 마지막 글번호
		 * int number = 0; //출력용 글번호 String pageNum = ""; //페이지번호 int currentPage = 0;
		 * //현재페이지
		 * 
		 * int pageCount = 0; //페이지 갯수 int startPage = 0; //시작 페이지 int endPage = 0;//마지막
		 * 페이지
		 */

		/*
		 * //5단계.글의갯수 구하기 cnt = dao.getArticleCnt();
		 * 
		 * //6단계 req.setAttribute("selectCnt", cnt); System.out.println(cnt);//먼저 30건출력
		 * 
		 * pageNum =req.getParameter("pageNum");
		 * 
		 * if(pageNum == null) { pageNum="1";//첫페이지를 1페이지로 지정 }
		 * 
		 * //글30건 기준 currentPage = Integer.parseInt(pageNum);//현재페이지 :1
		 * System.out.println("currentPage : "+currentPage);
		 * 
		 * //페이지 갯수 6 =(30/5)+0 pageCount=(cnt/pageSize) + (cnt%pageSize >0 ? 1:0);//페이지
		 * 갯수 + 나머지있으면1
		 * 
		 * //현재 페이지 시작 글번호(페이지별) //1 =(1-1)*5+1 start =(currentPage - 1)* pageSize +1;
		 * 
		 * //현재 페이지 마지막 글번호(페이지별) //5 = 1 + 5 -1; end = start + pageSize -1;
		 * 
		 * System.out.println("start : " +start); System.out.println("end : " +end);
		 * 
		 * if(end>cnt) end =cnt;
		 * 
		 * //출력형 글번호 //30 = 30- (1-1) *5 number = cnt - (currentPage - 1) *
		 * pageSize;//출력용 글번호
		 * 
		 * System.out.println("number : " +number); System.out.println("pageSize : "
		 * +pageSize);
		 * 
		 * if(cnt>0) { //5-2게시글 목록 조회
		 * 
		 * Map<String,Object> map = new HashMap<String,Object>(); map.put("start",
		 * start); map.put("end", end); List<ScholarpkVO> dtos=dao.getArticleList(map);
		 * 
		 * //jsp로 넘겨라 model.addAttribute("dtos", dtos);//큰바구니 : 게시글 목록 cf) 작은바구니 : 게시글
		 * 1건 }
		 * 
		 * //6단계 request나 session 에 처리 결과를 저장 (jsp에 전달하기 위함)
		 * 
		 * //시작페이지 // 1 = (1 / 3) *3+1; startPage = (currentPage / pageBlock) *
		 * pageBlock + 1; if(currentPage % pageBlock == 0) startPage -= pageBlock;
		 * System.out.println("startPage : " + startPage);
		 * 
		 * //마지막페이지 //3 = 1+3-1 endPage = startPage + pageBlock -1; if(endPage >
		 * pageCount) endPage =pageCount; System.out.println("endPage : " + endPage);
		 * System.out.println("==================");
		 * 
		 * model.addAttribute("cnt", cnt); // 글갯수 model.addAttribute("number", number);
		 * model.addAttribute("pageNum", pageNum);
		 * 
		 * if(cnt>0) { model.addAttribute("startPage", startPage);//시작페이지
		 * model.addAttribute("endPage", endPage);//마지막페이지
		 * model.addAttribute("pageBlock", pageBlock);//출력할 페이지 갯수
		 * model.addAttribute("pageCount", pageCount);//페이지갯수
		 * model.addAttribute("currentPage", currentPage);//현재페이지 }
		 */
	}

	// 글처리 완료
	@Override
	public void rigisterPro(HttpServletRequest req, Model model) {
		String semester = req.getParameter("semester");
		String year = req.getParameter("year");
		String amount = req.getParameter("amount");
		String scholarname = req.getParameter("scholarname");
		String scholarContent = req.getParameter("scholarContent");

		ScholarpkVO vo = new ScholarpkVO();
		vo.setSemester(semester);
		vo.setYear(year);
		vo.setAmount(amount);
		vo.setScholarname(scholarname);
		vo.setScholarcontent(scholarContent);

		int insertjangjag = dao.insertjangjag(vo);
		System.out.println(insertjangjag);

		// 6단계 request나 session 에 처리 결과를 저장 (jsp에 전달하기 위함)
		model.addAttribute("insertjangjag", insertjangjag);
		/*
		 * model.addAttribute("num", num); model.addAttribute("pageNum", pageNum);
		 */

	}

	@Override
	public void contentform(HttpServletRequest req, Model model) {
		int scholarpk = Integer.parseInt(req.getParameter("scholarpk"));// sql용

		// 5-2 상세페이지
		ScholarpkVO dto = dao.content_getArticle(scholarpk);

		// 6단계 request나 session 에 처리 결과를 저장 (jsp에 전달하기 위함)
		model.addAttribute("dto", dto);

	}

	@Override
	public void deletePro(HttpServletRequest req, RedirectAttributes red) {
		String[] checkbox = req.getParameterValues("scholarpks");

		System.out.println("checkbox" + checkbox);

		int updateCnt = dao.jang_delete(checkbox);
		System.out.println("22222");

		if (updateCnt != 0) {
			red.addFlashAttribute("message", "삭제에 성공 했습니다!");
		} else {
			red.addFlashAttribute("message", "삭제에 실패 했습니다!");

		}

	}

	// 학생등록 처리
	@Override
	public void stdInputPro(MultipartHttpServletRequest req, RedirectAttributes red) {
		// MultipartRequest 타입의 변수 선언
		MultipartFile file = req.getFile("userImage");

		// 업로드할 파일의 최대 사이즈 (10*1024*1024 = 10mb)
		/* int maxSize = 10 * 1024 * 1024; */

		// 임시 파일이 저장되는 논리적인 경로
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/images/");

		// 업로드할 파일이 위치하게 될 물리적인 경로
		String realDir = Config.REAL_PATH;

		// 인코딩 타입 : 한글 파일명이 열화되는것을 방지
		/* String encType= "UTF-8"; */

		try {
			/*
			 * *DefaultFileRenamePolicy()객체는 중복된 파일명이 있을 경우, 자동으로 파일명을 변경함 (예 :
			 * filename.png가 이미 존재할 경우, filename1.png와 같이)
			 */
			file.transferTo(new File(saveDir + file.getOriginalFilename()));

			if (file.getOriginalFilename() != "") {
				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
				int data = 0;

				// 논리적인 경로에 저장된 임시 파일을 물리적인 경로로 복사함
				while ((data = fis.read()) != -1) {
					fos.write(data);
				}
				fis.close();
				fos.close();
			}

			/*
			 * *위에서 MultipartRequest()객체를 선언해서 받는 모든 request 객체들은 MultipartRequest 타입으로
			 * 참조되어야 함 (예 : request.getParameter 에서 mr.getParameter)
			 */
			String image = file.getOriginalFilename();
			String img = "";
			img = "/images/" + image;

			AdStdVO vo = new AdStdVO();

			// users
			vo.setUserNumber(req.getParameter("userNumber"));
			vo.setUserImage(img);
			vo.setUserName(req.getParameter("userName"));
			vo.setUserEngName(req.getParameter("userEngName"));
			vo.setUserSsn(req.getParameter("userSsn"));
			vo.setGender(req.getParameter("gender"));
			vo.setUserCellNum(req.getParameter("userCellNum"));
			vo.setUserEmail(req.getParameter("userEmail"));
			vo.setUserZipCode(req.getParameter("userZipCode"));
			vo.setUserAddr1(req.getParameter("userAddr1"));
			vo.setUserAddr2(req.getParameter("userAddr2"));
			vo.setGender(req.getParameter("gender"));
			/* vo.setDelStatus(Integer.parseInt(req.getParameter("delStatus"))); */

			// student
			/* vo.setStdNumber(req.getParameter("stdNumber")); */
			vo.setGrade(Integer.parseInt(req.getParameter("grade")));
			vo.setAdDate(Date.valueOf(req.getParameter("adDate")));
			vo.setGraDate(Date.valueOf(req.getParameter("graDate")));

			// studentState - 졸업여부는 0
			vo.setSemester(Integer.parseInt(req.getParameter("semester")));

			// major
			vo.setMajorNum(Integer.parseInt(req.getParameter("majorNum")));

			int userInsert = dao.insertUsers(vo);
			int stdInsert = dao.insertStudent(vo);
			int stdState = dao.insertStudentState(vo);

			int stdInsertResult = userInsert + stdInsert + stdState;

			if (stdInsertResult != 0)
				red.addFlashAttribute("message", "학생등록완료.");
			else
				red.addFlashAttribute("message", "학생등록에러.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 교수 인서트
	@Override
	public void ProInputPro(MultipartHttpServletRequest req, RedirectAttributes red) {
		// MultipartRequest 타입의 변수 선언
		MultipartFile file = req.getFile("userImage");

		// 업로드할 파일의 최대 사이즈 (10*1024*1024 = 10mb)
		/* int maxSize = 10 * 1024 * 1024; */

		// 임시 파일이 저장되는 논리적인 경로
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/images/");

		// 업로드할 파일이 위치하게 될 물리적인 경로
		String realDir = Config.REAL_PATH;

		// 인코딩 타입 : 한글 파일명이 열화되는것을 방지
		/* String encType= "UTF-8"; */

		try {
			/*
			 * *DefaultFileRenamePolicy()객체는 중복된 파일명이 있을 경우, 자동으로 파일명을 변경함 (예 :
			 * filename.png가 이미 존재할 경우, filename1.png와 같이)
			 */
			file.transferTo(new File(saveDir + file.getOriginalFilename()));

			if (file.getOriginalFilename() != "") {
				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
				int data = 0;

				// 논리적인 경로에 저장된 임시 파일을 물리적인 경로로 복사함
				while ((data = fis.read()) != -1) {
					fos.write(data);
				}
				fis.close();
				fos.close();
			}

			/*
			 * *위에서 MultipartRequest()객체를 선언해서 받는 모든 request 객체들은 MultipartRequest 타입으로
			 * 참조되어야 함 (예 : request.getParameter 에서 mr.getParameter)
			 */
			String image = file.getOriginalFilename();
			String img = "";
			img = "/images/" + image;

			AdProVO vo = new AdProVO();

			// users
			vo.setUserNumber(req.getParameter("userNumber"));
			vo.setUserImage(img);
			vo.setUserName(req.getParameter("userName"));
			vo.setUserEngName(req.getParameter("userEngName"));
			vo.setUserSsn(req.getParameter("userSsn"));
			vo.setGender(req.getParameter("gender"));
			vo.setUserCellNum(req.getParameter("userCellNum"));
			vo.setUserEmail(req.getParameter("userEmail"));
			vo.setUserZipCode(req.getParameter("userZipCode"));
			vo.setUserAddr1(req.getParameter("userAddr1"));
			vo.setUserAddr2(req.getParameter("userAddr2"));
			vo.setGender(req.getParameter("gender"));
			/* vo.setDelStatus(Integer.parseInt(req.getParameter("delStatus"))); */

			// major
			vo.setMajorNum(Integer.parseInt(req.getParameter("majorNum")));

			// employees
			vo.setEmpHiredDate(Date.valueOf(req.getParameter("empHiredDate")));
			// vo.setAnnualLevel(Integer.parseInt(req.getParameter("annualLevel")));
			vo.setBankName(req.getParameter("bankName"));
			vo.setAccountHolder(req.getParameter("accountHolder"));
			vo.setAccountNumber(req.getParameter("accountNumber"));
			
			int userInsert = dao.insertPUsers(vo); 
			int empInsert = dao.insertEmployees(vo); 
			int insertProcedure = dao.insertProcedure(vo);
			
			int proInsertResult = userInsert+ empInsert+insertProcedure;
			
			 if (proInsertResult != 0) 

				red.addFlashAttribute("message", "교수등록완료.");
			else
				red.addFlashAttribute("message", "교수등록에러.");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 학생*교수 리스트
	@Override
	public void stdList(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		// 페이징 처리
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호

		// 5-2. 게시글 목록 조회 - 큰바구니 생성
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);

		// 학생리스트
		List<AdStdVO> dtos = dao.getStdList(map);
		req.setAttribute("dtos", dtos); // 큰바구니 : 게시글 목록 cf)작은 바구니(vo)는 게시글 1건

		// 교수 리스트
		List<AdProVO> vo = dao.getProList(map);
		req.setAttribute("vo", vo);
	}

	// 학부 + 학과 리스트
	@Override
	public void fandMList(HttpServletRequest req, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<AdProVO> vo = dao.FandMList(map);
		req.setAttribute("outFandM", vo);
	}

	// 학생 상세페이지
	@Override
	public void showStdDetail(Map<String, Object> map, HttpServletRequest req, Model model) {
		String userNumber = req.getParameter("userNumber");

		Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("userNumber", userNumber);
		
		List<AdProVO> voList = dao.FandMList(map1);
		List<AdStdVO> lecList = dao.stdLectureList(map1);
		
		req.setAttribute("outFandM", voList);
		req.setAttribute("lecList", lecList);
		
		AdStdVO vo = dao.stdDetail(userNumber);
		req.setAttribute("vo", vo);
	}

	// 교수 상세
	@Override
	public void showProDetail(HttpServletRequest req, Model model) {
		String userNumber =req.getParameter("userNumber");

		Map<String, Object> map = new HashMap<String, Object>();
			map.put("userNumber", userNumber);
			
		List<AdProVO> voList = dao.FandMList(map);
		List<AdProVO> lecList = dao.proLectureList(map);
		
		req.setAttribute("outFandM", voList);
		req.setAttribute("lecList", lecList);
		

		AdProVO vo = dao.proDetail(userNumber);
		req.setAttribute("vo", vo);
	}

	// 학생정보수정
	@Override
	public void stdDetailUpdate(HttpServletRequest req, RedirectAttributes model) {

		AdStdVO vo = new AdStdVO();

		// users
		vo.setUserNumber(req.getParameter("userNumber"));
		vo.setUserName(req.getParameter("userName"));
		vo.setUserEngName(req.getParameter("userEngName"));
		vo.setUserSsn(req.getParameter("userSsn"));
		vo.setGender(req.getParameter("gender"));
		vo.setUserCellNum(req.getParameter("userCellNum"));
		vo.setUserEmail(req.getParameter("userEmail"));
		vo.setUserZipCode(req.getParameter("userZipCode"));
		vo.setUserAddr1(req.getParameter("userAddr1"));
		vo.setUserAddr2(req.getParameter("userAddr2"));
		vo.setGender(req.getParameter("gender"));
		/* vo.setDelStatus(Integer.parseInt(req.getParameter("delStatus"))); */

		// student
		/* vo.setStdNumber(req.getParameter("stdNumber")); */
		vo.setGrade(Integer.parseInt(req.getParameter("grade")));
		vo.setGraDate(Date.valueOf(req.getParameter("graDate")));

		// studentState
		vo.setSemester(Integer.parseInt(req.getParameter("semester")));
		vo.setGraduation_state(Integer.parseInt(req.getParameter("graduation_state")));

		// major
		vo.setMajorNum(Integer.parseInt(req.getParameter("majorNum")));

		int userUp = dao.updateUsers(vo);
		int stdUp = dao.updateStudent(vo);
		int stdStateUp = dao.updateStudentState(vo);

		int stdUpResult = userUp + stdUp + stdStateUp;

		model.addAttribute("userNumber", req.getParameter("userNumber"));

		if(stdUpResult == 3) {
			model.addFlashAttribute("message", "수정 완료");
		}else{
			model.addFlashAttribute("message", "Error!! 수정 실패! stdUpResult:"+stdUpResult);
		}
	}

	// 교수정보수정
	@Override
	public void proDetailUpdate(HttpServletRequest req, RedirectAttributes model) {

		AdProVO vo = new AdProVO();

		// users
		vo.setUserNumber(req.getParameter("userNumber"));
		vo.setUserName(req.getParameter("userName"));
		vo.setUserEngName(req.getParameter("userEngName"));
		vo.setUserSsn(req.getParameter("userSsn"));
		vo.setGender(req.getParameter("gender"));
		vo.setUserCellNum(req.getParameter("userCellNum"));
		vo.setUserEmail(req.getParameter("userEmail"));
		vo.setUserZipCode(req.getParameter("userZipCode"));
		vo.setUserAddr1(req.getParameter("userAddr1"));
		vo.setUserAddr2(req.getParameter("userAddr2"));
		vo.setGender(req.getParameter("gender"));
		/*vo.setDelStatus(Integer.parseInt(req.getParameter("delStatus")));*/

		//major
		vo.setMajorNum(Integer.parseInt(req.getParameter("majorNum")));

		// employees
		vo.setEmpHiredDate(Date.valueOf(req.getParameter("empHiredDate")));
		vo.setAnnualLevel(Integer.parseInt(req.getParameter("annualLevel")));
		vo.setBankName(req.getParameter("bankName"));
		vo.setAccountHolder(req.getParameter("accountHolder"));
		vo.setEmpHiredDate(Date.valueOf(req.getParameter("empHiredDate")));
		vo.setAccountNumber(req.getParameter("accountNumber"));

		int userUp = dao.updatePUsers(vo); 
		int empUp = dao.updateEmployees(vo); 

		int proUpResult = userUp+ empUp ;

		model.addAttribute("userNumber", req.getParameter("userNumber"));

		if(proUpResult == 2) {
			model.addFlashAttribute("message", "수정 완료");
		}else{
			model.addFlashAttribute("message", "Error!! 수정 실패! proUpResult:"+proUpResult);
		}
	}

	// 회원 이미지수정
	@Override
	public void stdImgUpdate(MultipartHttpServletRequest req, RedirectAttributes red) {
		MultipartFile file = req.getFile("userImage");

		String saveDir = req.getSession().getServletContext().getRealPath("/resources/images/");
		String realDir = Config.REAL_PATH;
		// 경로
		// 각자의 이미지 저장경로 수정하셈
		try {
			file.transferTo(new File(saveDir + file.getOriginalFilename()));

			if (file.getOriginalFilename() != "") {
				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

				int data = 0;

				while ((data = fis.read()) != -1) {
					fos.write(data);
				}
				fis.close();
				fos.close();
			}
			String userNumber = req.getParameter("userNumber");

			AdStdVO stdVO = new AdStdVO();
			stdVO.setUserNumber(userNumber);

			String ori_image = req.getParameter("userImage");
			String update_image = file.getOriginalFilename();
			String img = "";

			if(update_image.equals("")) {
				img = "/images/"+ori_image;
			}else {
				img = "/images/"+update_image;
			}

			stdVO.setUserImage(img);

			int stdImageUpload = dao.stdImgUpdate(stdVO);

			red.addAttribute("userNumber", userNumber);
			
			if (stdImageUpload == 1) {
				red.addFlashAttribute("message", "프로필 이미지를 변경하였습니다.");
			}else {
				red.addFlashAttribute("message", "프로필 이미지를 변경하는 도중에 오류가 발생하였습니다.");
			}
			System.out.println("프로필 이미지 변경 imageUpload : " + stdImageUpload);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//교수 이미지 수정
	@Override
	public void proImgUpdate(MultipartHttpServletRequest req, RedirectAttributes red) {
		MultipartFile file = req.getFile("userImage");

		String saveDir = req.getSession().getServletContext().getRealPath("/resources/images");
		String realDir = Config.REAL_PATH;
		// 경로
		// 각자의 이미지 저장경로 수정하셈
		try {
			file.transferTo(new File(saveDir + file.getOriginalFilename()));

			if(file.getOriginalFilename() != "")  {
				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());

				int data = 0;

				while ((data = fis.read()) != -1) {
					fos.write(data);
				}
				fis.close();
				fos.close();
			}
			String userNumber = req.getParameter("userNumber");

			AdProVO proVO = new AdProVO();
			proVO.setUserNumber(userNumber);
			
			String ori_image = req.getParameter("userImage");
			String update_image = file.getOriginalFilename();
			String img = "";

			if(update_image.equals("")) {
				img = "/images/"+ori_image;
			}else {
				img ="/images/"+ update_image;
			}
			
			proVO.setUserImage(img);

			int proImageUpload = dao.proImgUpdate(proVO);
			
			//리다이렉트로 유저넘을 넘겨줌
			red.addAttribute("userNumber", userNumber);
			
			if (proImageUpload == 1) { proVO.setUserImage(img);
				red.addFlashAttribute("message", "프로필 이미지를 변경하였습니다.");
			}else { 
				red.addFlashAttribute("message", "프로필 이미지를 변경하는 도중에 오류가 발생하였습니다.");
			}
			System.out.println("프로필 이미지 변경 imageUpload : " + proImageUpload);
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 학생 + 교수삭제
	@Override
	public void stdDeletePro(HttpServletRequest req, RedirectAttributes red) {
		String userNum = req.getParameter("userNumber");

		int stdDelete = dao.stdDelete(userNum);
		if (stdDelete != 0)
			red.addFlashAttribute("message", "학생삭제완료.");
		else
			red.addFlashAttribute("message", "학생삭제에러");
	}

	// 휴복학 리스트
	@Override
	public void schoolLeaveList(HttpServletRequest req, Model model) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<AdStdVO> vo = dao.getSchoolLeave(map);
		req.setAttribute("getSL", vo);
	}

	// 전화번호부 가져오기
	@Override
	public List<String> getUserCellNumList(Map<String, Object> map){
		return dao.getUserCellNumList(map);
	}

	// 장학 심사
	@Override
	public void judge(HttpServletRequest req, Model model) {

		// 심사 리스트에 담기
		List<auditVO> audit = dao.auditCnt();

		// 심사리스트 반환
		model.addAttribute("audit", audit);
	}

	// 장학 심사 완료
	@Override
	public void auditPro(HttpServletRequest req, Model model) {
		String[] checkbox = req.getParameterValues("chk");
		String[] checkbox2 = req.getParameterValues("chk2");

		if (checkbox != null) {
			int updateCnt = dao.auditupdate(checkbox);
		}
		if (checkbox2 != null) {
			int updateCnt = dao.auditupdate2(checkbox2);
			System.out.println("5555555");
		}
		System.out.println("22222");

	}

	// -----------------------------------------------------------------교직업무관리START-------------------------------------------------
	@Override
	public void getMajors(Map<String, Object> map, Model model) {
		setList(map, model, new BoardInterface() {

			@Override
			public int getListCount(Map<String, Object> map) {
				return dao.majorListCount(map);
			}

			@Override
			public List<Object> getList(Map<String, Object> map) {
				return dao.majorList(map);
			}

		});
	}

	// 학과 삭제
	@Override
	public Map<String, Object> deleteMajor(LectureVO lecture) {
		Map<String, Object> resopnseData = new HashMap<String, Object>();
		dao.deleteMajor(lecture);
		
		System.out.println("result : "+lecture.getResult());
		if (lecture.getResult() > 0)
			resopnseData.put("status", "success");
		else
			resopnseData.put("status", "fail");
		return resopnseData;
	}

	// 학과 등록
	@Override
	public Map<String, Object> addMajor(Major major) {
		Map<String, Object> resultmap = new HashMap<String, Object>();

		resultmap.put("status", dao.addMajor(major));

		return resultmap;
	}

	// 학과 수정
	@Override
	public Map<String, Object> modifyMajor(Major major) {
		Map<String, Object> resultmap = new HashMap<String, Object>();

		resultmap.put("status", dao.modifyMajor(major));

		return resultmap;
	}

	// 교수의 빈강의시간 조회
	@Override
	public void getEmptyLecTime(String empNumber, String semester, Model model) {
		List<Object> days = new ArrayList<Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNumber", empNumber);
		map.put("semester", semester);
		List<Object> list = dao.emptyLecTime(map);
		List<Object> lectures = dao.getLecturesTimes(map);
		Map<String, Integer> colorMap = new HashMap<String, Integer>();
		
		int idx = 1;
		for(Object obj: lectures) {
			LectureVO data = ((LectureVO)obj);
			if(!colorMap.containsKey(data.getLectureName())) {
				if(idx==6)
					idx+=1;
				colorMap.put(data.getLectureName(), idx++);
			}
		}
		
		days.add("월");
		days.add("화");
		days.add("수");
		days.add("목");
		days.add("금");
		model.addAttribute("colorMap", colorMap);
		model.addAttribute("lectures", lectures);
		model.addAttribute("days", days);
		model.addAttribute("dtos", list);
		model.addAttribute("mode", "selector");
		model.addAttribute("semester", semester);
		model.addAttribute("empNumber", empNumber);
	}

	@Override
	public void getLectureTime(String lecCode, Model model) {
		List<Object> days = new ArrayList<Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lecCode", lecCode);
		List<Object> lectures = dao.getLecturesTimes(map);
		days.add("월");
		days.add("화");
		days.add("수");
		days.add("목");
		days.add("금");
		model.addAttribute("lectures", lectures);
		model.addAttribute("days", days);
		model.addAttribute("mode", "view");
		model.addAttribute("semester", ((LectureVO)lectures.get(1)).getGrantedSemester());
		model.addAttribute("empNumber", ((LectureVO)lectures.get(1)).getEmpNumber());
	}
	@Override
	public Map<String, Object> getLectureSeqNextval() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNextVal", dao.getLectureSeqNextval());
		return map;
	}

	// 강의 리스트 조회
	@Override
	public void getLectureList(Map<String, Object> map, Model model) {
		setList(map, model, new BoardInterface() {
			@Override
			public int getListCount(Map<String, Object> map) {
				return dao.getLectureCount(map);
			}

			@Override
			public List<Object> getList(Map<String, Object> map) {
				return dao.getLectureList(map);
			}
		});
	}

	@Override
	public void getProfessorList(Map<String, Object> map, Model model) {
		setList(map, model, new BoardInterface() {
			@Override
			public int getListCount(Map<String, Object> map) {
				return dao.getProfessorCount(map);
			}

			@Override
			public List<Object> getList(Map<String, Object> map) {
				return dao.getProfessorList(map);
			}
		});

	}

	@Override
	public Map<String, Object> addLecture(LectureVO lecture) {
		Map<String, Object> responseData = new HashMap<String, Object>();
		lecture.setTtc(lecture.getTimetblCodes().stream().mapToInt(i -> i).toArray());
		dao.addLecture(lecture);

		if (lecture.getResult() == 0) {
			responseData.put("message", "Error!! 강의 추가 실패! 'lecture TABLE INSERT FAILE!'");
			responseData.put("status", "error");
		} else if ((lecture.getTimetblCodes().size() + 1) == lecture.getResult()) {
			responseData.put("message", "강의 추가 완료");
			responseData.put("status", "success");
		} else {
			responseData.put("message", "Error!! 강의 추가 실패! 'lectureTime TABLE INSERT FAILE!'");
			responseData.put("status", "error");
		}
		return responseData;
	}

	@Override
	public LectureVO getLecture(Map<String, Object> map) {
		return dao.getLecture(map);
	}

	@Override
	public Map<String, Object> modifyLecture(LectureVO lecture) {
		Map<String, Object> responseData = new HashMap<String, Object>();
		lecture.setTtc(lecture.getTimetblCodes().stream().mapToInt(i -> i).toArray());
		dao.modifyLecture(lecture);
		
		System.out.println("result : "+lecture.getResult());
		if (lecture.getResult() != 0) {
			responseData.put("message", "강의 수정 완료.");
			responseData.put("status", "success");
		}else {
			responseData.put("message", "Error!! 강의 수정 실패! 'lectureTime TABLE INSERT FAILE!'");
			responseData.put("status", "error");
		}
		return responseData;
	}
	
	@Override
	public Map<String, Object> deleteLecture(Map<String, Object> map) {
		Map<String, Object> responseData = new HashMap<String, Object>();
		if(dao.deleteLecture(map)==1) {
			responseData.put("message", "강의 삭제 완료.");
			responseData.put("status", "success");
		}else {
			responseData.put("message", "Error!! 강의 삭제 실패!");
			responseData.put("status", "error");
		}
		return responseData;
	}
	
	// -------------------------------------------------------교직업무관리END-------------------------------------------------
	

	@Override
	public void judge2(Map<String, Object> map, Logger logger, Model model) {
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
		cnt = dao.audit_getArticleCnt(map);
		System.out.println("pageNum"+pageNum);


		pageCount = cnt / pageSize + (cnt % pageSize > 0 ? 1 : 0);

		start = (pageNum - 1) * pageSize + 1;
		end = start + pageSize - 1;

		map.put("start", start);
		map.put("end", end);
		System.out.println(map.get("year"));
		System.out.println(map.get("smester"));
		
		if(map.get("year") != "0") {
		map.put("year", map.get("year"));
		map.put("smester", map.get("smester"));
		}
		
		if (end > cnt)
			end = cnt;

		number = cnt - (pageNum - 1) * pageSize;

		
		if (cnt > 0) {
			// 수강신청 목록 조회
			int auditct = Integer.parseInt((String)map.get("audit"));
			
			List<auditVO> audit;
			//심사 리스트
			if(auditct == 3) {
			audit = dao.auditCnt();
			}else{
			audit = dao.auditCnt2(auditct);
			}
			
			//심사리스트 반환
			model.addAttribute("audit", audit);
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

	// 교직원 급여관리
	@Override
	public void facultyAccountManage(Model model) {
		List<payrollVO> dtos = dao.payrollList();
		model.addAttribute("dtos", dtos);

		List<payrollVO> dtosF = dao.getFacultyList();
		model.addAttribute("dtosF", dtosF);

		List<payrollVO> dtosM = dao.getFacultyMajor();
		model.addAttribute("dtosM", dtosM);

		List<payrollVO> dtosC = dao.getPaymentClassfication();
		model.addAttribute("dtosC", dtosC);

		List<payrollVO> dtosT = dao.getFinalPayrollList();
		model.addAttribute("dtosT", dtosT);
	}
	
	
	// 급여대장 조회
	@Override
	public void lookupWorkRecord(Map<String, Object> map, Model model) {
		List<payrollVO> dtos = dao.lookupWorkRecord(map);
		model.addAttribute("dtos", dtos);
	}

	@Override
	public void facultyMajorConfirmation(Map<String, Object> map, Model model) {
		List<payrollVO> dtos = dao.accountFacultyList(map);
		model.addAttribute("dtos", dtos);
	}

	@Override
	public Map<String, Object> insertPayroll(Map<String, Object> map) {
		/*payrollVO vo = new payrollVO();
		vo.setImputedYear((String)map.get("imputedYear") + (String)map.get("imputedMonth"));
		vo.setPaymentClassfication((String)map.get("paymentClassfication"));
		vo.setBeginningPeriod((Date)map.get("beginningPeriod"));
		vo.setEndPeriod((Date)map.get("endPeriod"));
		vo.setPaymentDate((Date)map.get("paymentDate"));
		vo.setPaymentYear((String)map.get("paymentYear") + (String)map.get("paymentMonth"));
		vo.setRegisterName((String)map.get("registerName"));*/

		/*System.out.println("imputedYear : " + map.get("imputedYear") + map.get("imputedMonth"));
		System.out.println("paymentClassfication :" + map.get("paymentClassfication"));
		System.out.println("beginningPeriod :" + (map.get("beginningPeriod")));
		System.out.println("endPeriod :" + (map.get("paymentDate")));
		System.out.println("paymentYear :" + map.get("paymentYear") + map.get("paymentMonth"));
		System.out.println("registerName :" + map.get("registerName"));*/

		int cnt = dao.insertPayroll(map);
		
		Map<String, Object> responseData = new HashMap<String,Object>();
		if (cnt == 1) {
			responseData.put("message", "등록이 완료되었습니다.");
		}
		return responseData;
	}
	@Override
	public Map<String, Object> ConfirmationWorkRecord(List<Map<String, Object>> data, Logger logger) {
		Map<String, Object> map = new HashMap<String, Object>();
		/*String[] overtime = (String[])map.get("overtime");
		String[] empNumber = (String[])map.get("empNumber");
		System.out.println("overtime : " + overtime);
		System.out.println("empNumber : " + empNumber);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for(int i=0; i<overtime.length; i++) {
			map.put("overtime", overtime[i]);
			map.put("empNumber", empNumber[i]);
			list.add(map);
		}*/
		Map<String, Object> responseData = new HashMap<String,Object>();
			
		int cnt1 = dao.ConfirmationWorkRecord(data);
		int cnt2 = dao.updateOverPay(data);
		int cnt = cnt1+ cnt2; 
			
			if(cnt != 0) {
				responseData.put("message","저장이 완료되었습니다");
			} else {
				responseData.put("message","저장실패");
			}
		return responseData;
	}
	@Override
	public Map<String, Object> SaveEnterAmountManually(List<Map<String, Object>> data, Logger logger) {
		
		int cnt = dao.SaveEnterAmountManually(data);
		//int cnt2 = dao.updateOverPay(list);
		//int cnt1 = cnt1+ cnt2; 
		Map<String, Object> responseData = new HashMap<String,Object>();
		if(cnt != 0) {
			responseData.put("message","저장이 완료되었습니다");
		} else {
			responseData.put("message","SaveEnterAmountManually() Error");
		}
		return responseData;
	}

	@Override
	public void ConfirmOvertime(Map<String, Object> map, Model model) {
		List<payrollVO> dtos = dao.ConfirmOvertime(map);
		model.addAttribute("dtosF", dtos);
	}

	@Override
	public void EnterAmountManually(Map<String, Object> map, Model model) {
		List<payrollVO> dtos = dao.ConfirmOvertime(map);
		model.addAttribute("dtosF", dtos);
	}

	@Override
	public void LookupWorkRecord(Map<String, Object> map, Model model) {
		List<payrollVO> dtos = dao.ConfirmOvertime(map);
		model.addAttribute("dtosF", dtos);
	}

	@Override
	public Map<String, Object> CopyPayroll(Map<String, Object> map) {
		List<payrollVO> empNumber = dao.getEmpNumber();
		int cnt1 = dao.CopyAllEmployeesDetail(empNumber);
		
		// mapper 없음
		int cnt2 = dao.CopyPayroll(map);
		int cnt= cnt1 + cnt2;
		Map<String, Object> responseData = new HashMap<String,Object>();
		if(cnt != 0) {
			responseData.put("message","저장이 완료되었습니다");
		} else {
			responseData.put("message","CopyPayroll() Error");
		}
		return responseData;
	}

	
	
	//---------------학사관리 START-------------------
	@Override
	public void lecM(HttpServletRequest req, Model model) {
		
		List<lecMVO> vo = dao.lecM();
	
		model.addAttribute("vo", vo);
		
	}
	
	@Override
	public Map<String, Object> delete_sc(lecMVO vo) {
		
		Map<String, Object> resultmap = new HashMap<String, Object>();
		dao.delete_sc(vo);
		return resultmap;
	}
	//---------------학사관리 END-------------------

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
