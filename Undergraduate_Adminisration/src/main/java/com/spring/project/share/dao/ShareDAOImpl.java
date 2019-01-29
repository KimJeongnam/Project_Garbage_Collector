package com.spring.project.share.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.share.vo.ShareUserInfo;

@Repository
public class ShareDAOImpl implements ShareDAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public ShareUserInfo getStudentInfo(String userNumber) {
		return sqlSession.selectOne("com.spring.project.share.dao.ShareDAO.getStudentInfo", userNumber);
	}

	@Override
	public ShareUserInfo getEmployeeInfo(String userNumber) {
		return sqlSession.selectOne("com.spring.project.share.dao.ShareDAO.getEmployeeInfo", userNumber);
	}
	
}
