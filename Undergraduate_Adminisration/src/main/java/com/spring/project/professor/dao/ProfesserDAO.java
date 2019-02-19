package com.spring.project.professor.dao;



import java.util.List;
import java.util.Map;

import com.spring.project.professor.vo.ClassStudentVO;
import com.spring.project.professor.vo.LecScore;
import com.spring.project.professor.vo.MyClassVO;
import com.spring.project.professor.vo.MyPageVO;
import com.spring.project.professor.vo.SearchVO;
import com.spring.project.professor.vo.StudentVO;

public interface ProfesserDAO {
	
	//마이페이지
	public MyPageVO myPage(String userNumber);
	
	//마이페이지 이미지 변경
	public int imageUpload(MyPageVO vo);
	
	//교수 소개 변경
	public int introUpdate(MyPageVO vo);
	
	
	//개인정보 업데이트1
	public int update(MyPageVO vo);
	//개인정보 업데이트2
	public int update2(MyPageVO vo);
	
	
	
	
	//내 강의 학생 
	List<StudentVO>list(String userNumber);
	//내 강의 목록
	List<MyClassVO> myClass(String userNumber);
	//강의별 수강학생목록
	List<ClassStudentVO> getStudent(Map<String, Object> map);
	//학생검색
	List<SearchVO> search_student(Map<String, Object> map);
	List<SearchVO> search_student_click(Map<String, Object> map);

	//학점관리 진입
	List<MyClassVO> s_myClass(String userNumber);
	List<MyClassVO> v_myClass(String userNumber);
	List<LecScore> firstLec(Map<String, Object> map);
	List<LecScore> getLecScore(Map<String, Object> map);
	
	//학점입력
	public int insertScore(LecScore vo);
	//학점수정
	public int updateScore(LecScore vo);
	
	
	//강의계획
	
	//과제관리

	
}