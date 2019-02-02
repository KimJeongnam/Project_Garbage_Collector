package com.spring.project.professor.dao;



import java.util.List;

import com.spring.project.professor.vo.myPageVO;
import com.spring.project.professor.vo.studentVO;

public interface ProfesserDAO {
	
	//마이페이지
	public myPageVO myPage(String userNumber);
	
	//마이페이지 이미지 변경
	public int imageUpload(myPageVO vo);
	
	//교수 소개 변경
	public int introUpdate(myPageVO vo);
	
	//개인정보 업데이트1
	public int update(myPageVO vo);
	//개인정보 업데이트2
	public int update2(myPageVO vo);
	
	//내 강의 학생 
	List<studentVO>list(String userNumber);
	


}
