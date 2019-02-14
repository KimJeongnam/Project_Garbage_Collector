package com.spring.project.professor.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.professor.vo.ClassStudentVO;
import com.spring.project.professor.vo.LecScore;
import com.spring.project.professor.vo.MyClassVO;
import com.spring.project.professor.vo.MyPageVO;
import com.spring.project.professor.vo.SearchVO;
import com.spring.project.professor.vo.StudentVO;

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
	//학점관리 진입
	@Override
	public List<MyClassVO> s_myClass(String userNumber) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.s_myClass",userNumber);
	}
	@Override
	public List<MyClassVO> v_myClass(String userNumber) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.v_myClass",userNumber);
	}

	@Override
	public List<LecScore> firstLec(Map<String, Object> map) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.firstLec",map);
	}
	@Override
	public List<LecScore> getLecScore(Map<String, Object> map) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.getLecScore",map);
	}



}
