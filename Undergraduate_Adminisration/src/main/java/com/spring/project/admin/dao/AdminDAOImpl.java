package com.spring.project.admin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.admin.vo.AdStdVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	//사용자 등록
	@Override
	public int insertUsers(AdStdVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.insertStudent", vo);
		
	}
	// 권한등록
	@Override
	public int insertAuthority(AdStdVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.insertStudent", vo);

	}
	//학생등록
	@Override
	public int insertStudent(AdStdVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.insertStudent", vo);

	}
	//학적등록
	@Override
	public int insertStdState(AdStdVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.insertStudent", vo);

	}
	//학부등록
	@Override
	public int insertFaculty(AdStdVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.insertStudent", vo);

	}
	//학과 등록
	@Override
	public int insertMajor(AdStdVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.insertStudent", vo);

	}
	//휴복학 등록
	@Override
	public int insertSchoolLeave(AdStdVO vo) {
		return sqlSession.insert("com.spring.project.admin.dao.insertStudent", vo);

	}
	


}
