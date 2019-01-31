package com.spring.project.professor.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project.professor.dao.ProfesserDAO;
import com.spring.project.professor.vo.myPageVO;
import com.spring.project.professor.vo.studentVO;
import com.spring.project.share.vo.ShareUserInfo;

@Service
public class ProfessorServiceImpl implements ProfessorService {

	@Autowired
	ProfesserDAO dao;

	// 마이페이지
	@Override
	public void myPage(HttpServletRequest req, Model model) {

		String userNumber = (String) req.getSession().getAttribute("userNumber");

		myPageVO vo = dao.myPage(userNumber);

		model.addAttribute("vo", vo);
	}

	// 프로필 이미지 변경
	@Override
	public void imageUpload(MultipartHttpServletRequest req, RedirectAttributes red) {

		MultipartFile file = req.getFile("image");

		String saveDir = req.getSession().getServletContext().getRealPath("/resources/images");
		String realDir = "C:\\Users\\k\\git\\Project_Garbage_Collector\\Undergraduate_Adminisration\\src\\main\\webapp\\resources\\images\\"; // 저장
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

			myPageVO vo = new myPageVO();

			vo.setUserNumber(userNumber);

			String img = "";

			img = "/images/" + image;

			vo.setUserImage(img);

			int imageUpload = dao.imageUpload(vo);

			System.out.println("프로필 이미지 변경 imageUpload : " + imageUpload);
			
			ShareUserInfo user = (ShareUserInfo) req.getSession().getAttribute("user"); 

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

	@Override
	public void introUpdate(HttpServletRequest req, RedirectAttributes red) {

		String userNumber = (String) req.getSession().getAttribute("userNumber");
		String introduction = req.getParameter("introduction");

		myPageVO vo = new myPageVO();

		vo.setUserNumber(userNumber);
		vo.setIntroduction(introduction);

		int introUpdate = dao.introUpdate(vo);

		System.out.println("교수 소개 변경 introUpdate : " + introUpdate);

		if (introUpdate == 1)
			red.addFlashAttribute("message", "교수 소개를 변경하였습니다.");
		if (introUpdate != 1)
			red.addFlashAttribute("message", "교수 소개르 변경하는 도중에 오류가 발생하였습니다.");

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

		myPageVO vo = new myPageVO();
		
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

		if (up == 2)
			red.addFlashAttribute("message", "개인정보를 변경하였습니다.");
		if (up != 2)
			red.addFlashAttribute("message", "개인정보를 변경하는 도중에 오류가 발생하였습니다.");
	}

	//내 강의 학생 목록
	@Override
	public void list(HttpServletRequest req, Model model) {
		
		String userNumber = (String) req.getSession().getAttribute("userNumber");
		
		List<studentVO> list = dao.list(userNumber);
		
		System.out.println("학생조회 list : " + list);
		
		model.addAttribute(list);
		
	}

}
