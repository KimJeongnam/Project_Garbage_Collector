package com.spring.project.student.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.student.vo.LectureVO;

@Repository
public class StudentDAOImpl implements StudentDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	// 수강신청 목록 갯수 구하기
	@Override
	public int getLectureCnt() {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.getLectureCnt");
	}

	// 수강신청 목록 조회
	@Override
	public List<LectureVO> lectureList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.lectureList", map);
	}

	// 강의 검색 리스트 갯수
	@Override
	public int getLectureSearchCnt(String keyword) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.getLectureSearchCnt", keyword);
	}
	
	// 강의 검색
	@Override
	public List<LectureVO> lectureSearch(String keyword) {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.lectureSearch", keyword);
	}
	
	// 시간표 조회
	@Override
	public List<LectureVO> schoolTimeTable(String userNumber) {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.schoolTimeTable", userNumber);
	}
	
	// 강의 체크
	@Override
	public int checkLecture(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.checkLecture", map);
	}
	
	// 강의 인원수 체크
	@Override
	public int checkStudentInLecture(String lecCode) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.checkStudentInLecture", lecCode);
	}
	
	// 강의 인원수 체크
	@Override
	public int checkStudentInLecture2(Map<String, Object> map2) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.checkStudentInLecture2", map2);
	}
		
	// 강의 신청
	@Override
	public int applyLecture(Map<String, Object> map) {
		return sqlSession.insert("com.spring.project.student.dao.StudentDAO.applyLecture", map);
	}

	

	

	

	

}