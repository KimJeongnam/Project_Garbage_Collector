package com.spring.project.student.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.admin.vo.ScholarpkVO;
import com.spring.project.student.vo.GpaVO;
import com.spring.project.student.vo.LectureVO;

@Repository
public class StudentDAOImpl implements StudentDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	// 수강신청 목록 갯수 구하기
	@Override
	public int getLectureCnt(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.getLectureCnt", map);
	}

	// 수강신청 목록 조회
	@Override
	public List<LectureVO> lectureList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.lectureList", map);
	}

	// 시간표 조회
	@Override
	public List<LectureVO> schoolTimeTable(String userNumber) {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.schoolTimeTable", userNumber);
	}
		
	// 시간표 Hover
	@Override
	public List<LectureVO> lectureHover(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.lectureHover", map);
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
	//장학금 글 갯수
	@Override
	public int getArticleCnt() {
		int selectCnt = sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.getArticleCnt");
		return selectCnt;
	}
	//장학금 글 목록
	@Override
	public List<ScholarpkVO> getArticleList(Map<String, Object> map) {
		List<ScholarpkVO> dtos = sqlSession.selectList("com.spring.project.admin.dao.AdminDAO.getArticleList",map);
		
		return dtos;
	}
	//장학금 상세 
	@Override
	public ScholarpkVO getArticle(int scholarpk) {
		ScholarpkVO dtos = sqlSession.selectOne("com.spring.project.admin.dao.AdminDAO.getArticle",scholarpk);
		return dtos;
	}
	//장학금 중복확인 검사
	@Override
	public int scholarpk(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.scholarpk", map);
	}
	
	//장학금 신청완료 
	public int scholarshipinsert(Map<String, Object> map) {
		int Cnt = sqlSession.insert("com.spring.project.student.dao.StudentDAO.scholarshipinsert",map);
		return Cnt;
	}

	

	@Override
	public List<LectureVO> studentMyLecture(String userNumber) {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.studentMyLecture", userNumber);
	}

	@Override
	public int cancelLecture(Map<String, Object> map) {
		return sqlSession.delete("com.spring.project.student.dao.StudentDAO.cancelLecture", map);
	}
	
	// 강의 목록 조회(전공)
	@Override
	public List<LectureVO> getMajor() {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.getMajor");
	}

	// 내 학점 조회
	@Override
	public List<GpaVO> GPA(String userNumber) {
		return sqlSession.selectList("com.spring.project.student.dao.StudentDAO.GPA", userNumber);
	}
	
	// 신청 학점
	@Override
	public int ApplyCredit(String userNumber) {
		return sqlSession.selectOne("com.spring.project.student.dao.StudentDAO.ApplyCredit", userNumber);
	}


	

	

	

	

	

}
