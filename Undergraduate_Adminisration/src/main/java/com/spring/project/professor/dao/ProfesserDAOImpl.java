package com.spring.project.professor.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.professor.vo.classStudentVO;
import com.spring.project.professor.vo.myClassVO;
import com.spring.project.professor.vo.myPageVO;
import com.spring.project.professor.vo.searchVO;
import com.spring.project.professor.vo.studentVO;

@Repository
public class ProfesserDAOImpl implements ProfesserDAO{

	@Autowired
	private SqlSession sql;
	
	//마이페이지
	@Override
	public myPageVO myPage(String userNumber) {
		return sql.selectOne("com.spring.project.professor.dao.ProfesserDAO.myPage",userNumber);
	}

	//프로필 이미지 변경
	@Override
	public int imageUpload(myPageVO vo) {
		
		System.out.println(vo);
		
		int imageUpload=0;
		
		ProfesserDAO dao = sql.getMapper(ProfesserDAO.class);
		
		imageUpload=dao.imageUpload(vo);
		
		System.out.println(imageUpload==1?"프로필 이미지 변경 성공!":"프로필 이미지 변경 실패!");
		
		return imageUpload;
	}
	//교수 소개 변경
	@Override
	public int introUpdate(myPageVO vo) {
		
		System.out.println(vo);
		
		int introUpdate=0;
		
		ProfesserDAO dao = sql.getMapper(ProfesserDAO.class);
		
		introUpdate=dao.introUpdate(vo);
		
		System.out.println(introUpdate==1?"교수 소개  변경 성공!":"교수 소개 변경 실패!");
		
		return introUpdate;
	}
	
	//개인정보 업데이트1
	@Override
	public int update(myPageVO vo) {
		
		System.out.println(vo);
		
		int update=0;
		
		ProfesserDAO dao = sql.getMapper(ProfesserDAO.class);
		
		update=dao.update(vo);
		
		System.out.println(update==1?"개인정보 변경 성공!":"개인정보 변경 실패!");
		
		return update;
	}
	//개인정보 업데이트2
	@Override
	public int update2(myPageVO vo) {
		
		System.out.println(vo);
		
		int update2=0;
		
		ProfesserDAO dao = sql.getMapper(ProfesserDAO.class);
		
		update2=dao.update2(vo);
		
		System.out.println(update2==1?"개인정보 변경 성공!":"개인정보 변경 실패!");
		
		return update2;
	}
	//내 강의 학생 목록
	@Override
	public List<studentVO> list(String userNumber) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.list",userNumber);
	}
	//내 강의 목록
	@Override
	public List<myClassVO> myClass(String userNumber) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.myClass",userNumber);
	}
	//강의별 수강 학생 목록
	@Override
	public List<classStudentVO> getStudent(Map<String, Object> map) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.getStudent",map);
	}

	@Override
	public List<searchVO> search_student(Map<String, Object> map) {
		return sql.selectList("com.spring.project.professor.dao.ProfesserDAO.search_student",map);
	}



}
