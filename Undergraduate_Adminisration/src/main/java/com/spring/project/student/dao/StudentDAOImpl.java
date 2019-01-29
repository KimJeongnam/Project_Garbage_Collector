package com.spring.project.student.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class StudentDAOImpl implements StudentDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	// 학과 번호 가져오기
	@Override
	public String getMajorNum(String userId) {
		return sqlSession.selectOne("com.spring.project.student.dao.stuentDAO.getMajorNum", userId);
	}
	
	// 수강신청 목록 갯수 구하기
	@Override
	public int getLectureCnt(String majorNum) {
		return sqlSession.selectOne("com.spring.project.student.dao.stuentDAO.getLectureCnt", majorNum);
	}

	

}
