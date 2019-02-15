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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.admin.dao.AdminDAO;
import com.spring.project.admin.vo.AdProVO;
import com.spring.project.admin.vo.AdStdVO;
import com.spring.project.admin.vo.ScholarpkVO;
import com.spring.project.admin.vo.auditVO;
import com.spring.project.admin.vo.payrollVO;
import com.spring.project.professor.vo.myPageVO;
import com.spring.project.share.dao.ShareDAO;
import com.spring.project.share.vo.Major;
import com.spring.project.share.vo.ShareUserInfo;


@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDAO dao;
	@Autowired
	ShareDAO shareDao;
	
	/*장학 단*/
	//장학 글 목록
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
		cnt = dao.getArticleCnt(map);


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
		//3단계.화면으로부터 입력받은값을 받아온다.
		//페이징
		/*int pageSize =5; 		 //한페이지당 출력할 글 갯수
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
*/		
		
		/*//5단계.글의갯수 구하기
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
		}*/
	}
	//글처리 완료
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
		
		//6단계 request나 session 에 처리 결과를 저장 (jsp에 전달하기 위함)
		model.addAttribute("insertjangjag", insertjangjag);
		/*model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);*/
		
	}
	@Override
	public void contentform(HttpServletRequest req, Model model) {
		int scholarpk = Integer.parseInt(req.getParameter("scholarpk"));//sql용
		
		
		//5-2 상세페이지
		ScholarpkVO dto = dao.getArticle(scholarpk);
		 System.out.println();
		 
				
		//6단계 request나 session 에 처리 결과를 저장 (jsp에 전달하기 위함)
		model.addAttribute("dto", dto);
		
	}
	@Override
	public void deletePro(HttpServletRequest req, RedirectAttributes red) {
		String[] checkbox = req.getParameterValues("scholarpks");
		
		
		System.out.println("checkbox" + checkbox);
		
		int updateCnt =dao.delete(checkbox);
		System.out.println("22222");
		
	    if (updateCnt != 0) {
	    	red.addFlashAttribute("message","삭제에 성공 했습니다!");
	    }else {
	    	red.addFlashAttribute("message","삭제에 실패 했습니다!");
		    
		}
	    
	}
	
	//학생등록 처리
	@Override
	public void stdInputPro(MultipartHttpServletRequest req, RedirectAttributes red) {
		//MultipartRequest 타입의 변수 선언
		MultipartFile file = req.getFile("userImage");

		//업로드할 파일의 최대 사이즈 (10*1024*1024 = 10mb)
		/*int maxSize = 10 * 1024 * 1024;*/

		//임시 파일이 저장되는 논리적인 경로
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/images/");

		//업로드할 파일이 위치하게 될 물리적인 경로
		String realDir="C:\\Users\\guaba\\git\\Project_Garbage_Collector\\Undergraduate_Adminisration\\src\\main\\webapp\\resources\\images\\";

		//인코딩 타입 : 한글 파일명이 열화되는것을 방지
		/*String encType= "UTF-8";*/

		try {
			/* *DefaultFileRenamePolicy()객체는 중복된 파일명이 있을 경우, 자동으로 파일명을 변경함 
			 *(예 : filename.png가 이미 존재할 경우, filename1.png와 같이)*/
				file.transferTo(new File(saveDir+file.getOriginalFilename()));
		
				if(file.getOriginalFilename() != "")  {
				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
				int data =0;
		
				//논리적인 경로에 저장된 임시 파일을 물리적인 경로로 복사함
				while((data = fis.read())!= -1) {
					fos.write(data);
				}
				fis.close();
				fos.close();
			}

			/* *위에서 MultipartRequest()객체를 선언해서 받는 모든 request 객체들은
			 *MultipartRequest 타입으로 참조되어야 함
			 *(예 : request.getParameter 에서 mr.getParameter) */
			String image = file.getOriginalFilename();
			String img = "";
			img = "/images/" + image;
			
			AdStdVO vo = new AdStdVO();

			//users
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
			/*vo.setDelStatus(Integer.parseInt(req.getParameter("delStatus")));*/
			
			//student
			/*vo.setStdNumber(req.getParameter("stdNumber"));*/
			vo.setGrade(Integer.parseInt(req.getParameter("grade")));
			vo.setAdDate(Date.valueOf(req.getParameter("adDate")));
			vo.setGraDate(Date.valueOf(req.getParameter("graDate")));
			
			//studentState - 졸업여부는 0
			vo.setSemester(Integer.parseInt(req.getParameter("semester")));
			
			//major
			vo.setMajorNum(Integer.parseInt(req.getParameter("majorNum")));
			
			int userInsert = dao.insertUsers(vo); 
			int stdInsert = dao.insertStudent(vo); 
			int stdState = dao.insertStudentState(vo);
			
			int stdInsertResult = userInsert+ stdInsert+stdState ;

			Map<String, Integer> map = new HashMap<String, Integer>();
			List<AdProVO> voList = dao.FandMList(map);
			req.setAttribute("outFandM", voList);
			
			if (stdInsertResult != 0) 
				red.addFlashAttribute("message", "학생등록완료.");
			 else
				red.addFlashAttribute("message", "학생등록에러.");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//교수 인서트
	@Override
	public void ProInputPro(MultipartHttpServletRequest req,  RedirectAttributes red) {
		//MultipartRequest 타입의 변수 선언
		MultipartFile file = req.getFile("userImage");

		//업로드할 파일의 최대 사이즈 (10*1024*1024 = 10mb)
		/*int maxSize = 10 * 1024 * 1024;*/

		//임시 파일이 저장되는 논리적인 경로
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/images/");

		//업로드할 파일이 위치하게 될 물리적인 경로
		String realDir="C:\\Users\\guaba\\git\\Project_Garbage_Collector\\Undergraduate_Adminisration\\src\\main\\webapp\\resources\\images\\";

		//인코딩 타입 : 한글 파일명이 열화되는것을 방지
		/*String encType= "UTF-8";*/

		try {
			/* *DefaultFileRenamePolicy()객체는 중복된 파일명이 있을 경우, 자동으로 파일명을 변경함 
			 *(예 : filename.png가 이미 존재할 경우, filename1.png와 같이)*/
			file.transferTo(new File(saveDir+file.getOriginalFilename()));

		if(file.getOriginalFilename() != "")  {
			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
			int data =0;

			//논리적인 경로에 저장된 임시 파일을 물리적인 경로로 복사함
			while((data = fis.read())!= -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();
		}

			/* *위에서 MultipartRequest()객체를 선언해서 받는 모든 request 객체들은
			 *MultipartRequest 타입으로 참조되어야 함
			 *(예 : request.getParameter 에서 mr.getParameter) */
			String image = file.getOriginalFilename();
			String img = "";
			img = "/images/" + image;
			
			AdProVO vo = new AdProVO();

			//users
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
			/*vo.setDelStatus(Integer.parseInt(req.getParameter("delStatus")));*/
			
			//major
			vo.setMajorNum(Integer.parseInt(req.getParameter("majorNum")));
			
			//employees
			vo.setEmpHiredDate(Date.valueOf(req.getParameter("empHiredDate")));
			//vo.setAnnualLevel(Integer.parseInt(req.getParameter("annualLevel")));
			vo.setBankName(req.getParameter("bankName"));
			vo.setAccountHolder(req.getParameter("accountHolder"));
			vo.setAccountNumber(req.getParameter("accountNumber"));
			
			
			int userInsert = dao.insertPUsers(vo); 
			int empInsert = dao.insertEmployees(vo); 
			
			int proInsertResult = userInsert+ empInsert ;

			 if (proInsertResult != 0) 
				red.addFlashAttribute("message", "교수등록완료.");
			 else
				red.addFlashAttribute("message", "교수등록에러.");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//학생*교수 리스트
	@Override
	public void stdList(HttpServletRequest req, Model model) {
		//3단계. 화면으로부터 입력받은 값을 받아온다.
		//페이징 처리
		int start =0; 			// 현재 페이지 시작 글번호
		int end = 0; 			//현재 페이지 마지막 글번호
		
		//5-2. 게시글 목록 조회 - 큰바구니 생성
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		List<AdStdVO> dtos = dao.getStdList(map);
	
		req.setAttribute("dtos", dtos); //큰바구니 : 게시글 목록 cf)작은 바구니(vo)는 게시글 1건
		
		List<AdProVO> vo = dao.getProList(map);
		
		req.setAttribute("vo", vo);
	}
	
	//학부 + 학과 리스트
	@Override
	public void fandMList(HttpServletRequest req, Model model) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<AdProVO> vo = dao.FandMList(map);
		req.setAttribute("outFandM", vo);
	}
	
	//학생 상세페이지
	@Override
	public void showStdDetail(HttpServletRequest req, Model model) {
		String userNumber = req.getParameter("userNumber"); 
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		List<AdProVO> voList = dao.FandMList(map);

		req.setAttribute("outFandM", voList);

		AdStdVO vo = dao.stdDetail(userNumber);
		req.setAttribute("vo", vo);
	}
	
	//교수 상세
	@Override
	public void showProDetail(HttpServletRequest req, Model model) {
		String userNumber =req.getParameter("userNumber");
	
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<AdProVO> voList = dao.FandMList(map);
		req.setAttribute("outFandM", voList);
		
		AdProVO vo = dao.proDetail(userNumber);
		req.setAttribute("vo", vo);
	 }
	
	//학생정보수정
	@Override
	public void stdDetailUpdate(HttpServletRequest req, RedirectAttributes red) {
		AdStdVO vo = new AdStdVO();
		
		//users
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
		
		//student
		/*vo.setStdNumber(req.getParameter("stdNumber"));*/
		vo.setGrade(Integer.parseInt(req.getParameter("grade")));
		vo.setGraDate(Date.valueOf(req.getParameter("graDate")));
		
		//studentState 
		vo.setSemester(Integer.parseInt(req.getParameter("semester")));
		vo.setGraduation_state(Integer.parseInt(req.getParameter("graduation_state")));
		
		//major
		vo.setMajorNum(Integer.parseInt(req.getParameter("majorNum")));
		
		int userUp = dao.updateUsers(vo); 
		int stdUp = dao.updateStudent(vo); 
		int stdStateUp = dao.updateStudentState(vo);
		
		int stdUpdatetResult = userUp + stdUp + stdStateUp;

		  if (stdUpdatetResult == 3) 
			  red.addFlashAttribute("message", "학생정보수정완료.");
		  else
			  red.addFlashAttribute("message", "학생정보수정에러.");
		 
	}
	
	//교수정보수정
	@Override
	public void proDetailUpdate(HttpServletRequest req, RedirectAttributes red) {
		AdProVO vo = new AdProVO();

		//users
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
		
		//employees
		vo.setEmpHiredDate(Date.valueOf(req.getParameter("empHiredDate")));
		vo.setAnnualLevel(Integer.parseInt(req.getParameter("annualLevel")));
		vo.setBankName(req.getParameter("bankName"));
		vo.setAccountHolder(req.getParameter("accountHolder"));
		vo.setEmpHiredDate(Date.valueOf(req.getParameter("empHiredDate")));
		vo.setAccountNumber(req.getParameter("accountNumber"));
		
		int userUp = dao.updatePUsers(vo); 
		int empUp = dao.updateEmployees(vo); 
		
		int proUpResult = userUp+ empUp ;

		 if (proUpResult == 2) 
			red.addFlashAttribute("message", "교수정보수정완료.");
		 else
			red.addFlashAttribute("message", "교수정보수정실패.");
	}
	
	//회원 이미지수정
	@Override
	public void userImgUpdate(MultipartHttpServletRequest req, RedirectAttributes red) {
		MultipartFile file = req.getFile("userImage");

		String saveDir = req.getSession().getServletContext().getRealPath("/resources/images");
		String realDir = "C:\\Users\\guaba\\git\\Project_Garbage_Collector\\Undergraduate_Adminisration\\src\\main\\webapp\\resources\\images\\"; // 저장
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
			String image = file.getOriginalFilename();
			String userNum = req.getParameter("userNumber");

			AdProVO proVO = new AdProVO();
			AdStdVO stdVO = new AdStdVO();
			proVO.setUserNumber(userNum);
			stdVO.setUserNumber(userNum);

			String img = "";

			img = "/images/" + image;

			proVO.setUserImage(img);
			stdVO.setUserImage(img);
			
			
			//ShareUserInfo user = (ShareUserInfo) req.getParameter("")
			int proImageUpload = dao.proImgUpdate(proVO);
			
			if (proImageUpload == 1) {
				proVO.setUserImage(img);
				red.addFlashAttribute("message", "프로필 이미지를 변경하였습니다.");
				//req.getSession().setAttribute("user", user);
			}
			if (proImageUpload != 1)
				red.addFlashAttribute("message", "프로필 이미지를 변경하는 도중에 오류가 발생하였습니다.");

			System.out.println("프로필 이미지 변경 imageUpload : " + proImageUpload);
			
			int stdImageUpload = dao.stdImgUpdate(stdVO);
			
			if (stdImageUpload == 1) {
				proVO.setUserImage(img);
				red.addFlashAttribute("message", "프로필 이미지를 변경하였습니다.");
				//req.getSession().setAttribute("user", user);
			}
			if (stdImageUpload != 1)
				red.addFlashAttribute("message", "프로필 이미지를 변경하는 도중에 오류가 발생하였습니다.");

			System.out.println("프로필 이미지 변경 imageUpload : " + stdImageUpload);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//학생 + 교수삭제
	@Override
	public void stdDeletePro(HttpServletRequest req, RedirectAttributes red) {
		String userNum = req.getParameter("userNumber");
		 
		int stdDelete = dao.stdDelete(userNum);
		if (stdDelete != 0)
			red.addFlashAttribute("message", "학생삭제완료.");
		else
			red.addFlashAttribute("message", "학생삭제에러");
	}
	//휴복학 리스트
	@Override
	public void schoolLeaveList(HttpServletRequest req, Model model) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<AdStdVO> vo = dao.getSchoolLeave(map);
		req.setAttribute("getSL", vo);
	}
	
	//장학 심사
	@Override
	public void judge(HttpServletRequest req, Model model) {
		
		//심사 리스트에 담기
		List<auditVO> audit = dao.auditCnt();
		
		//심사리스트 반환
		model.addAttribute("audit", audit);
		
	}
	//장학 심사 완료
	@Override
	public void auditPro(HttpServletRequest req, Model model) {
		String[] checkbox = req.getParameterValues("chk");
		String[] checkbox2 = req.getParameterValues("chk2");
		
		
		if(checkbox != null) {
		int updateCnt =dao.auditupdate(checkbox);
		}
		if(checkbox2 != null) {
		int updateCnt =dao.auditupdate2(checkbox2);
		System.out.println("5555555");
		}
		System.out.println("22222");
		
		
	}
	
	
	
	//---------------교직 업무 관리 START-------------------
	@Override
	public void getMajors(Map<String, Object> map, Model model) {
		List<Major> majors = null;
		
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
		
		if(!map.containsKey("pageSize")) {
			pageSize = 10;
		}else
			pageSize = Integer.parseInt((String)map.get("pageSize"));
		
		if(!map.containsKey("pageNum"))
			pageNum = 1;
		else {
			if(map.get("pageNum") instanceof Integer)
				pageNum = (Integer)map.get("pageNum");
			else if(map.get("pageNum") instanceof String)
				pageNum = Integer.parseInt((String)map.get("pageNum"));
		}
			
		cnt = dao.majorListCount(map);
		
		pageCount = cnt / pageSize + (cnt % pageSize> 0 ? 1:0);
		
		start = (pageNum -1) * pageSize+1;
		end = start + pageSize -1;
		
		map.put("start", start);
		map.put("end", end);
		
		if(end > cnt)
			end = cnt;
		
		number = cnt - (pageNum - 1) * pageSize;
		
		if(cnt > 0) {
			majors = dao.majorList(map);
			model.addAttribute("majors", majors);
		}
		
		startPage = (pageNum / pageBlock) * pageBlock + 1;
		
		if (pageNum % pageBlock == 0)
			startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("pageSize", pageSize);
		}
	}
	
	// 학과 삭제
	@Override
	public Map<String, Object> deleteMajor(Map<String, Object> map) {
		Map<String, Object> resopnseData = new HashMap<String, Object>();
		if(dao.deleteMajor(map)>0)
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
	
	//학과 수정
	@Override
	public Map<String, Object> modifyMajor(Major major) {
		Map<String, Object> resultmap = new HashMap<String, Object>();
		
		resultmap.put("status", dao.modifyMajor(major));
		
		return resultmap;
	}

	
	
	
	
	// 교수의 빈강의시간 조회
	@Override
	public void getEmptyLecTime(String empNumber, Model model) {
		List<Object> days = new ArrayList<Object>();
		List<Object> list = dao.emptyLecTime(empNumber);
		days.add("월");
		days.add("화");
		days.add("수");
		days.add("목");
		days.add("금");
		model.addAttribute("days", days);
		model.addAttribute("dtos", list);
	}
	@Override
	public void judge2(Map<String, Object> map, Logger logger, Model model) {
		int auditct = Integer.parseInt((String)map.get("audit"));
		
		List<auditVO> audit;
		
		
		//심사 리스트
		if(auditct == 2) {
		audit = dao.auditCnt();
		}else{
		audit = dao.auditCnt2(auditct);
		}
		
		//심사리스트 반환
		model.addAttribute("audit", audit);
		
	}
	
	//---------------교직 업무 관리 END-------------------
	
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
	public void insertPayroll(HttpServletRequest req, RedirectAttributes red) {
		payrollVO vo = new payrollVO();
		vo.setImputedYear(req.getParameter("imputedYear")+req.getParameter("imputedMonth"));
		vo.setPaymentClassfication(req.getParameter("paymentClassfication"));
		vo.setBeginningPeriod(Date.valueOf(req.getParameter("beginningPeriod")));
		vo.setEndPeriod(Date.valueOf(req.getParameter("endPeriod")));
		vo.setPaymentDate(Date.valueOf(req.getParameter("paymentDate")));
		vo.setPaymentYear(req.getParameter("paymentYear")+req.getParameter("paymentMonth"));
		vo.setRegisterName(req.getParameter("registerName"));
		
		System.out.println("imputedYear : " + req.getParameter("imputedYear")+req.getParameter("imputedMonth"));
		System.out.println("paymentClassfication :" + req.getParameter("paymentClassfication"));
		System.out.println("beginningPeriod :" + Date.valueOf(req.getParameter("beginningPeriod")));
		System.out.println("endPeriod :" + Date.valueOf(req.getParameter("paymentDate")));
		System.out.println("paymentYear :" + req.getParameter("paymentYear")+req.getParameter("paymentMonth"));
		System.out.println("registerName :" + req.getParameter("registerName"));
		
		int cnt =dao.insertPayroll(vo);
		
		if (cnt == 1) {
		red.addFlashAttribute("message","등록이 완료되었습니다.");
		}
	}
	
}
