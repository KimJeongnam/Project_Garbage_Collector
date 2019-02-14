package com.spring.project.professor.dao;



import java.util.List;
import java.util.Map;

import com.spring.project.professor.vo.classStudentVO;
import com.spring.project.professor.vo.myClassVO;
import com.spring.project.professor.vo.myPageVO;
import com.spring.project.professor.vo.searchVO;
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
	//내 강의 목록
	List<myClassVO> myClass(String userNumber);
	//강의별 수강학생목록
	List<classStudentVO> getStudent(Map<String, Object> map);
	//학생검색
	List<searchVO> search_student(Map<String, Object> map);
	


}
