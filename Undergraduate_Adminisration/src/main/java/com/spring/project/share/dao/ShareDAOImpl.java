package com.spring.project.share.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.restful.vo.Message;
import com.spring.project.share.vo.Major;
import com.spring.project.share.vo.ShareUserInfo;

@Repository
public class ShareDAOImpl implements ShareDAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public ShareUserInfo getStudentInfo(String userNumber) {
		//ShareDAO.getQuery(sqlSession, "ShareUserInfo", userNumber);
		return sqlSession.selectOne("com.spring.project.share.dao.ShareDAO.getStudentInfo", userNumber);
	}

	@Override
	public ShareUserInfo getEmployeeInfo(String userNumber) {
		return sqlSession.selectOne("com.spring.project.share.dao.ShareDAO.getEmployeeInfo", userNumber);
	}

	@Override
	public int messageTotalCnt(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.project.share.dao.ShareDAO.messageTotalCnt", map);
	}

	@Override
	public List<Message> getMessages(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.share.dao.ShareDAO.getMessages", map);
	}

	@Override
	public List<String> getFacultys() {
		return sqlSession.selectList("com.spring.project.share.dao.ShareDAO.getFacultys");
	}

	@Override
	public int getMajorCurrval() {
		return sqlSession.selectOne("com.spring.project.share.dao.ShareDAO.getMajorCurrval");
	}

	@Override
	public List<Major> getMajors(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.project.share.dao.ShareDAO.getMajors", map);
	}
}
