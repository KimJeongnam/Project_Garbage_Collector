package com.spring.project.restful.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project.restful.vo.Message;

@Repository
public class RestfulDAOImpl implements RestfulDAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Message> getMessages(String userNumber) {
		return sqlSession.selectList("com.spring.project.restful.dao"
				+ ".RestfulDAO.getMessages", userNumber);
	}
	
}
