package com.spring.project.professor.dao;



import java.util.List;
import java.util.Map;

import com.spring.project.professor.vo.ClassStudentVO;
import com.spring.project.professor.vo.LecScore;
import com.spring.project.professor.vo.LectureP_VO;
import com.spring.project.professor.vo.MyClassVO;
import com.spring.project.professor.vo.MyPageVO;
import com.spring.project.professor.vo.PersonnelVO;
import com.spring.project.professor.vo.PlanVO;
import com.spring.project.professor.vo.Report_tblVO;
import com.spring.project.professor.vo.SearchVO;
import com.spring.project.professor.vo.StudentVO;
import com.spring.project.professor.vo.Submission_ListVO;

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
	List<PlanVO> plan(String userNumber);
	List<PlanVO> plan2(String userNumber);
	List<PlanVO> firstPlan(Map<String, Object> map);
	List<PlanVO> getPlan(Map<String, Object> map);
	
	//강의계획서 입력
	public int insertPlan(PlanVO vo);
	public int updatePlan(PlanVO vo);

	//과제관리
	public List<LectureP_VO>P_Lecture(String userNumber);
	public int personnel(Map<String, Object> map);
	public int p_report(Map<String, Object> map);
	public int re_contentform(Report_tblVO vo);
	public int p_reportupdate(Report_tblVO vo);
	public int p_reportdelete(int reportcode);
	public int codeCnt(int reportcode);
	public Report_tblVO re_submit(Map<String, Object> map);
	public List<Report_tblVO> task_lookup(Map<String, Object> map);
	public List<Submission_ListVO> submissionlist(int reportcode);
	
}