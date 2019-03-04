package com.spring.project.professor.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class ProfesserDAOImpl implements ProfesserDAO{

	@Autowired
	private SqlSession sql;
	
	//마이페이지
	@Override
	public MyPageVO myPage(String userNumber) {
		return sql.selectOne("com.spring.project.professor.dao.ProfesserDAO.myPage",userNumber);
	}

	//프로필 이미지 변경
	@Override
	public int imageUpload(MyPageVO vo) {
		
		System.out.println(vo);
		
		int imageUpload=0;
		
		ProfesserDAO dao = sql.getMapper(ProfesserDAO.class);
		
		imageUpload=dao.imageUpload(vo);
		
		System.out.println(imageUpload==1?"프로필 이미지 변경 성공!":"프로필 이미지 변경 실패!");
		
		return imageUpload;
	}
	//교수 소개 변경
	@Override
	public int introUpdate(MyPageVO vo) {
		
		System.out.println(vo);
		
		int introUpdate=0;
		
		ProfesserDAO dao = sql.getMapper(ProfesserDAO.class);
		
		introUpdate=dao.introUpdate(vo);
		
		System.out.println(introUpdate==1?"교수 소개  변경 성공!":"교수 소개 변경 실패!");
		
		return introUpdate;
	}
	
	//개인정보 업데이트1
	@Override
	public int update(MyPageVO vo) {
		
		System.out.println(vo);
		
		int update=0;
		
		ProfesserDAO dao = sql.getMapper(ProfesserDAO.class);
		
		update=dao.update(vo);
		
		System.out.println(update==1?"개인정보 변경 성공!":"개인정보 변경 실패!");
		
		return update;
	}
	//개인정보 업데이트2
	@Override
	public int update2(MyPageVO vo) {
		
		System.out.println(vo);
		
		int update2=0;
		
		ProfesserDAO dao = sql.getMapper(ProfesserDAO.class);
		
		update2=dao.update2(vo);
		
		System.out.println(update2==1?"개인정보 변경 성공!":"개인정보 변경 실패!");
		
		return update2;
	}
	//내 강의 학생 목록
	@Override
	public List<StudentVO> list(String userNumber) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.list",userNumber);
	}
	//내 강의 목록
	@Override
	public List<MyClassVO> myClass(String userNumber) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.myClass",userNumber);
	}
	//강의별 수강 학생 목록
	@Override
	public List<ClassStudentVO> getStudent(Map<String, Object> map) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.getStudent",map);
	}
	//수강생 검색
	@Override
	public List<SearchVO> search_student(Map<String, Object> map) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.search_student",map);
	}
	//수강생이 듣는 내 강의 목록
	@Override
	public List<SearchVO> search_student_click(Map<String, Object> map) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.search_student_click",map);
	}
	//학점관리 진입
	@Override
	public List<MyClassVO> s_myClass(String userNumber) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.s_myClass",userNumber);
	}
	//학점관리 진입2
	@Override
	public List<MyClassVO> v_myClass(String userNumber) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.v_myClass",userNumber);
	}
	//학점관리 첫 탭
	@Override
	public List<LecScore> firstLec(Map<String, Object> map) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.firstLec",map);
	}
	//학점관리 나머지 탭
	@Override
	public List<LecScore> getLecScore(Map<String, Object> map) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.getLecScore",map);
	}
	//학점입력
	@Override
	public int insertScore(LecScore vo) {
		System.out.println(vo);
		
		int insertScore=0;
		
		ProfesserDAO dao = sql.getMapper(ProfesserDAO.class);
		
		insertScore=dao.insertScore(vo);
		
		System.out.println(insertScore==1?"학점 입력 성공!":"학점 입력 실패!");
		
		return insertScore;
	}
	//학점수정
	@Override
	public int updateScore(LecScore vo) {
		System.out.println(vo);
		
		int updateScore=0;
		
		ProfesserDAO dao = sql.getMapper(ProfesserDAO.class);
		
		updateScore=dao.updateScore(vo);
		
		System.out.println(updateScore==1?"학점 수정 성공!":"학점 수정 실패!");
		
		return updateScore;
	}
	
	@Override
	public List<PlanVO> plan(String userNumber) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.plan",userNumber);
	}
	@Override
	public List<PlanVO> plan2(String userNumber) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.plan2",userNumber);
	}

	@Override
	public List<PlanVO> firstPlan(Map<String, Object> map) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.firstPlan",map);
	}

	@Override
	public List<PlanVO> getPlan(Map<String, Object> map) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.getPlan",map);
	}
	//강의계획서 입력
	@Override
	public int insertPlan(PlanVO vo) {
		System.out.println(vo);
		
		int insertPlan=0;
		
		ProfesserDAO dao = sql.getMapper(ProfesserDAO.class);
		
		insertPlan=dao.insertPlan(vo);
		
		System.out.println(insertPlan==1?"강의계획서 입력 성공!":"강의계획서 입력 실패!");
		
		return insertPlan;
	}
	//강의계획서 수정
	@Override
	public int updatePlan(PlanVO vo) {
		System.out.println(vo);
		
		int updatePlan=0;
		
		ProfesserDAO dao = sql.getMapper(ProfesserDAO.class);
		
		updatePlan=dao.updatePlan(vo);
		
		System.out.println(updatePlan==1?"강의계획서 수정 성공!":"강의계획서 수정 실패!");
		
		return updatePlan;
	}
	//과제관리
	//대그니꼬!
	@Override
	public List<LectureP_VO> P_Lecture(String userNumber) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.P_Lecture",userNumber);
	}
	//총 수강 인원
	@Override
	public int personnel(Map<String, Object> map) {
		return sql.selectOne("com.spring.project.professor.dao.ProfesserDAO.personnel",map);
	}
	//과제 있는지 여부
	@Override
	public int p_report(Map<String, Object> map) {
		return sql.selectOne("com.spring.project.professor.dao.ProfesserDAO.p_report",map);
	}
	//과제 첫번째
	@Override
	public Report_tblVO re_submit(Map<String, Object> map) {
		return sql.selectOne("com.spring.project.professor.dao.ProfesserDAO.re_submit",map);
	}
	
	//과제 제출 갯수
	@Override
	public int codeCnt(int reportcode) {
		return sql.selectOne("com.spring.project.professor.dao.ProfesserDAO.codeCnt",reportcode);
	}
	
	//과제 추가
	@Override
	public int re_contentform(Report_tblVO vo) {
		return sql.insert("com.spring.project.professor.dao.ProfesserDAO.re_contentform",vo);
	}
	
	//과제 수정
	@Override
	public int p_reportupdate(Report_tblVO vo) {
		return sql.update("com.spring.project.professor.dao.ProfesserDAO.p_reportupdate",vo);
	}
	
	//과제 삭제
	@Override
	public int p_reportdelete(int reportcode) {
		return sql.delete("com.spring.project.professor.dao.ProfesserDAO.p_reportdelete",reportcode);
	}
	//과제 리스트
	@Override
	public List<Report_tblVO> task_lookup(Map<String, Object> map) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.task_lookup",map);
	}
	
	//과제 제출 리스트
	@Override
	public List<Submission_ListVO> submissionlist(int reportcode) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.submissionlist",reportcode);
	}

}
