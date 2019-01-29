package com.spring.project.student.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.vo.LectureVO;

@Repository
public class StudentDAOImpl implements StudentDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	// 학과 번호 가져오기
	@Override
	public int getMajorNum(String userId) {
		return sqlSession.selectOne("com.spring.project.student.dao.stuentDAO.getMajorNum", userId);
	}
	
	// 수강신청 목록 갯수 구하기
	@Override
	public int getLectureCnt(int majorNum) {
		return sqlSession.selectOne("com.spring.project.student.dao.stuentDAO.getLectureCnt", majorNum);
	}

	// 수강신청 목록 조회
	@Override
	public List<LectureVO> lectureList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.student.dao.stuentDAO.lectureList", map);
	}

	

}
